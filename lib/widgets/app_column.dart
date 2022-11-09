import 'package:e_commerce_app/widgets/icon_and_text_widget.dart';
import 'package:e_commerce_app/widgets/small_text.dart';
import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';

class AppColumn extends StatelessWidget {
  final String text;
  final double sizebigtext;

  const AppColumn({
    Key? key,
    required this.text,
    this.sizebigtext = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        text,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontSize: sizebigtext,
            color: const Color(0xff332d2b),
            fontWeight: FontWeight.w500),
      ),
      SizedBox(height: 5),
      Row(
        children: [
          Wrap(
              children: List.generate(
                  5,
                  (index) => Icon(
                        Icons.star,
                        color: AppColors.mailnColor,
                        size: Dimensions.heigth15,
                      ))),
          SizedBox(width: 10),
          SmallText(text: "4.5"),
          SizedBox(width: 10),
          SmallText(text: "1287"),
          SizedBox(width: 10),
          SmallText(text: "comments"),
        ],
      ),
      SizedBox(height: 20),
      // icons row in text's container
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconAndTextWidget(
              icon: Icons.circle_sharp,
              text: "Normal",
              incolor: AppColors.iconColor1),
          IconAndTextWidget(
              icon: Icons.location_on,
              text: "1.7km",
              incolor: AppColors.mailnColor),
          IconAndTextWidget(
              icon: Icons.access_time_rounded,
              text: "32min",
              incolor: AppColors.iconColor2),
        ],
      )
    ]);
  }
}
