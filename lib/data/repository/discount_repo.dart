import '../../constant/app_constants.dart';
import '../api/crud.dart';

class DiscountRepo {
  final Crud crud = Crud();

  Future getDiscounts() async {
    var response = await crud.postRequest(AppConstants.DISCOUNT_URI, {});
    return response;
  }
}
