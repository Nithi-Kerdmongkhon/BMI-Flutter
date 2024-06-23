// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';

class BgCardContent extends StatelessWidget {
  final IconData icon;
  final int iconSize;
  final String textLable;
  final Color color;

  const BgCardContent({
    super.key,
    required this.icon,
    required this.iconSize,
    required this.textLable,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Icon(
            icon,
            size: 60,
            color: color,
          ),
        ),
        Text(textLable)
      ],
    );
  }
}
