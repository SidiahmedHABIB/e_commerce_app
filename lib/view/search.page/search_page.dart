import 'package:e_commerce_app/utils/colors.dart';
import 'package:e_commerce_app/utils/dimensions.dart';
import 'package:e_commerce_app/widgets/big_text_widget.dart';
import 'package:e_commerce_app/widgets/small_text.dart';
import 'package:e_commerce_app/widgets/text_field_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    var productName = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mailnColor,
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: Dimensions.heigth10,
          right: Dimensions.width20,
          left: Dimensions.width20,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: productName,
                    decoration: InputDecoration(
                      // hinttext
                      hintText: "Search",
                      // prefixIcon
                      prefixIcon: Icon(
                        Icons.search,
                        color: AppColors.mailnColor,
                      ),
                      // focusedBorder
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.black26,
                        ),
                      ),
                      // enabledBoreder
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.black26,
                        ),
                      ),
                      // border
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                // button
                SizedBox(width: Dimensions.width5),
                Container(
                  padding: EdgeInsets.all(15),
                  child: SmallText(
                    text: "Search",
                    color: Colors.white,
                    size: 22,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: BoxDecoration(
                      color: AppColors.mailnColor,
                      borderRadius: BorderRadius.circular(Dimensions.heigth10)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
