import 'package:e_commerce_app/controllers/products_controller.dart';
import 'package:e_commerce_app/widgets/big_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/app_constants.dart';
import '../../routes/route_helper.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/small_text.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // cart page header
          Positioned(
              top: Dimensions.heigth35,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: AppIcon(
                      icon: Icons.home,
                      iconColor: Colors.white,
                      backgroundcolor: AppColors.mailnColor,
                      iconsize: Dimensions.heigth20,
                    ),
                  ),
                  AppIcon(
                    icon: Icons.shopping_cart_outlined,
                    iconColor: Colors.white,
                    backgroundcolor: AppColors.mailnColor,
                    iconsize: Dimensions.heigth20,
                  )
                ],
              )),

          // list of items in cart
          GetBuilder<ProductsController>(builder: (_cartContorller) {
            return _cartContorller.getItems.length > 0
                ? Positioned(
                    top: Dimensions.heigth20 * 3.6,
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    bottom: 0,
                    child: Container(child: GetBuilder<ProductsController>(
                      builder: (cartController) {
                        var _cartList = cartController.getItems;
                        return ListView.separated(
                          separatorBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              width: double.maxFinite,
                              height: 2,
                              color: Colors.black12,
                            );
                          },
                          itemCount: cartController.getItems.length,
                          itemBuilder: ((context, index) {
                            return Container(
                              width: double.maxFinite,
                              height: Dimensions.width100,
                              child: Row(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    padding: EdgeInsets.all(Dimensions.heigth5),
                                    decoration: BoxDecoration(
                                        color: AppColors.whiteColor,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Image.asset(AppConstants
                                            .ASSETS_PRODUCTS +
                                        cartController.getItems[index].img!),
                                  ),
                                  Expanded(
                                      child: Container(
                                    height: Dimensions.heigth100,
                                    padding: EdgeInsets.only(
                                        left: Dimensions.width10,
                                        top: Dimensions.heigth5,
                                        bottom: Dimensions.heigth5),
                                    margin: EdgeInsets.only(
                                        bottom: Dimensions.heigth10),
                                    child: Container(
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            BigTextWidget(
                                              text: cartController
                                                  .getItems[index].name!,
                                              color: Colors.black87,
                                            ),
                                            SmallText(text: "SDA"),
                                            GetBuilder<ProductsController>(
                                                builder: (Controller) {
                                              return Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  BigTextWidget(
                                                      text: "\$ " +
                                                          cartController
                                                              .getItems[index]
                                                              .price!
                                                              .toString(),
                                                      color: Colors.redAccent),
                                                  Container(
                                                    child: Row(children: [
                                                      GestureDetector(
                                                          onTap: (() => cartController
                                                              .addItemtest(
                                                                  _cartList[
                                                                          index]
                                                                      .product!,
                                                                  -1)),
                                                          child: Icon(
                                                              Icons.remove,
                                                              color: Colors
                                                                  .black)),
                                                      SizedBox(
                                                          width: Dimensions
                                                              .width5),
                                                      BigTextWidget(
                                                          text: _cartList[index]
                                                              .quantity
                                                              .toString()),
                                                      SizedBox(
                                                          width: Dimensions
                                                              .width5),
                                                      GestureDetector(
                                                          onTap: (() => cartController
                                                              .addItemtest(
                                                                  _cartList[
                                                                          index]
                                                                      .product!,
                                                                  1)),
                                                          child: Icon(Icons.add,
                                                              color: Colors
                                                                  .black)),
                                                    ]),
                                                  )
                                                ],
                                              );
                                            }),
                                          ]),
                                    ),
                                  ))
                                ],
                              ),
                            );
                          }),
                        );
                      },
                    )),
                  )
                : Center(child: BigTextWidget(text: "Cart Is Empty"));
          })
        ],
      ),

      // cart page footer bar
      bottomNavigationBar: Container(
          height: Dimensions.heigth120,
          padding: EdgeInsets.only(
            top: Dimensions.width30,
            left: Dimensions.width20,
            right: Dimensions.width20,
            bottom: Dimensions.heigth20,
          ),
          decoration: BoxDecoration(
            color: AppColors.buttonbackgroundColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(Dimensions.heigth40),
              topLeft: Radius.circular(Dimensions.heigth40),
            ),
          ),
          child: GetBuilder<ProductsController>(
            builder: (_cartController) {
              return _cartController.getItems.length > 0
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                          Container(
                            padding: EdgeInsets.only(
                                top: Dimensions.heigth20,
                                right: Dimensions.width20,
                                bottom: Dimensions.heigth20,
                                left: Dimensions.width20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.circular(Dimensions.heigth20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BigTextWidget(
                                  text: "Total : ",
                                ),
                                BigTextWidget(
                                    text:
                                        _cartController.totalAmount.toString()),
                                SizedBox(width: Dimensions.width5),
                              ],
                            ),
                          ),
                          GetBuilder<ProductsController>(builder: (cart) {
                            return GestureDetector(
                                onTap: () {
                                  print("ontapped check out");
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: Dimensions.heigth20,
                                      right: Dimensions.width20,
                                      bottom: Dimensions.heigth20,
                                      left: Dimensions.width20),
                                  decoration: BoxDecoration(
                                    color: AppColors.mailnColor,
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.width20),
                                  ),
                                  child: BigTextWidget(
                                    text: "Sheck out ",
                                    color: Colors.white,
                                  ),
                                ));
                          })
                        ])
                  : Container();
            },
          )),
    );
  }
}
