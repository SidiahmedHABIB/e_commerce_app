import 'package:e_commerce_app/models/categories_model.dart';
import 'package:get/get.dart';
import '../../constant/app_constants.dart';
import '../api/crud.dart';

class CategoriesRepo {
  final Crud crud = Crud();

  Future getCategories() async {
    var response = await crud.postRequest(AppConstants.CATEGORIES_URI, {});
    return response;
  }

  Future getCategoriesByIndex(String index) async {
    var response = await crud
        .postRequest(AppConstants.CATEGORIES_BY_INDEX_URI, {"index": index});
    return response;
  }
}
