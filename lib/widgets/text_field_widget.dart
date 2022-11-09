import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final IconData icon;
  Color colorIcon;
  TextFieldWidget({
    Key? key,
    required this.textController,
    required this.hintText,
    required this.icon,
    this.colorIcon = const Color(0xFF4E7D96),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          controller: textController,
          decoration: InputDecoration(
            // hinttext
            hintText: hintText,
            // prefixIcon
            prefixIcon: Icon(
              icon,
              color: colorIcon,
            ),
            // focusedBorder
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                width: 1,
                color: Colors.black26,
              ),
            ),
            // enabledBoreder
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                width: 1,
                color: Colors.black26,
              ),
            ),
            // border
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ));
  }
}
