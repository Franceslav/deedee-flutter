import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CarouselItem extends StatefulWidget {
  final int dataId;

  CarouselItem({super.key, required int this.dataId});
  @override
  createState() => CarouselItemState(dataId);
}

class CarouselItemState extends State<CarouselItem> {
  int dataId;

  CarouselItemState(this.dataId);


  CarouselItemState(this.dataId);

  setTitle() {
    switch (dataId) {
      case 0:
        return AppLocalizations.of(context)!.autoTag.toString();

      case 1:
        return AppLocalizations.of(context)!.beautyTag.toString();

      case 2:
        return AppLocalizations.of(context)!.decoratingTag.toString();

      case 3:
        return AppLocalizations.of(context)!.childrenTag.toString();

      case 4:
        return AppLocalizations.of(context)!.workersTag.toString();

      case 5:
        return AppLocalizations.of(context)!.cleaningTag.toString();
    }
  }

  String _getImagePath(int dataId) {
    switch (dataId) {
      case 0:
        return 'assets/images/topic_auto.png';
      case 1:
        return 'assets/images/topic_beauty.png';
      case 2:
        return 'assets/images/topic_overhaul.png';
      case 3:
        return 'assets/images/topic_children.png';
      case 4:
        return 'assets/images/topic_workers.png';
      case 5:
        return 'assets/images/topic_cleaning.png';
      default:
        return 'assets/images/frame.png';
    }
  }
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 5,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: isPressed ? Color(0xFF855CD2) : Color(0xFFF9F4FE),
                width: 1.5),
            borderRadius: BorderRadius.circular(16)),
        constraints: BoxConstraints(),
        child: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Color(0xFFF9F4FE),
          onTap: () {
            //TODO
            setState(() {
              isPressed = !isPressed;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            width: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(_getImagePath(dataId), width: 30, height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      setTitle(),
                      style: TextStyle(fontSize: 12),
                      // style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ],
                ),
              ],

  bool isPressed = false;
  @override
  Widget build(BuildContext context) {

    return Container(

      decoration: BoxDecoration(color: isPressed ? Color(0xFF855CD2) : Color(0xFFF9F4FE),
          borderRadius: BorderRadius.circular(20)),
      constraints: BoxConstraints(),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 5,
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          splashColor: Colors.transparent,
          highlightColor:  Color(0xFFF9F4FE),
          onTap: () {          //TODO
            setState(() {
              isPressed = !isPressed;
              print(isPressed.toString());
            });
          }
          ,
          child: Center(
            child: Container(
              width: 80,
              child: Column(

                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    _getImagePath(dataId),
                    width: 110 * 0.28,
                    height: 110 * 0.28,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        setTitle(),
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
