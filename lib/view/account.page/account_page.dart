import 'package:e_commerce_app/controllers/auth_controller.dart';
import 'package:e_commerce_app/main.dart';
import 'package:e_commerce_app/widgets/big_text_widget.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/account_widget.dart';
import '../../widgets/app_icon.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = AuthController();
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(bottom: 15),
        child: Column(children: [
          // header
          Container(
            padding: EdgeInsets.only(top: Dimensions.heigth15),
            width: double.maxFinite,
            height: Dimensions.heigth30 * 2.5,
            decoration: BoxDecoration(color: AppColors.mailnColor, boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 0),
              )
            ]),
            child: Center(
                child: BigTextWidget(
              text: "Account",
              size: 30,
              color: Colors.white,
            )),
          ),
          SizedBox(height: Dimensions.heigth15),

          // list of informations
          Center(
              child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
                color: AppColors.mailnColor,
                borderRadius: BorderRadius.circular(100)),
            child: Icon(
              Icons.person,
              color: Colors.white,
              size: 100,
            ),
          )),

          SizedBox(height: Dimensions.heigth5),
          // expanded column information
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // username
                  AccountWidget(
                    appIcon: AppIcon(
                      icon: Icons.person,
                      iconColor: Colors.white,
                      backgroundcolor: AppColors.mailnColor,
                      size: 50,
                      iconsize: 30,
                    ),
                    bigText: BigTextWidget(
                      text: sharedPreferences.getString("name").toString(),
                      size: 22,
                    ),
                  ),
                  // phone nember
                  AccountWidget(
                    appIcon: AppIcon(
                      icon: Icons.phone,
                      iconColor: Colors.white,
                      backgroundcolor: AppColors.yellowColor,
                      size: 50,
                      iconsize: 30,
                    ),
                    bigText: BigTextWidget(
                      text: sharedPreferences.getString("phone").toString(),
                      size: 22,
                    ),
                  ),
                  // email adress
                  AccountWidget(
                    appIcon: AppIcon(
                      icon: Icons.mail,
                      iconColor: Colors.white,
                      backgroundcolor: AppColors.yellowColor,
                      size: 50,
                      iconsize: 30,
                    ),
                    bigText: BigTextWidget(
                      text: sharedPreferences.getString("email").toString(),
                      size: 22,
                    ),
                  ),
                  // location
                  AccountWidget(
                    appIcon: AppIcon(
                      icon: Icons.location_on,
                      iconColor: Colors.white,
                      backgroundcolor: AppColors.yellowColor,
                      size: 50,
                      iconsize: 30,
                    ),
                    bigText: BigTextWidget(
                      text: "Hammam Sousse ",
                      size: 22,
                    ),
                  ),
                  // commants
                  AccountWidget(
                    appIcon: AppIcon(
                      icon: Icons.comment,
                      iconColor: Colors.white,
                      backgroundcolor: Colors.red.shade400,
                      size: 50,
                      iconsize: 30,
                    ),
                    bigText: BigTextWidget(
                      text: "hello sda",
                      size: 22,
                    ),
                  ),
                  // logout
                  GestureDetector(
                    onTap: () => authController.lougOut(),
                    child: AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.logout,
                        iconColor: Colors.white,
                        backgroundcolor: Colors.red.shade400,
                        size: 50,
                        iconsize: 30,
                      ),
                      bigText: BigTextWidget(
                        text: "Logout",
                        size: 22,
                      ),
                    ),
                  ),
                  SizedBox(height: Dimensions.heigth15),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
