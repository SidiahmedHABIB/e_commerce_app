import 'package:e_commerce_app/routes/route_helper.dart';
import 'package:e_commerce_app/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'app_icon.dart';
import 'big_text_widget.dart';

class ProductCardWidget extends StatelessWidget {
  int index;
  String namePro;
  String markPro;
  String pricePro;
  String imgPro;
  bool favorite;
  bool ispromo;
  String promo;

  ProductCardWidget(
      {super.key,
      required this.index,
      required this.namePro,
      required this.markPro,
      required this.pricePro,
      required this.imgPro,
      this.ispromo = false,
      this.favorite = false,
      this.promo = "30"});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(
            vertical: Dimensions.heigth10 * 0.85,
            horizontal: Dimensions.width10),
        width: Dimensions.width100 * 1.8,
        padding: EdgeInsets.all(Dimensions.heigth10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(Dimensions.heigth20),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 5,
                offset: Offset(0, 0),
              ),
            ]),
        child: Column(
          children: [
            // section image cart
            GestureDetector(
              onTap: () => Get.toNamed(RouteHelper.getDetailProduct(index)),
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(Dimensions.heigth10),
                    width: Dimensions.width100 * 1.6,
                    height: Dimensions.heigth100 * 1.7,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.heigth10),
                        color: AppColors.whiteColor),
                    child: Image.asset(imgPro),
                  ),
                  ispromo == true
                      ? Container(
                          height: Dimensions.heigth30,
                          width: Dimensions.width30 * 2,
                          decoration: BoxDecoration(
                              color: AppColors.mailnColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: BigTextWidget(
                              text: "$promo%",
                              color: Colors.white,
                            ),
                          ),
                        )
                      : Container()
                ],
              ),
            ),

            SizedBox(height: Dimensions.heigth10),
            // section Name cart

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigTextWidget(text: namePro),
                    SmallText(text: markPro),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BigTextWidget(
                  text: pricePro + " \DT",
                  size: 25,
                ),
                favorite == false
                    ? AppIcon(
                        icon: Icons.favorite,
                        iconColor: AppColors.mailnColor,
                        iconsize: 35,
                        size: 40,
                        backgroundcolor: Colors.white,
                      )
                    : AppIcon(
                        icon: Icons.favorite,
                        iconColor: Colors.red.shade400,
                        iconsize: 35,
                        size: 40,
                        backgroundcolor: Colors.white,
                      )
              ],
            )
          ],
        ));
  }
}
