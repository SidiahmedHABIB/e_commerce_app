import 'package:e_commerce_app/widgets/small_text.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';

class ExandabelTextWidget extends StatefulWidget {
  final String text;

  const ExandabelTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<ExandabelTextWidget> createState() => _ExandabelTextWidgetState();
}

class _ExandabelTextWidgetState extends State<ExandabelTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hiddeText = true;

  double textheight = Dimensions.containerHeigth320;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textheight) {
      firstHalf = widget.text.substring(0, textheight.toInt());
      secondHalf =
          widget.text.substring(textheight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: secondHalf.isEmpty
            ? SmallText(text: firstHalf, size: Dimensions.heigth15)
            : Column(
                children: [
                  SmallText(
                    text: hiddeText
                        ? (firstHalf + "....")
                        : (firstHalf + secondHalf),
                    size: Dimensions.heigth15,
                    height: 1.8,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        hiddeText = !hiddeText;
                      });
                    },
                    child: Row(children: [
                      SmallText(
                        text: "Show more ",
                        color: AppColors.mailnColor,
                      ),
                      Icon(
                          hiddeText
                              ? Icons.arrow_drop_down
                              : Icons.arrow_drop_up,
                          color: AppColors.mailnColor),
                    ]),
                  ),
                  SizedBox(height: Dimensions.heigth45)
                ],
              ));
  }
}
