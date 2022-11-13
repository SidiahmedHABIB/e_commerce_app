import 'package:e_commerce_app/constant/app_constants.dart';
import 'package:e_commerce_app/controllers/categories_controller.dart';
import 'package:e_commerce_app/view/search.page/search_page.dart';
import 'package:e_commerce_app/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/products_controller.dart';
import '../../routes/route_helper.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text_widget.dart';
import '../../widgets/horizon_card_widget.dart';
import '../cart.page/cart_page.dart';

class CategoriesPage extends StatelessWidget {
  int pageId;

  CategoriesPage({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
    var categories =
        Get.find<CategoriesController>().categoriesList[pageId - 1];
    var categoriesByIndexList = Get.find<CategoriesController>()
        .getCategoriesByIndexList((pageId).toString());
    print(pageId);
    return Scaffold(
      body: Column(children: [
        // header
        Container(
          padding: EdgeInsets.only(
            right: Dimensions.width20,
            left: Dimensions.width20,
            top: Dimensions.heigth35,
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            GestureDetector(
                onTap: () => Get.toNamed(RouteHelper.getInitial()),
                child: const AppIcon(
                  icon: Icons.arrow_back_ios,
                  backgroundcolor: Colors.white10,
                  iconsize: 25,
                  iconColor: Colors.black,
                )),
            BigTextWidget(text: "${categories.categoriesName} "),
            GetBuilder<ProductsController>(builder: ((controller) {
              return GestureDetector(
                  onTap: () => Get.to(CartPage()),
                  child: Stack(
                    children: [
                      AppIcon(
                        icon: Icons.shopping_cart_outlined,
                        backgroundcolor: AppColors.mailnColor,
                        iconColor: Colors.white,
                        size: 40,
                        iconsize: 20,
                      ),

                      // controller.totalItems -------------------
                      controller.totalItems >= 1
                          ? Positioned(
                              right: 0,
                              top: 0,
                              child: Icon(
                                Icons.circle,
                                size: 24,
                                color: Colors.white,
                              ))
                          : Container(),
                      // controller.totalItems---------------------
                      controller.totalItems >= 1
                          ? Positioned(
                              right: 6,
                              top: 4,
                              child: BigTextWidget(
                                // text: controller.totalItems.toString(), -------------------
                                text: controller.totalItems.toString(),
                                size: 13,
                                color: AppColors.mailnColor,
                              ))
                          : Container()
                    ],
                  ));
            }))
          ]),
        ),
        SizedBox(height: Dimensions.heigth10),
        // section research
        GestureDetector(
          onTap: () => Get.to(SearchPage()),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: Dimensions.width35),
            padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
            width: double.maxFinite,
            height: Dimensions.heigth25 * 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.whiteColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 5,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: Row(children: [
              Icon(
                Icons.search,
                size: 30,
                color: Colors.black38,
              ),
              SizedBox(width: Dimensions.width10),
              SmallText(
                text: "Search",
                size: 20,
              ),
            ]),
          ),
        ),
        // section list of products
        GetBuilder<CategoriesController>(builder: (controller) {
          return controller.isloaded == true
              ? Expanded(
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.categoriesByIndexList.length,
                    itemBuilder: ((context, index) {
                      return GestureDetector(
                        onTap: () {
                          // Get.toNamed(RouteHelper.getRecommendedFood(index));
                        },
                        child: HorizonCardWidget(
                          name: controller
                              .categoriesByIndexList[index].productName
                              .toString(),
                          price: controller
                              .categoriesByIndexList[index].productPrice
                              .toString(),
                          img:
                              "${AppConstants.ASSETS_PRODUCTS + controller.categoriesByIndexList[index].productImage.toString()}",
                        ),
                      );
                    }),
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(
                      height: Dimensions.heigth10,
                    ),
                  ),
                )
              : Text("is loading");
        })
      ]),
    );
  }
}
