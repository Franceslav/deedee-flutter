import 'package:flutter/material.dart';
import 'carousel_item.dart';

class CarouselPanel extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: Container(
        height: 74,
        child: ListView.builder(
          itemCount: 6,
          itemBuilder: (context, index) => CarouselItem(dataId: index),
          scrollDirection: Axis.horizontal,),

        ),
    );
    return Container(
      height: 70,
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) => CarouselItem(dataId: index),
        scrollDirection: Axis.horizontal,),

      );

  }
}
