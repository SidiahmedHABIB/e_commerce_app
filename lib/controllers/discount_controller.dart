import 'package:e_commerce_app/models/product_model.dart';
import 'package:get/get.dart';
import '../data/repository/discount_repo.dart';
import '../data/repository/products_repo.dart';

class DiscountController extends GetxController {
  final DiscountRepo discountRepo = DiscountRepo();

  List<ProductModel> discountsList = [];
  bool isDiscount = false;
  // List<CategoriesModel> categoriesList = [];

  @override
  void onInit() {
    super.onInit();
    getDiscountsList();
  }

  bool _isloaded = false;
  bool get isloaded => _isloaded;

  Future<void> getDiscountsList() async {
    var response = await discountRepo.getDiscounts();
    if (response['status'] == "success") {
      response['discouts'].forEach((v) {
        discountsList.add(ProductModel.fromJson(v));
      });
      if (discountsList.length > 0) {
        isDiscount = true;
      }
      _isloaded = true;
      update();
    } else {
      print("Error occurred and the error is ");
    }
  }
}
