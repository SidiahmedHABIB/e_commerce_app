class AppConstants {
  static const String APP_NAME = "DIGISTORE";
  // static const int VERSION = 1;

  static const String BASE_URL = "http://10.0.2.2:888/ecommerce_app/api";

  // auth
  static const String SIGNUP_URI = "$BASE_URL/auth/signup.php";
  static const String SIGNIN_URI = "$BASE_URL/auth/login.php";

  // categories
  static const String CATEGORIES_URI =
      "$BASE_URL/categories/get_categories.php";
  static const String CATEGORIES_BY_INDEX_URI =
      "$BASE_URL/categories/category_by_index.php";

  // products
  static const String PRODUCTS_URI = "$BASE_URL/products/get_products.php";

// assets path
  static const String ASSETS_PRODUCTS = "assets/upload/products/";
  static const String ASSETS_CATEGORIES = "assets/upload/categories/";

// discount
  static const String DISCOUNT_URI = "$BASE_URL/discount/get_discount.php";
}
