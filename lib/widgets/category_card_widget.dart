import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/route_helper.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'big_text_widget.dart';

class CategoryCardWidget extends StatelessWidget {
  int index;

  final String imageCtg;
  final String textCtg;

  CategoryCardWidget({
    super.key,
    required this.index,
    required this.imageCtg,
    required this.textCtg,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(RouteHelper.getCategoriesPage(index)),
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: Dimensions.heigth5, horizontal: Dimensions.width5),
        padding: EdgeInsets.symmetric(
            vertical: Dimensions.heigth5, horizontal: Dimensions.width10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Dimensions.heigth15),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 2,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                padding: EdgeInsets.all(Dimensions.heigth5),
                width: Dimensions.width45,
                height: Dimensions.heigth45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.heigth10),
                  color: AppColors.whiteColor,
                  border: Border.all(
                      color: Colors.black12, width: Dimensions.heigth10 / 10),
                ),
                child: Image.asset(
                  imageCtg,
                )),
            SizedBox(width: Dimensions.width10),
            BigTextWidget(
              text: textCtg,
              color: AppColors.mailnColor,
            )
          ],
        ),
      ),
    );
  }
}
