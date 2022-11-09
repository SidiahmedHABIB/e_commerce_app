import 'package:e_commerce_app/models/product_model.dart';
import 'package:get/get.dart';
import '../data/repository/products_repo.dart';

class ProductsController extends GetxController {
  final ProductsRepo productsRepo = ProductsRepo();

  List productsList = [];
  // List<CategoriesModel> categoriesList = [];

  @override
  void onInit() {
    super.onInit();
    getProductsList();
  }

  bool _isloaded = false;
  bool get isloaded => _isloaded;

  Future<void> getProductsList() async {
    var response = await productsRepo.getProducts();
    if (response['status'] == "success") {
      productsList.addAll(response['products']);
      // productsList.add(ProductModel.fromJson(response.body).products);
      _isloaded = true;
      update();
    } else {
      print("Error occurred and the error is ");
    }
  }
}
