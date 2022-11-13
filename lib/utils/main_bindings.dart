import 'package:e_commerce_app/controllers/categories_controller.dart';
import 'package:e_commerce_app/controllers/discount_controller.dart';
import 'package:e_commerce_app/controllers/favorite_controller.dart';
import 'package:e_commerce_app/controllers/products_controller.dart';
import 'package:get/get.dart';

class MainBindings implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(CategoriesController());
    Get.put(ProductsController());
    Get.put(DiscountController());
    Get.put(FavoriteController());
  }
}
