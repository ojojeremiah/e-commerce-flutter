import 'package:cartify/controller/user_controller.dart';
import 'package:cartify/services/app_service_locator.dart';
import 'package:cartify/utils/theme/app_colors.dart';
import 'package:cartify/widget/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool _confirmVisible = true;
  bool task = false;
  // text: "mor_2314"
  // text: "83r5^_"
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: ListView(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Text(
                      "Login to Your Account",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20, top: 20),
                      child: Row(
                        children: [
                          const Icon(Icons.email_outlined),
                          Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: const Text("Email",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)))
                        ],
                      ),
                    ),
                    Container(
                      width: ScreenUtil().setWidth(350),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      margin: const EdgeInsets.only(top: 10),
                      child: TextFormField(
                        controller: _email,
                        onSaved: (s) {
                          _email.text = s!;
                        },
                        validator: (v) {
                          if (v!.isEmpty) {
                            return "Email Required";
                          }
                          return null;
                        },
                        style: const TextStyle(
                          height: 1,
                          wordSpacing: 2,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          hintText: 'aishannor41@gmail.com',
                          filled: true,
                          fillColor: Colors.grey[100],
                          hintStyle: TextStyle(color: Colors.grey[600]),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20, top: 20),
                      child: Row(
                        children: [
                          const Icon(Icons.lock_outline),
                          Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: const Text(
                                "Password",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ))
                        ],
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          width: ScreenUtil().setWidth(350),
                          decoration: const BoxDecoration(),
                          margin: const EdgeInsets.only(top: 10, left: 5),
                          child: TextFormField(
                            onSaved: (s) {
                              _password.text = s!;
                            },
                            validator: (v) {
                              if (v!.isEmpty) {
                                return "Password Required";
                              }
                              return null;
                            },
                            obscureText: _confirmVisible,
                            controller: _password,
                            style: const TextStyle(
                              height: 1,
                              wordSpacing: 2,
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(10),
                              hintText: 'Password',
                              filled: true,
                              fillColor: Colors.grey[100],
                              hintStyle: TextStyle(color: Colors.grey[600]),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.only(left: 330, top: 15),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _confirmVisible = !_confirmVisible;
                                });
                              },
                              child: Icon(_confirmVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ))
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: task,
                          onChanged: (newValue) {},
                        ),
                        const Text("Remember me"),
                        Container(
                            margin: const EdgeInsets.only(left: 97),
                            child: TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "Forgot password ?",
                                  style: TextStyle(color: AppColors.blackColor),
                                )))
                      ],
                    ),
                    Container(
                      width: ScreenUtil().setWidth(330),
                      margin: const EdgeInsets.only(top: 20),
                      decoration: const BoxDecoration(
                          color: AppColors.brandColor,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Obx(
                        () => TextButton(
                            onPressed: () async {
                              if (!_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                if (_email.text.isEmpty ||
                                    _password.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content:
                                              Text('Fill Required fields')));
                                }
                                //  Get.to( AccountValidation());
                              } else {
                                var result =
                                    await getIt<UserContoller>().authenticate(
                                  username: _email.text,
                                  password: _password.text,
                                );
                                if (result == 'Okay') {
                                  Get.to(const BottomNav());
                                }
                              }
                            },
                            child: getIt<UserContoller>().isPosting.value
                                ? const CircularProgressIndicator(
                                    color: AppColors.lightCardColor,
                                  )
                                : const Text(
                                    "Log In",
                                    style: TextStyle(
                                        color: AppColors.whiteColor,
                                        fontSize: 18),
                                  )),
                      ),
                    ),
                    Center(
                        child: Row(
                      children: [
                        const Divider(
                          color: AppColors.blackColor,
                        ),
                        Container(
                            margin: const EdgeInsets.only(left: 120, top: 20),
                            child: const Text(
                              "Or Continue with",
                              style: TextStyle(fontSize: 18),
                            )),
                        const Divider(
                          color: Colors.black,
                        ),
                      ],
                    )),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 60,
                            height: 40,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1,
                                    color:
                                        const Color.fromRGBO(204, 204, 204, 1)),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5))),
                            child: IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                    "assets/images/facebook.svg")),
                          ),
                          Container(
                            width: 60,
                            height: 40,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1,
                                    color:
                                        const Color.fromRGBO(204, 204, 204, 1)),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5))),
                            child: IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                    "assets/images/google.svg")),
                          ),
                          Container(
                            width: 60,
                            height: 40,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1,
                                    color:
                                        const Color.fromRGBO(204, 204, 204, 1)),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5))),
                            child: IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                    "assets/images/apple.svg")),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 145),
                      child: Row(
                        children: [
                          Container(
                              margin: const EdgeInsets.only(left: 85),
                              child: const Text("Don't have an account?")),
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Sign up",
                                style: TextStyle(color: AppColors.brandColor),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
