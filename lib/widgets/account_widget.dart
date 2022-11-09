import 'package:e_commerce_app/widgets/app_icon.dart';
import 'package:e_commerce_app/widgets/big_text_widget.dart';
import 'package:flutter/material.dart';

import '../utils/dimensions.dart';

class AccountWidget extends StatelessWidget {
  AppIcon appIcon;
  BigTextWidget bigText;
  AccountWidget({Key? key, required this.appIcon, required this.bigText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimensions.width10),
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.width20, vertical: Dimensions.heigth10),
      width: double.maxFinite,
      child: Row(
        children: [
          appIcon,
          SizedBox(width: 20),
          bigText,
        ],
      ),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          blurRadius: 10,
          offset: Offset(0, 2),
          color: Colors.black12,
        ),
      ]),
    );
  }
}
