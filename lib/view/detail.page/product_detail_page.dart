import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_commerce_app/constant/app_constants.dart';
import 'package:e_commerce_app/routes/route_helper.dart';
import 'package:e_commerce_app/utils/colors.dart';
import 'package:e_commerce_app/utils/dimensions.dart';
import 'package:e_commerce_app/widgets/app_icon.dart';
import 'package:e_commerce_app/widgets/big_text_widget.dart';
import 'package:e_commerce_app/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/products_controller.dart';

class ProductDetailPage extends StatefulWidget {
  ProductDetailPage({super.key, required this.pageId});
  int pageId;

  @override
  State<ProductDetailPage> createState() =>
      _ProductDetailPageState(pageId: pageId);
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  PageController pageController = PageController(viewportFraction: 0.9);
  var _currPageValue = 0.0;
  int pageId;
  _ProductDetailPageState({required this.pageId});
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var product = Get.find<ProductsController>().productsList[pageId];
    List<String> imgs = [
      product.productImage.toString(),
      product.productImage2.toString(),
      product.productImage3.toString()
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          // header
          Container(
            padding: EdgeInsets.only(
                right: Dimensions.width20,
                left: Dimensions.width20,
                top: Dimensions.heigth35,
                bottom: Dimensions.heigth15),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () => Get.toNamed(RouteHelper.getInitial()),
                      child: const Icon(Icons.arrow_back_ios)),
                  BigTextWidget(text: "Details Products"),
                  AppIcon(
                    icon: Icons.shopping_cart_outlined,
                    backgroundcolor: AppColors.mailnColor,
                    iconColor: Colors.white,
                    size: 40,
                    iconsize: 20,
                  )
                ]),
          ),

          // section carasoul images
          Stack(
            children: [
              Container(
                  color: AppColors.whiteColor,
                  height: Dimensions.heigth100 * 3,
                  child: PageView.builder(
                    itemCount: imgs.length,
                    controller: pageController,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.only(
                            top: Dimensions.heigth20,
                            bottom: Dimensions.heigth40),
                        width: double.maxFinite,
                        height: Dimensions.heigth100 * 3,
                        child: Image.asset(
                            "${AppConstants.ASSETS_PRODUCTS + imgs[index]}"),
                      );
                    },
                  )),

              //Dots
              Positioned(
                left: Dimensions.width45 * 3.8,
                bottom: Dimensions.heigth10,
                child: DotsIndicator(
                  dotsCount: 3,
                  position: _currPageValue,
                  decorator: DotsDecorator(
                    activeColor: Colors.black87,
                    size: const Size.square(9.0),
                    activeSize: const Size(30.0, 9.0),
                    activeShape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(Dimensions.heigth5)),
                  ),
                ),
              ),

              // column of 3 images
              Positioned(
                top: Dimensions.heigth20,
                right: Dimensions.width20,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(Dimensions.heigth5),
                      width: Dimensions.width20 * 3,
                      height: Dimensions.heigth20 * 3,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.heigth10),
                          color: AppColors.whiteColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 3,
                              offset: Offset(0, 0),
                            ),
                          ]),
                      child: Image.asset(
                        "${AppConstants.ASSETS_PRODUCTS + imgs[0]}",
                      ),
                    ),
                    SizedBox(height: Dimensions.heigth10),
                    Container(
                      padding: EdgeInsets.all(Dimensions.heigth5),
                      width: Dimensions.width20 * 3,
                      height: Dimensions.heigth20 * 3,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.heigth10),
                          color: AppColors.whiteColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 3,
                              offset: Offset(0, 0),
                            ),
                          ]),
                      child: Image.asset(
                        "${AppConstants.ASSETS_PRODUCTS + imgs[1]}",
                      ),
                    ),
                    SizedBox(height: Dimensions.heigth10),
                    Container(
                      padding: EdgeInsets.all(Dimensions.heigth5),
                      width: Dimensions.width20 * 3,
                      height: Dimensions.heigth20 * 3,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.heigth10),
                          color: AppColors.whiteColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 3,
                              offset: Offset(0, 0),
                            ),
                          ]),
                      child: Image.asset(
                        "${AppConstants.ASSETS_PRODUCTS + imgs[2]}",
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),

          SizedBox(height: Dimensions.heigth10),
          // section of decomentation
          Container(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // row of delivering and favoret
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.width10,
                      vertical: Dimensions.heigth5 / 2,
                    ),
                    child: BigTextWidget(
                      text: "delivering",
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      size: 18,
                    ),
                    decoration: BoxDecoration(
                        color: AppColors.mailnColor,
                        borderRadius:
                            BorderRadius.circular(Dimensions.heigth5 * 1.5)),
                  ),
                  Icon(
                    Icons.favorite,
                    color: Colors.black26,
                    size: Dimensions.heigth30,
                  )
                ],
              ),
              SizedBox(height: Dimensions.heigth5),
              BigTextWidget(
                text: product.productName.toString(),
                size: 30,
                fontWeight: FontWeight.bold,
              ),

              // exandable text widget

              SmallText(
                text: product.productDesc.toString(),
                size: 18,
              )
            ]),
          )
        ]),
      ),

      // footer
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.width20, vertical: Dimensions.heigth20),
        height: Dimensions.heigth45 * 3,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(Dimensions.heigth30),
              topLeft: Radius.circular(Dimensions.heigth30),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 0),
                blurRadius: 8,
              ),
            ],
            color: AppColors.whiteColor),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BigTextWidget(
                text: "${product.productPrice} DT",
                size: 35,
                fontWeight: FontWeight.w900,
              ),
              GetBuilder<ProductsController>(
                  builder: ((controller) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () => controller.setQuantity(false),
                                child: AppIcon(
                                  icon: Icons.remove,
                                  backgroundcolor: AppColors.mailnColor,
                                  iconColor: Colors.white,
                                  iconsize: Dimensions.heigth25,
                                  size: Dimensions.heigth35,
                                ),
                              ),
                              SizedBox(width: Dimensions.width10),
                              BigTextWidget(
                                text: controller.inCartItems.toString(),
                                size: Dimensions.heigth25,
                              ),
                              SizedBox(width: Dimensions.width10),
                              GestureDetector(
                                onTap: () => controller.setQuantity(true),
                                child: AppIcon(
                                  icon: Icons.add,
                                  backgroundcolor: AppColors.mailnColor,
                                  iconColor: Colors.white,
                                  iconsize: Dimensions.heigth10 * 2.2,
                                  size: Dimensions.heigth35,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: Dimensions.heigth10,
                                horizontal: Dimensions.width20),
                            child: BigTextWidget(
                              text: "Add to cart",
                              size: Dimensions.heigth20,
                              color: Colors.white,
                            ),
                            decoration: BoxDecoration(
                                color: AppColors.mailnColor,
                                borderRadius:
                                    BorderRadius.circular(Dimensions.heigth10)),
                          )
                        ],
                      )))
            ]),
      ),
    );
  }
}
