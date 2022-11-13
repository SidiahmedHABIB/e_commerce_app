import 'dart:async';

import 'package:e_commerce_app/utils/colors.dart';
import 'package:e_commerce_app/view/home.pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/app_constants.dart';
import '../../routes/route_helper.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () => Get.offNamed(RouteHelper.getInitial()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Image.asset("${AppConstants.ASSETS_IMAGES}logo1.png",
              width: 300)),
    );
  }
}
