import 'package:e_commerce_app/view/auth.page/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../constant/app_constants.dart';
import '../../controllers/auth_controller.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/big_text_widget.dart';
import '../../widgets/show_snackbar_widget.dart';
import '../../widgets/text_field_widget.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var pwdController = TextEditingController();

    AuthController authController = AuthController();

    void _login() {
      String email = emailController.text.trim();
      String password = pwdController.text.trim();

      if (email.isEmpty) {
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
        authController.signIn(email, password);
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
              SizedBox(height: Dimensions.heigth20),
              Container(
                width: 120 * 2.5,
                child: Image.asset("${AppConstants.ASSETS_IMAGES}logo1.png"),
              ),
              Row(
                children: [
                  BigTextWidget(
                    text: "Sign in",
                    size: 45,
                    color: AppColors.mailnColor,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Column(children: [
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
                SizedBox(height: 25),
                GestureDetector(
                  onTap: () {
                    _login();
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
                        text: "Sign In",
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 80,
                      height: 2,
                      color: Colors.black26,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Don't have accounte ",
                      style: TextStyle(color: Colors.black45, fontSize: 15),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 80,
                      height: 2,
                      color: Colors.black26,
                    ),
                  ],
                ),
                SizedBox(height: 15),
                GestureDetector(
                  onTap: (() {
                    Get.off(SignUpPage());
                  }),
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
                SizedBox(height: 30),
                SizedBox(height: 30),
              ])
            ]),
          ),
        ),
      ),
    );
  }
}
