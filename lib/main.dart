import 'package:e_commerce_app/utils/main_bindings.dart';
import 'package:e_commerce_app/view/home.pages/home_page.dart';
import 'package:e_commerce_app/view/onboarding.page/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharedPreferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: MainBindings(),
      home: sharedPreferences.getString("id") == null
          ? const OnboardingPage()
          : HomePage(),
      // home: SignInPage(),
    );
  }
}
