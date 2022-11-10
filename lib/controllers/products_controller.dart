import 'package:e_commerce_app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/repository/products_repo.dart';
import '../utils/colors.dart';

class ProductsController extends GetxController {
  final ProductsRepo productsRepo = ProductsRepo();

  List<ProductModel> productsList = [];
  // List<CategoriesModel> categoriesList = [];

  @override
  void onInit() {
    super.onInit();
    getProductsList();
  }

  bool _isloaded = false;
  bool get isloaded => _isloaded;

  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

  Future<void> getProductsList() async {
    var response = await productsRepo.getProducts();
    if (response['status'] == "success") {
      response['products'].forEach((v) {
        productsList.add(ProductModel.fromJson(v));
      });
      // print("========> $productsList");
      _isloaded = true;
      update();
    } else {
      print("Error occurred and the error is ");
    }
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
      print("decrement : " + _quantity.toString());
    }
    update();
  }

  int checkQuantity(int quantity) {
    if ((_inCartItems + quantity) < 0) {
      Get.snackbar("Item count", "You can't reduce more !",
          backgroundColor: AppColors.mailnColor, colorText: Colors.white);
      return 0;
    } else if ((_inCartItems + quantity) > 20) {
      Get.snackbar("Item count", "You can't add more !",
          backgroundColor: AppColors.mailnColor, colorText: Colors.white);
      return 20;
    } else {
      return quantity;
    }
  }
}
