import 'package:flutter/cupertino.dart';
import '../constant/app_constants.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'big_text_widget.dart';
import 'small_text.dart';

class OnboardingModel {
  final String imagebr;
  final String title;
  final String smalltitleP1;
  final String smalltitleP2;

  OnboardingModel({
    required this.imagebr,
    required this.title,
    required this.smalltitleP1,
    required this.smalltitleP2,
  });
}

List<OnboardingModel> boarding = [
  OnboardingModel(
    imagebr: "${AppConstants.ASSETS_IMAGES}onpoard1.png",
    title: "Easy Shopping",
    smalltitleP1: "The best Application to buy online ",
    smalltitleP2: "products of Home Appliances",
  ),
  OnboardingModel(
    imagebr: "${AppConstants.ASSETS_IMAGES}onpoard2.png",
    title: "Secure Payment",
    smalltitleP1: "The best Application to buy online ",
    smalltitleP2: "products of Home Appliances",
  ),
  OnboardingModel(
    imagebr: "${AppConstants.ASSETS_IMAGES}onpoard3.png",
    title: "Quick Delivery",
    smalltitleP1: "The best Application to buy online ",
    smalltitleP2: "products of Home Appliances",
  ),
];

Widget OnboardingCardWidget(OnboardingModel model) {
  return Column(
    children: [
      // image container
      Container(
        height: Dimensions.heigth100 * 2 + Dimensions.heigth45,
        child: Image.asset(model.imagebr.toString()),
      ),
      SizedBox(height: Dimensions.heigth20),
      // title
      BigTextWidget(
        text: model.title.toString(),
        size: 35,
        color: AppColors.mailnColor,
      ),
      SizedBox(height: Dimensions.heigth20),
      // small text
      SmallText(
        text: model.smalltitleP1.toString(),
        size: 20,
      ),
      SmallText(
        text: model.smalltitleP2.toString(),
        size: 20,
      ),
    ],
  );
}



// // image container
//             Container(
//               color: AppColors.mailnColor,
//               child: Image.asset("assets/image/onpoard1.png"),
//             ),
//             SizedBox(height: Dimensions.heigth20),
//             // title
//             BigTextWidget(
//               text: "Easy Shopping",
//               size: 35,
//               color: AppColors.mailnColor,
//             ),
//             SizedBox(height: Dimensions.heigth20),
//             // small text
//             SmallText(
//               text: "The best Application to buy online ",
//               size: 20,
//             ),
//             SmallText(
//               text: "products of Home Appliances",
//               size: 20,
//             ),
            
