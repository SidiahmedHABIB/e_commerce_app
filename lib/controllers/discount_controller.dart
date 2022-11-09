import 'package:e_commerce_app/models/product_model.dart';
import 'package:get/get.dart';
import '../data/repository/discount_repo.dart';
import '../data/repository/products_repo.dart';

class DiscountController extends GetxController {
  final DiscountRepo discountRepo = DiscountRepo();

  List discountsList = [];
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
      discountsList.addAll(response['discouts']);
      // productsList.add(ProductModel.fromJson(response.body).products);
      _isloaded = true;
      isDiscount = true;
      update();
    } else {
      print("Error occurred and the error is ");
    }
  }
}
