import 'package:community_material_icon/community_material_icon.dart';
import 'package:deedee/ui/page/map_cubit/map_screen.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({
    super.key,
    required this.size,
    required DeeDeeSliderController pc,
    required String selectedMessengerId,
  })  : _pc = pc,
        _selectedMessengerId = selectedMessengerId;

  final Size size;
  final DeeDeeSliderController _pc;
  final String _selectedMessengerId;

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      defaultPanelState: PanelState.CLOSED,
      minHeight: size.height * 0,
      maxHeight: size.height * 0.5,
      controller: _pc,
      header: Container(
        margin: EdgeInsets.fromLTRB(size.width / 2 - 30, 10.0, 24.0, 0.0),
        width: 60,
        height: 7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.black,
        ),
      ),
      panel: Column(
        children: <Widget>[
          const SizedBox(height: 30),
          Row(
            children: [
              const SizedBox(width: 20),
              const Icon(
                Icons.account_box_sharp,
                size: 26.0,
              ),
              const SizedBox(width: 10),
              Text(_selectedMessengerId,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              const SizedBox(width: 40),
              const Icon(Icons.star_rounded,
                  size: 26.0, color: Colors.deepPurple),
              const Icon(Icons.star_rounded,
                  size: 26.0, color: Colors.deepPurple),
              const Icon(Icons.star_rounded,
                  size: 26.0, color: Colors.deepPurple),
              const Icon(Icons.star_rounded,
                  size: 26.0, color: Colors.deepPurple),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            children: const <Widget>[
              SizedBox(width: 13),
              Text('# lorem # ipsum',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  )),
              SizedBox(width: 210),
              Icon(
                CommunityMaterialIcons.whatsapp,

                size: 26.0,
                // color: Colors.green,
              ),
              Icon(
                Icons.telegram_sharp,
                size: 26.0,
                // color: Colors.blue,
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2023, 1),
                    lastDate: DateTime(2024, 12),
                  );
                },
                icon: const Icon(
                  Icons.calendar_month_rounded,
                  size: 26.0,
                ),
              ),
              const Text('Записаться',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  )),
              const Icon(
                Icons.message,
                size: 26.0,
              ),
              const Text('Спросить',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  )),
              const Icon(Icons.phone, size: 26.0, color: Colors.black),
              const Text('пн-пт 9.00 - 21.00',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ))
            ],
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    // setState(() {
                    //   click = !click;
                    // });
                  },
                  // icon: Icon(
                  //     size: 26.0,
                  //     click ? Icons.favorite_border : Icons.favorite),
                  // color: click ? Colors.black : Colors.red,
                  icon: const Icon(size: 26.0, Icons.favorite_border),
                  color: Colors.black,
                  splashRadius: 50,
                  splashColor: Colors.lightGreenAccent),
              const Text('В избранное',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  )),
              const SizedBox(width: 80),
              IconButton(
                onPressed: () {
                  // setState(() {
                  //   click_bm = !click_bm;
                  // });
                },
                // icon: Icon(
                //     size: 26.0,
                //     click_bm
                //         ? Icons.bookmark_add_outlined
                //         : Icons.bookmark_add),
                // color: click_bm ? Colors.black : Colors.red,
                icon: const Icon(size: 26.0, Icons.bookmark_add_outlined),
                color: Colors.black,
              ),
              const Text('В закладки',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ))
            ],
          ),
        ],
      ),
      borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
    );
  }
}
