import 'package:e_commerce_app/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'big_text_widget.dart';

class HorizonCardWidget extends StatelessWidget {
  String img;

  String name;
  String price;
  HorizonCardWidget(
      {super.key, required this.img, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(
          left: Dimensions.width20,
          right: Dimensions.width20,
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          // image Setion
          Container(
            height: Dimensions.heigth120,
            width: Dimensions.width120,
            padding: EdgeInsets.all(Dimensions.heigth10),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5,
                    offset: Offset(0, 0),
                  ),
                ],
                borderRadius: BorderRadius.circular(Dimensions.heigth20),
                // color: Colors.white38
                color: AppColors.whiteColor),
            child: Image.asset(img),
          ),
          // text container
          Container(
            width: Dimensions.width45 * 4.5,
            child: Container(
              height: Dimensions.width100,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5,
                    offset: Offset(0, 0),
                  ),
                ],
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.heigth20),
                  bottomRight: Radius.circular(Dimensions.heigth20),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    left: Dimensions.width10,
                    top: Dimensions.heigth10,
                    bottom: Dimensions.heigth10,
                    right: Dimensions.width20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BigTextWidget(text: name),
                      SmallText(
                        text: "SDA",
                        color: AppColors.mailnColor,
                        size: 15,
                      ),
                      BigTextWidget(
                          text: "$price DT", color: AppColors.mailnColor),
                    ]),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
