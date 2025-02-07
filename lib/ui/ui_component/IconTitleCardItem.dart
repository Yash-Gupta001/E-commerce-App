import 'package:flutter/material.dart';
import 'package:horizontal_card_pager/card_item.dart';

class IconTitleCard extends CardItem {
  final String text;
  final IconData iconData;
  final void Function() onTap;

  IconTitleCard({
    required this.text,
    required this.iconData,
    required this.onTap,
  });

  // Implementing the abstract method from CardItem with the 'scale' parameter
  @override
  Widget buildWidget(double scale) {
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Transform.scale(
            scale: scale,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(iconData, size: 40),
                Text(text),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
