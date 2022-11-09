import 'package:e_commerce_app/data/api/crud.dart';
import 'package:e_commerce_app/main.dart';
import 'package:e_commerce_app/view/auth.page/signin_page.dart';
import 'package:e_commerce_app/view/home.pages/main_home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant/app_constants.dart';
import '../utils/colors.dart';
import '../widgets/show_snackbar_widget.dart';

class AuthController {
  Crud _crud = Crud();

  Future signUp(
      String user, String phone, String email, String password) async {
    var response = await _crud.postRequest(AppConstants.SIGNUP_URI,
        {"user": user, "phone": phone, "email": email, "pwd": password});
    if (response['status'] == "success") {
      showSnackBar("Registration succecfully ", AppColors.mailnColor,
          title: "Perfect");
      Get.to(SignInPage());
    }
  }

  Future signIn(String email, String password) async {
    var response = await _crud.postRequest(
        AppConstants.SIGNIN_URI, {"email": email, "pwd": password});
    if (response['status'] == "success") {
      sharedPreferences.setString("id", response['data']['id_user'].toString());
      sharedPreferences.setString(
          "name", response['data']['name_user'].toString());
      sharedPreferences.setString(
          "phone", response['data']['phone_user'].toString());
      sharedPreferences.setString(
          "email", response['data']['email_user'].toString());
      print(response['data']['id_user'].toString());
      print(response['data']['name_user'].toString());
      print(response['data']['email_user'].toString());
      showSnackBar("Login succecfully ", AppColors.mailnColor,
          title: "Perfect");
      Get.off(MainHomePage());
      return response;
    } else {
      showSnackBar("Login Failed ", Colors.red.shade400, title: "Error");
    }
  }

  void lougOut() {
    sharedPreferences.clear();
    Get.off(SignInPage());
  }
}
