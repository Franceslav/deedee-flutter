import 'package:deedee/constants.dart';
import 'package:flutter/material.dart';

class RequestExpansionTile extends StatefulWidget {
  final List<String> data;
  final void Function(String)? onTap;

  RequestExpansionTile({Key? key, required this.data, required this.onTap})
      : super(key: key);

  @override
  State<RequestExpansionTile> createState() => _RequestExpansionTileState();
}

class _RequestExpansionTileState extends State<RequestExpansionTile> {
  var selectedIndex = 0;
  bool isExpanded = false;
  late String selectedValue;

  @override
  void initState() {
    selectedValue = widget.data.first;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(TILE_COLOR),
      margin: EdgeInsets.zero,
      child: ExpansionTile(
        title: Text(widget.data[selectedIndex]),
        expandedCrossAxisAlignment: CrossAxisAlignment.end,
        textColor: Colors.black,
        maintainState: true,
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
                  child: ListView.builder(
                    itemCount: widget.data.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 44,
                        child: ListTile(
                          title: Text(widget.data[index]),
                          tileColor: const Color(TILE_COLOR),
                          trailing: selectedIndex == index
                              ? const Icon(Icons.check)
                              : null,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          onTap: (widget.onTap == null)
                              ? null
                              : () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                  widget.onTap!(widget.data[index]);
                                },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
