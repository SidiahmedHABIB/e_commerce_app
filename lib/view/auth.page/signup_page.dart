import 'package:e_commerce_app/controllers/auth_controller.dart';
import 'package:e_commerce_app/view/auth.page/signin_page.dart';
import 'package:e_commerce_app/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/app_constants.dart';
import '../../utils/colors.dart';
import '../../widgets/big_text_widget.dart';
import '../../widgets/show_snackbar_widget.dart';
import '../../widgets/text_field_widget.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var emailController = TextEditingController();
    var pwdController = TextEditingController();

    AuthController authController = AuthController();

    void _registration() {
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String email = emailController.text.trim();
      String password = pwdController.text.trim();
      if (name.isEmpty) {
        showSnackBar("Type in your name", Colors.red.shade400, title: "Name");
      } else if (phone.isEmpty) {
        showSnackBar("Type in your phone number", Colors.red.shade400,
            title: "Phone number");
      } else if (email.isEmpty) {
        showSnackBar("Type in your email adress", Colors.red.shade400,
            title: "Email Adress");
      } else if (!GetUtils.isEmail(email)) {
        showSnackBar("Type in a valid email adress", Colors.red.shade400,
            title: "Email Adress");
      } else if (password.isEmpty) {
        showSnackBar("Type in your password", Colors.red.shade400,
            title: "Password");
      } else if (password.length < 6) {
        showSnackBar("Password can not be less then 6", Colors.red.shade400,
            title: "Password");
      } else {
        authController.signUp(name, phone, email, password);
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Center(
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: Dimensions.width30),
            child: Column(children: [
              SizedBox(height: Dimensions.heigth30),
              GestureDetector(
                onTap: () => Get.off(SignInPage()),
                child: Row(
                  children: [
                    Container(
                        padding: EdgeInsets.all(Dimensions.heigth10),
                        decoration: BoxDecoration(
                            color: AppColors.mailnColor,
                            borderRadius:
                                BorderRadius.circular(Dimensions.heigth15)),
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: Dimensions.heigth20,
                          color: Colors.white,
                        )),
                  ],
                ),
              ),
              Container(
                width: 120 * 2,
                child: Image.asset("${AppConstants.ASSETS_IMAGES}logo1.png"),
              ),
              Row(
                children: [
                  BigTextWidget(
                    text: "Sign Up",
                    size: 45,
                    color: AppColors.mailnColor,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Column(children: [
                TextFieldWidget(
                  hintText: "Username",
                  icon: Icons.person,
                  textController: nameController,
                ),
                SizedBox(height: 15),
                TextFieldWidget(
                  hintText: "Phone",
                  icon: Icons.phone,
                  textController: phoneController,
                ),
                SizedBox(height: 15),
                TextFieldWidget(
                  hintText: "Email",
                  icon: Icons.email,
                  textController: emailController,
                ),
                SizedBox(height: 15),
                TextFieldWidget(
                  hintText: "Password",
                  icon: Icons.password,
                  textController: pwdController,
                ),
                SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    _registration();
                  },
                  child: Container(
                    width: double.maxFinite,
                    height: 60,
                    margin: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                        color: AppColors.mailnColor,
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: BigTextWidget(
                        text: "Register",
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                SizedBox(height: 30),
              ])
            ]),
          ),
        ),
      ),
    );
  }
}
