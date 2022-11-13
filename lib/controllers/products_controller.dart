import 'dart:convert';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant/app_constants.dart';
import '../data/repository/products_repo.dart';
import '../main.dart';
import '../models/cart_Model.dart';
import '../utils/colors.dart';

class ProductsController extends GetxController {
  final ProductsRepo productsRepo = ProductsRepo();

  List<ProductModel> productsList = [];
  @override
  void onInit() {
    super.onInit();
    getProductsList();
  }

  bool _isloaded = false;
  bool get isloaded => _isloaded;

  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;
  // late CartController _cart;

  Future<void> getProductsList() async {
    var response = await productsRepo.getProducts();
    if (response['status'] == "success") {
      response['products'].forEach((v) {
        productsList.add(ProductModel.fromJson(v));
      });
      // print("========> $productsList");
      _isloaded = true;
      update();
    } else {
      print("Error occurred and the error is ");
    }
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
      // print("decrement : " + _quantity.toString());
    }
    update();
  }

  int checkQuantity(int quantity) {
    if ((_inCartItems + quantity) < 0) {
      Get.snackbar("Item count", "You can't reduce more !",
          backgroundColor: AppColors.mailnColor, colorText: Colors.white);
      return 0;
    } else if ((_inCartItems + quantity) > 20) {
      Get.snackbar("Item count", "You can't add more !",
          backgroundColor: AppColors.mailnColor, colorText: Colors.white);
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(ProductModel product) {
    _quantity = 0;
    _inCartItems = 0;
    var exist = false;
    exist = existInCart(product);
    // print("Exist yes or not :" + exist.toString());
    if (exist) {
      _inCartItems = getQuantity(product);
    }
    // print("the quantity in this cart is :" + _inCartItems.toString());
  }

  void addItem(ProductModel product) {
    // _cart.addItem(product, _quantity);
    addItemtest(product, _quantity);
    _quantity = 0;
    _inCartItems = getQuantity(product);
    items.forEach((key, value) {
      print("the id is : " +
          value.id.toString() +
          " the quantity is : " +
          value.quantity.toString());
    });
    update();
  }

  // ---------------------------------------------------------------------

  Map<int, CartModel> _items = {};
  Map<int, CartModel> get items => _items;

  int getQuantity(ProductModel product) {
    var quantity = 0;
    if (_items.containsKey(product.productId)) {
      _items.forEach((key, value) {
        if (key == product.productId) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  void addItemtest(ProductModel product, int quantity) {
    var totalQuantity = 0;
    if (_items.containsKey(product.productId!)) {
      _items.update(product.productId!, (value) {
        totalQuantity = value.quantity! + quantity;
        return CartModel(
          id: value.id,
          name: value.name,
          price: value.price,
          img: value.img,
          quantity: value.quantity! + quantity,
          isExist: true,
          time: DateTime.now().toString(),
          product: product,
        );
      });
      if (totalQuantity <= 0) {
        _items.remove(product.productId);
      }
    } else {
      if (quantity > 0) {
        _items.putIfAbsent(product.productId!, () {
          return CartModel(
            id: product.productId,
            name: product.productName,
            price: product.productPrice,
            img: product.productImage,
            quantity: quantity,
            isExist: true,
            time: DateTime.now().toString(),
            product: product,
          );
        });
      } else {
        Get.snackbar("Item count", "You should at least add item in the cart !",
            backgroundColor: AppColors.mailnColor, colorText: Colors.white);
      }
    }
    addToCartList(getItems);

    update();
  }

  bool existInCart(ProductModel product) {
    if (_items.containsKey(product.productId)) {
      return true;
    } else {
      return false;
    }
  }

  List<CartModel> get getItems {
    return _items.entries.map((e) {
      return e.value;
    }).toList();
  }

  int get totalAmount {
    var total = 0;
    _items.forEach((key, value) {
      total += value.quantity! * value.price!;
    });
    return total;
  }

  void cleanItems() {
    _items = {};
    update();
  }

  set setItems(Map<int, CartModel> setItems) {
    _items = {};
    _items = setItems;
  }

  // ----------- cart repo

  List<String> cart = [];
  void addToCartList(List<CartModel> cartList) {
    /* sharedPreferences.remove(AppConstants.CART_LIST);
    sharedPreferences.remove(AppConstants.CART_HISTORY_LIST);
    return;*/
    var time = DateTime.now().toString();
    cart = [];
    // convert objects to string sharedpreference only accepts string
    cartList.forEach((element) {
      element.time = time;
      return cart.add(jsonEncode(element));
    });
    sharedPreferences.setStringList(AppConstants.CART_LIST, cart);
    getCartList();
  }

  List<CartModel> getCartList() {
    List<String> carts = [];
    if (sharedPreferences.containsKey(AppConstants.CART_LIST)) {
      carts = sharedPreferences.getStringList(AppConstants.CART_LIST)!;
      // print("inside getCartList " + carts.toString());
    }
    List<CartModel> cartList = [];
    carts.forEach((element) {
      cartList.add(CartModel.fromJson(jsonDecode(element)));
    });

    return cartList;
  }

  int get totalItemstest {
    var totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });
    return totalQuantity;
  }
  // ---------------------------------------------------------------------

  int get totalItems {
    return totalItemstest;
  }
}
