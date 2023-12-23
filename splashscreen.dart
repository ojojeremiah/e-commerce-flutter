import 'package:cartify/model/splash.dart';
import 'package:cartify/screens/login.dart';
import 'package:cartify/utils/theme/app_colors.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var _currPageValue = 0.0;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  PageController pageController = PageController(viewportFraction: 1.0);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 600,
                width: double.maxFinite,
                child: PageView.builder(
                    controller: pageController,
                    itemCount: screens.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Center(
                            child: Column(
                              children: [
                                Container(
                                    margin: const EdgeInsets.only(
                                      top: 180,
                                    ),
                                    child: Image.asset(screens[index].image)),
                                Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    width: 270,
                                    child: Text(
                                      screens[index].header,
                                      style: const TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    )),
                                Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    width: 300,
                                    child: Text(
                                      screens[index].text,
                                      style: const TextStyle(
                                          color: AppColors.smallText),
                                    ))
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
              ),
            ),
            Center(
              child: DotsIndicator(
                dotsCount: screens.length,
                position: _currPageValue.round(),
                decorator: DotsDecorator(
                  activeColor: AppColors.successColor,
                  size: const Size.square(9.0),
                  activeSize: const Size(18.0, 9.0),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  width: 300,
                  decoration: const BoxDecoration(
                      color: AppColors.brandColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: TextButton(
                      onPressed: () {
                        Get.to(const LoginPage());
                      },
                      child: const Text(
                        "Get Started",
                        style: TextStyle(color: AppColors.whiteColor),
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
