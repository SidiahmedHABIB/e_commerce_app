import 'package:e_commerce_app/data/repository/favorite_repo.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  FavoriteRepo favoriteRepo = FavoriteRepo();
  bool _isloaded = false;
  bool get isloaded => _isloaded;
  List<int> productIdList = [];

  List<ProductModel> favoriteProductsList = [];
  @override
  void onInit() {
    super.onInit();
    // getFavoritesProductsList();
  }

  Future<void> getFavoritesProductsList() async {
    // var response = await favoriteRepo.getFavoriteIds("5");
    // var response = await favoriteRepo.getFavoriteProducts(2);

    // if (response['status'] == "success") {
    //   productIdList = [1, 2, 5];

    // productIdList.forEach((v) async {
    // var response = await favoriteRepo.getFavoriteProducts(v);
    // if (response['status'] == "success") {
    //   favoriteProductsList.add(ProductModel.fromJson(response['product']));
    // }
    // });
    //   print("========> $favoriteProductsList");
    //   _isloaded = true;
    //   update();
    // } else {
    //   print("Error occurred and the error is ");
    // }
  }
}
