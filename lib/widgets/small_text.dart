import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  FontWeight fontWeight;
  SmallText(
      {Key? key,
      this.color = Colors.black45,
      required this.text,
      this.size = 12,
      this.height = 1.2,
      this.fontWeight = FontWeight.w800})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: size,
          color: color,
          fontFamily: 'Roboto',
          height: height,
          fontWeight: fontWeight),
    );
  }
}
