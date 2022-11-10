import 'package:e_commerce_app/view/categories.page/categories_page.dart';
import 'package:e_commerce_app/view/home.pages/body_home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/big_text_widget.dart';
import '../../widgets/small_text.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        // showwing the header
        Container(
          margin: EdgeInsets.only(
              top: Dimensions.heigth25, bottom: Dimensions.heigth10),
          padding: EdgeInsets.only(
              left: Dimensions.width20, right: Dimensions.width20),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/image/lolo1.png",
                  height: Dimensions.heigth25 * 2,
                ),
                Container(
                  height: Dimensions.heigth45,
                  width: Dimensions.width45,
                  child: Icon(Icons.search, color: Colors.white),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.heigth15),
                      color: AppColors.mailnColor),
                ),
              ]),
        ),

        // showwing the body
        Expanded(
          child: SingleChildScrollView(child: BodyHomePage()),
        ),
      ]),
    );
  }
}
