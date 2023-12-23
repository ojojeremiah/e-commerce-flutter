import 'package:cartify/screens/login.dart';
import 'package:cartify/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class FirstSignUpScreen extends StatelessWidget {
  const FirstSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 80, left: 0, bottom: 20),
                  child: Image.asset("assets/images/phone.png")),
              const Center(
                child: Text(
                  "Let's you in",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          margin: const EdgeInsets.only(top: 20),
                          width: 350,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              border: Border.all(
                                  width: 1,
                                  color:
                                      const Color.fromRGBO(204, 204, 204, 1))),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 30,
                                child: SvgPicture.asset(
                                  "assets/images/facebook.svg",
                                ),
                              ),
                              const Text(
                                "Continue with Facebook",
                                style: TextStyle(color: AppColors.blackColor),
                              )
                            ],
                          )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          margin: const EdgeInsets.only(top: 20),
                          width: 350,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              border: Border.all(
                                  width: 1,
                                  color:
                                      const Color.fromRGBO(204, 204, 204, 1))),
                          child: Row(
                            children: [
                              Container(
                                height: 30,
                                margin: const EdgeInsets.only(left: 25),
                                child: SvgPicture.asset(
                                  "assets/images/google.svg",
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 40),
                                child: const Text(
                                  "Continue with Google",
                                  style: TextStyle(color: AppColors.blackColor),
                                ),
                              )
                            ],
                          )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          margin: const EdgeInsets.only(top: 20),
                          width: 350,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              border: Border.all(
                                  width: 1,
                                  color:
                                      const Color.fromRGBO(204, 204, 204, 1))),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 30,
                                child: SvgPicture.asset(
                                  "assets/images/apple.svg",
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                child: const Text(
                                  "Continue with Apple",
                                  style: TextStyle(color: AppColors.blackColor),
                                ),
                              )
                            ],
                          )),
                    ),
                  ),
                ],
              ),
              Center(
                child: Row(
                  children: [
                    const Divider(
                      color: AppColors.blackColor,
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 190, top: 10),
                        child: const Text(
                          "Or",
                          style: TextStyle(fontSize: 20),
                        )),
                    const Divider(
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              Container(
                width: 400,
                margin: const EdgeInsets.only(top: 20),
                decoration: const BoxDecoration(
                    color: AppColors.brandColor,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: TextButton(
                    onPressed: () {
                      Get.to(const LoginPage());
                    },
                    child: const Text(
                      "Sign in with Password",
                      style:
                          TextStyle(color: AppColors.whiteColor, fontSize: 18),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
