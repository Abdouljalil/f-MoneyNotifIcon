//CARD de mes pages
import 'package:flutter/material.dart';

Card mesPages(
  IconData icon,
  String name,
  Color color,
  double iconSize,
  Color cardColor,
  bool isClick,
) {
  return Card(
    elevation: isClick == true ? 1 : 0,
    color: cardColor,
    child: Padding(
      padding: const EdgeInsets.only(
        top: 8,
        bottom: 8,
        left: 20,
        right: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: color,
            size: iconSize,
          ),
          Text(
            name,
            style: TextStyle(color: color),
          ),
        ],
      ),
    ),
  );
}
