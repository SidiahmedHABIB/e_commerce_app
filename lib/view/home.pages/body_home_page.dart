import 'package:e_commerce_app/constant/app_constants.dart';
import 'package:e_commerce_app/controllers/auth_controller.dart';
import 'package:e_commerce_app/controllers/categories_controller.dart';
import 'package:e_commerce_app/controllers/discount_controller.dart';
import 'package:e_commerce_app/controllers/products_controller.dart';
import 'package:e_commerce_app/utils/dimensions.dart';
import 'package:e_commerce_app/widgets/big_text_widget.dart';
import 'package:e_commerce_app/widgets/category_card_widget.dart';
import 'package:e_commerce_app/widgets/product_card_widget.dart';
import 'package:e_commerce_app/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyHomePage extends StatefulWidget {
  const BodyHomePage({super.key});

  @override
  State<BodyHomePage> createState() => _BodyHomePageState();
}

class _BodyHomePageState extends State<BodyHomePage> {
  AuthController authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
      child: Column(
        children: [
          // section categories
          GetBuilder<CategoriesController>(builder: (controller) {
            return Container(
              height: Dimensions.heigth30 * 2,
              child: ListView.separated(
                itemCount: controller.categoriesList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CategoryCardWidget(
                      imageCtg:
                          "${AppConstants.ASSETS_CATEGORIES + controller.categoriesList[index]['categories_image']}",
                      textCtg:
                          "${controller.categoriesList[index]['categories_name']}");
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: Dimensions.width10,
                  );
                },
              ),
            );
          }),

          SizedBox(height: Dimensions.heigth10),

          // section Discounts
          GetBuilder<DiscountController>(
            builder: (controller) {
              return controller.isDiscount == true
                  ? Column(children: [
                      //  title of section Discounts
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BigTextWidget(
                            text: "Discounts",
                            fontWeight: FontWeight.w800,
                            size: 22,
                          ),
                        ],
                      ),

                      // section headphones carts
                      Container(
                          height: Dimensions.heigth100 * 3.1,
                          padding: EdgeInsets.symmetric(
                              vertical: Dimensions.heigth10),
                          child: ListView.separated(
                            itemCount: controller.discountsList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return ProductCardWidget(
                                namePro:
                                    "${controller.discountsList[index]["product_name"]}",
                                markPro: "SDA",
                                pricePro:
                                    "${controller.discountsList[index]["product_price"]}",
                                imgPro:
                                    "${AppConstants.ASSETS_PRODUCTS + controller.discountsList[index]["product_image"]}",
                                ispromo: true,
                                promo: controller.discountsList[index]
                                    ["product_promo"],
                              );
                            },
                            separatorBuilder: (context, index) => Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: Dimensions.heigth10,
                                    horizontal: Dimensions.width5)),
                          )),

                      SizedBox(height: Dimensions.heigth10),
                    ])
                  : Container();
            },
          ),

          //  title of section All products
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BigTextWidget(
                text: "All Porducts",
                fontWeight: FontWeight.w800,
                size: 22,
              ),
            ],
          ),

          // section laptops carts
          GetBuilder<ProductsController>(
              builder: ((controller) => Container(
                  height: Dimensions.heigth100 * 3.1,
                  padding: EdgeInsets.symmetric(vertical: Dimensions.heigth10),
                  child: ListView.separated(
                    itemCount: controller.productsList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return ProductCardWidget(
                        namePro:
                            "${controller.productsList[index]["product_name"]}",
                        markPro: "SDA",
                        pricePro:
                            "${controller.productsList[index]["product_price"]}",
                        imgPro:
                            "${AppConstants.ASSETS_PRODUCTS + controller.productsList[index]["product_image"]}",
                      );
                    },
                    separatorBuilder: (context, index) => Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: Dimensions.heigth10,
                            horizontal: Dimensions.width5)),
                  )))),

          SizedBox(height: Dimensions.heigth10),

          //  title of section pc
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BigTextWidget(
                text: "PC",
                fontWeight: FontWeight.w800,
                size: 22,
              ),
            ],
          ),

          //section pc carts
          Container(
              height: Dimensions.heigth100 * 3.1,
              padding: EdgeInsets.symmetric(vertical: Dimensions.heigth10),
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ProductCardWidget(
                        namePro: "name of product",
                        markPro: "Appel",
                        pricePro: "133",
                        imgPro: "assets/image/headphone.png");
                  },
                  separatorBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: Dimensions.heigth10,
                          horizontal: Dimensions.width5)),
                  itemCount: 5)),

          SizedBox(height: Dimensions.heigth5),
          SmallText(
            text: "By Sidi Ahmed",
            size: 15,
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () => authController.lougOut(),
            child: SmallText(
              text: "sidiahmedhaibib@gmail.com",
              size: 15,
            ),
          ),
          SizedBox(height: Dimensions.heigth10),
        ],
      ),
    );
  }
}
