import 'package:e_commerce_app/view/categories.page/categories_page.dart';
import 'package:e_commerce_app/view/detail.page/product_detail_page.dart';
import 'package:e_commerce_app/view/splash.page/splash.page.dart';
import 'package:get/get.dart';

import '../main.dart';
import '../view/home.pages/home_page.dart';
import '../view/onboarding.page/onboarding_page.dart';

class RouteHelper {
  static const String splashScreen = "/splash-Screen";
  static const String initial = "/";
  static const String detailProduct = "/detail-prduct";
  static const String categoriesPage = "/categories-page";
  static const String cartPage = "/cart-page";

  static String getSplashScreen() => '$splashScreen';
  static String getInitial() => '$initial';
  static String getDetailProduct(int pageId) => '$detailProduct?pageId=$pageId';
  static String getCategoriesPage(int pageId) =>
      '$categoriesPage?pageId=$pageId';
  static String getCartPage() => '$cartPage';
  static List<GetPage> routes = [
    GetPage(
      name: splashScreen,
      page: () => SplashPage(),
    ),

    GetPage(
      name: initial,
      page: () => sharedPreferences.getString("id") == null
          ? const OnboardingPage()
          : const HomePage(),
    ),
    GetPage(
        name: detailProduct,
        page: () {
          var pageId = Get.parameters['pageId'];
          return ProductDetailPage(pageId: int.parse(pageId!));
        },
        transition: Transition.fadeIn),
    GetPage(
        name: categoriesPage,
        page: () {
          var pageId = Get.parameters['pageId'];
          return CategoriesPage(pageId: int.parse(pageId!));
        },
        transition: Transition.fadeIn),
    // GetPage(
    //     name: cartPage,
    //     page: () {
    //       return CartPage();
    //     },
    //     transition: Transition.fadeIn),
  ];
}
