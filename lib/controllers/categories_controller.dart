import 'package:get/get.dart';
import '../data/repository/categories_repo.dart';

class CategoriesController extends GetxController {
  final CategoriesRepo categoriesRepo = CategoriesRepo();

  List categoriesList = [];
  // List<CategoriesModel> categoriesList = [];
  List<int> testList = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCategoriesList();
    testList.addAll([1, 3, 4, 5, 5]);
  }

  bool _isloaded = false;
  bool get isloaded => _isloaded;

  Future<void> getCategoriesList() async {
    var response = await categoriesRepo.getCategories();
    if (response['status'] == "success") {
      categoriesList.addAll(response['categories']);
      // categoriesList.addAll(CategoriesModel.fromJson(response['categories']));
      // print("==========> $categoriesList");
      _isloaded = true;
      update();
    } else {
      print("Error occurred and the error is ");
    }
  }
}
