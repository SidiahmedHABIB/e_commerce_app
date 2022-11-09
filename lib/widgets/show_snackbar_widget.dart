import 'package:e_commerce_app/widgets/big_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackBar(String message, Color colorbg,
    {bool isError = true, String title = "Error"}) {
  Get.snackbar(
    title,
    message,
    titleText: BigTextWidget(text: title, color: Colors.white),
    messageText: Text(message, style: TextStyle(color: Colors.white)),
    backgroundColor: colorbg,
    colorText: Colors.white,
    snackPosition: SnackPosition.TOP,
  );
}
