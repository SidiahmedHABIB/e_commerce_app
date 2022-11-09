import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_commerce_app/utils/colors.dart';
import 'package:e_commerce_app/utils/dimensions.dart';
import 'package:e_commerce_app/view/auth.page/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/onboarding_card_widget.dart';
import '../home.pages/main_home_page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  var boardController = PageController();

  var _currPageValue = 0.0;

  @override
  void initState() {
    super.initState();
    boardController.addListener(() {
      setState(() {
        _currPageValue = boardController.page!;
      });
    });
  }

  bool islast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: Dimensions.heigth40),
        child: Center(
          child: Column(children: [
            SizedBox(height: Dimensions.heigth120),

            // carasoul onboarding
            SizedBox(
              height: Dimensions.heigth100 * 3.8,
              child: PageView.builder(
                  onPageChanged: (int index) {
                    if (index == boarding.length - 1) {
                      setState(() {
                        islast = true;
                      });
                    } else {
                      setState(() {
                        islast = false;
                      });
                    }
                  },
                  physics: BouncingScrollPhysics(),
                  controller: boardController,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      OnboardingCardWidget(boarding[index]),
                  itemCount: boarding.length),
            ),
            SizedBox(height: Dimensions.heigth40 * 2),
            Container(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Dots
                  DotsIndicator(
                    dotsCount: boarding.length,
                    position: _currPageValue,
                    decorator: DotsDecorator(
                      activeColor: AppColors.mailnColor,
                      size: const Size.square(12.0),
                      activeSize: const Size(40.0, 12.0),
                      activeShape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(Dimensions.heigth5)),
                    ),
                  ),
                  const Spacer(),
                  // float button
                  FloatingActionButton(
                    onPressed: () {
                      boardController.nextPage(
                          duration: Duration(milliseconds: 2000),
                          curve: Curves.fastLinearToSlowEaseIn);
                      if (islast) {
                        Get.off(SignInPage());
                      }
                    },
                    child: Icon(Icons.arrow_forward_ios),
                    backgroundColor: AppColors.mailnColor,
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
