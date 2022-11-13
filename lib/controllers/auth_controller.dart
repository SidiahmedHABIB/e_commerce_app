import 'package:e_commerce_app/data/api/crud.dart';
import 'package:e_commerce_app/main.dart';
import 'package:e_commerce_app/models/user_model.dart';
import 'package:e_commerce_app/view/auth.page/signin_page.dart';
import 'package:e_commerce_app/view/home.pages/home_page.dart';
import 'package:e_commerce_app/view/home.pages/main_home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant/app_constants.dart';
import '../utils/colors.dart';
import '../widgets/show_snackbar_widget.dart';

class AuthController {
  Crud _crud = Crud();
  UserModel? user;

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
      user = UserModel.fromJson(response['user']);

      sharedPreferences.setString("id", user!.idUser.toString());
      sharedPreferences.setString("name", user!.nameUser.toString());
      sharedPreferences.setString("phone", user!.phoneUser.toString());
      sharedPreferences.setString("email", user!.emailUser.toString());
      // print(response['user']['id_user'].toString());
      // print(response['user']['name_user'].toString());
      // print(response['user']['email_user'].toString());
      print(user!.idUser.toString());
      showSnackBar("Login succecfully ", AppColors.mailnColor,
          title: "Perfect");
      Get.off(HomePage());
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
