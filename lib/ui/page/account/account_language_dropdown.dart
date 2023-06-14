import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants.dart';
import 'account_bloc.dart';

class Language {
  late String language;
  late String flagImagePath;
  late String langLabel;

  Language(
      {required this.language,
      required this.flagImagePath,
      required this.langLabel});
}

class LanguagesExpansionTile extends StatefulWidget {
  final List<Language> data = [
    Language(
        language: 'Amharic',
        flagImagePath: 'assets/images/am.png',
        langLabel: 'am'),
    Language(
        language: 'Arabic',
        flagImagePath: 'assets/images/ar.png',
        langLabel: 'ar'),
    Language(
        language: 'Chinese',
        flagImagePath: 'assets/images/zh.png',
        langLabel: 'zh'),
    Language(
        language: 'Danish',
        flagImagePath: 'assets/images/da.png',
        langLabel: 'da'),
    Language(
        language: 'English',
        flagImagePath: 'assets/images/en.png',
        langLabel: 'en'),
    Language(
        language: 'French',
        flagImagePath: 'assets/images/fr.png',
        langLabel: 'fr'),
    Language(
        language: 'Hebrew',
        flagImagePath: 'assets/images/he.png',
        langLabel: 'he'),
    Language(
        language: 'Hindi',
        flagImagePath: 'assets/images/hi.png',
        langLabel: 'hi'),
    Language(
        language: 'Italian',
        flagImagePath: 'assets/images/it.png',
        langLabel: 'it'),
    Language(
        language: 'Kazakh',
        flagImagePath: 'assets/images/kz.png',
        langLabel: 'kk'),
    Language(
        language: 'Korean',
        flagImagePath: 'assets/images/ko.png',
        langLabel: 'ko'),
    Language(
        language: 'Kyrgiz',
        flagImagePath: 'assets/images/ky.png',
        langLabel: 'ky'),
    Language(
        language: 'Polish',
        flagImagePath: 'assets/images/pl.png',
        langLabel: 'pl'),
    Language(
        language: 'Portuguese',
        flagImagePath: 'assets/images/pt.png',
        langLabel: 'pt'),
    Language(
        language: 'Russian',
        flagImagePath: 'assets/images/ru.png',
        langLabel: 'ru'),
    Language(
        language: 'Spanish',
        flagImagePath: 'assets/images/es.png',
        langLabel: 'es'),
    Language(
        language: 'Swedish',
        flagImagePath: 'assets/images/sv.png',
        langLabel: 'sv'),
    Language(
        language: 'Thai',
        flagImagePath: 'assets/images/tha.png',
        langLabel: 'th'),
    Language(
        language: 'Ukrainian',
        flagImagePath: 'assets/images/uk.png',
        langLabel: 'uk'),
    Language(
        language: 'Uzbek',
        flagImagePath: 'assets/images/uz.png',
        langLabel: 'uz'),
  ];


  LanguagesExpansionTile({
    Key? key,
  }) : super(key: key);

  @override
  State<LanguagesExpansionTile> createState() => _LanguagesExpansionTileState();
}

class _LanguagesExpansionTileState extends State<LanguagesExpansionTile> {
  var selectedIndex = 0;
  bool isExpanded = false;
  late Language selectedValue;


  @override
  Widget build(BuildContext context) {
    selectedIndex = getLangIndex(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 1.0,
        color: const Color(TILE_COLOR),
        margin: EdgeInsets.zero,
        child: ExpansionTile(
          // key: GlobalKey(),
          title: Text(
            widget.data[selectedIndex].language,
            style: const TextStyle(fontSize: 19),
          ),
          expandedCrossAxisAlignment: CrossAxisAlignment.end,
          textColor: Colors.black,
          maintainState: true,
          leading: CircleAvatar(
            radius: 18,
            child: Image.asset(widget.data[selectedIndex].flagImagePath),
          ),
          trailing: isExpanded
              ? const Icon(
                  Icons.keyboard_arrow_up_sharp,
                  size: 34,
                  color: Colors.grey,
                )
              : const Icon(
                  Icons.keyboard_arrow_down_sharp,
                  size: 34,
                  color: Colors.grey,
                ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onExpansionChanged: (bool expanding) =>
              setState(() => isExpanded = expanding),
          children: [
            Column(
              children: [
                SingleChildScrollView(
                  child: SizedBox(
                    height: 220,
                    child: Scrollbar(
                      thickness: 10,
                      child: ListView.builder(
                        itemCount: widget.data.length,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          widget.data
                              .sort((a, b) => a.language.compareTo(b.language));

                          return ListTile(
                            title: Text(
                              widget.data[index].language,
                              style: const TextStyle(fontSize: 18),
                            ),
                            tileColor: const Color(TILE_COLOR),
                            leading: CircleAvatar(
                              radius: 18,
                              child:
                                  Image.asset(widget.data[index].flagImagePath),
                            ),
                            trailing: selectedIndex == index
                                ? const Icon(
                                    Icons.check,
                                    color: Colors.green,
                                  )
                                : null,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            onTap: () {
                              setState(() {
                                ExpansionTileController.of(context).collapse();
                                context
                                    .read<AccountBloc>()
                                    .changeLocal(widget.data[index].langLabel);
                              });
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  int getLangIndex(BuildContext context) {
    try {
      Locale locale = context.read<AccountBloc>().appLocal ??
          Localizations.localeOf(context);
      return widget.data.indexOf(
        widget.data.firstWhere(
          (element) => element.langLabel == locale.languageCode,
        ),
      );
    } catch (e) {
      return 0;
    }
  }
}
