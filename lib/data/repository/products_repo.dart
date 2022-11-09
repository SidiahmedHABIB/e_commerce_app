import '../../constant/app_constants.dart';
import '../api/crud.dart';

class ProductsRepo {
  final Crud crud = Crud();

  Future getProducts() async {
    var response = await crud.postRequest(AppConstants.PRODUCTS_URI, {});
    return response;
  }
}
