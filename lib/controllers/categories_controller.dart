import 'package:e_commerce_app/models/categories_model.dart';
import 'package:get/get.dart';
import '../data/repository/categories_repo.dart';
import '../models/product_model.dart';

class CategoriesController extends GetxController {
  final CategoriesRepo categoriesRepo = CategoriesRepo();

  List<CategoriesModel> categoriesList = [];
  List<ProductModel> categoriesByIndexList = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCategoriesList();
    getCategoriesByIndexList("1");
  }

  bool _isloaded = false;
  bool get isloaded => _isloaded;

  Future<void> getCategoriesList() async {
    var response = await categoriesRepo.getCategories();
    if (response['status'] == "success") {
      response['categories'].forEach((v) {
        categoriesList.add(CategoriesModel.fromJson(v));
      });

      _isloaded = true;
      update();
    } else {
      print("Error occurred and the error is ");
    }
  }

  Future<List<ProductModel>> getCategoriesByIndexList(String index) async {
    var response = await categoriesRepo.getCategoriesByIndex(index);
    if (response['status'] == "success") {
      response['products'].forEach((v) {
        categoriesByIndexList.add(ProductModel.fromJson(v));
      });
      _isloaded = true;
      return categoriesByIndexList;
      update();
    } else {
      return categoriesByIndexList;
    }
  }
}
