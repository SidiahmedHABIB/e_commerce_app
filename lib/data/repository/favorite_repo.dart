import '../../constant/app_constants.dart';
import '../api/crud.dart';

class FavoriteRepo {
  final Crud crud = Crud();

  Future getFavoriteIds(String userId) async {
    var response = await crud.postRequest(
        AppConstants.FAVORITE_GET_URI, {"favorite_user_id": userId});
    return response;
  }

  Future getFavoriteProducts(int productId) async {
    var response = await crud.postRequest(
        AppConstants.FAVORITE_GET_PRODUCT_URI, {"product_id": productId});
    return response;
  }
}
