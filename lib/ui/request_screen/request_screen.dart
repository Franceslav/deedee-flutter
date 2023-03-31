import 'package:deedee/constants.dart';
import 'package:deedee/ui/deedee_button/deedee_button.dart';
import 'package:deedee/ui/global_widgets/dee_dee_devider_widget.dart';
import 'package:deedee/ui/global_widgets/dee_dee_row_info_widget.dart';
import 'package:deedee/ui/global_widgets/dee_dee_toggle_button.dart';
import 'package:deedee/ui/global_widgets/deedee_appbar.dart';
import 'package:deedee/ui/page/account/account_info_widget.dart';
import 'package:deedee/ui/request_screen/request_expansion_tile.dart';
import 'package:deedee/ui/theme/app_text_theme.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({Key? key}) : super(key: key);

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final PanelController _controller = PanelController();
    final user = context.select((UserBloc bloc) => bloc.state.user);
    final bloc = UserBloc();

    return Scaffold(
      appBar: DeeDeeAppBar(
        title: locale.request,
        controller: _controller,
        child: const Icon(Icons.menu),
      ),
      body: BlocConsumer<UserBloc, UserState>(
          bloc: bloc,
          listener: (context, state) {},
          builder: (context, state) {
            return SafeArea(
              child: Stack(
                children: [
                  SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 32),
                          const AccountInfoWidget(),
                          const SizedBox(height: 32),
                          DeeDeeRowInfoWidget(
                            icon: Image.asset('assets/images/header_icon.png'),
                            mainText: const Text(
                              'Заголовок',
                              style: AppTextTheme.bodyLarge,
                            ),
                            secondaryText: const Text(
                              'Дополнительный текст',
                              style: AppTextTheme.bodyMedium,
                            ),
                            onTap: () {},
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: DeeDeeDeviderWidget(),
                          ),
                          const Text('Описание',
                              style: AppTextTheme.titleMedium),
                          const Text('Lorem ipsum',
                              style: AppTextTheme.labelMedium),
                          const SizedBox(height: 48),
                          Text(locale.date, style: AppTextTheme.titleMedium),
                          const SizedBox(height: 6),
                          RequestExpansionTile(data: const [
                            '28.03.2023',
                            '8.03.2023',
                            '15.06.2023',
                            '15.06.2023',
                            '15.06.2023',
                            '15.06.2023',
                            '15.06.2023',
                            '15.06.2023'
                          ]),
                          const SizedBox(height: 16),
                          Text(locale.time, style: AppTextTheme.titleMedium),
                          const SizedBox(height: 6),
                          RequestExpansionTile(data: const [
                            '8:00 - 20:00',
                            '9:00 - 14:00',
                            '12:00 - 22:00',
                            '8:00 - 20:00',
                            '9:00 - 14:00',
                            '12:00 - 22:00'
                          ]),
                          const SizedBox(height: 16),
                          const Text('Описание',
                              style: AppTextTheme.titleMedium),
                          const SizedBox(height: 12),
                          const Text('Описание',
                              style: AppTextTheme.titleMedium),
                          const SizedBox(height: 12),
                          const Text('Описание',
                              style: AppTextTheme.titleMedium),
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: DeeDeeButton(
                        title: locale.accept,
                        onPressed: () {},
                        gradientButton: true,
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
