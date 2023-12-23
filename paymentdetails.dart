import 'package:cartify/controller/Shoppingcontroller.dart';
import 'package:cartify/utils/theme/app_colors.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class PaymentDetails extends StatefulWidget {
  const PaymentDetails({super.key});

  @override
  State<PaymentDetails> createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  PageController controller = PageController(viewportFraction: 0.8);
  var currPage = 0.0;
  int indexes = 0;
  bool selected = false;

  var cards = [
    "assets/images/visa card.jpg",
    "assets/images/mastercard.jpg",
    "assets/images/American express.png"
  ];

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        currPage = controller.page!;
      });
    });
  }

  final ShoppingCartController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: const BackButton(
          color: AppColors.blackColor,
        ),
        elevation: 0,
        backgroundColor: Colors.grey[100],
        title: Container(
          margin: const EdgeInsets.only(left: 80),
          child: const Text(
            "Payment",
            style: TextStyle(color: AppColors.blackColor),
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 160,
              child: PageView.builder(
                  controller: controller,
                  itemCount: cards.length,
                  itemBuilder: (contex, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 40),
                      child: Image.asset(cards[index]),
                    );
                  }),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15, bottom: 10),
              child: Center(
                child: DotsIndicator(
                  dotsCount: cards.length,
                  position: currPage.round(),
                  decorator: DotsDecorator(
                    activeColor: AppColors.successColor,
                    size: const Size.square(9.0),
                    activeSize: const Size(18.0, 9.0),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: const BoxDecoration(
                      color: AppColors.lightCardColor,
                      borderRadius: BorderRadius.all(Radius.circular(70))),
                  child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        "assets/images/visa.svg",
                        width: 50,
                        height: 50,
                      )),
                ),
                Container(
                  width: 70,
                  height: 70,
                  decoration: const BoxDecoration(
                      color: AppColors.lightCardColor,
                      borderRadius: BorderRadius.all(Radius.circular(70))),
                  child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        "assets/images/paypal.svg",
                        width: 70,
                        height: 70,
                      )),
                ),
                Container(
                  width: 70,
                  height: 70,
                  decoration: const BoxDecoration(
                      color: AppColors.lightCardColor,
                      borderRadius: BorderRadius.all(Radius.circular(70))),
                  child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        "assets/images/mastercard.svg",
                        width: 50,
                        height: 50,
                      )),
                ),
                Container(
                  width: 70,
                  height: 70,
                  decoration: const BoxDecoration(
                      color: AppColors.lightCardColor,
                      borderRadius: BorderRadius.all(Radius.circular(70))),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        size: 30,
                      )),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                "Card Number",
                style: TextStyle(fontSize: 17),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              width: 400,
              height: 50,
              child: TextFormField(
                keyboardType: TextInputType.number,
                // obscureText: _confirmVisible,
                // controller: _password,
                style: const TextStyle(
                  letterSpacing: 2,
                  height: 1,
                  wordSpacing: 3,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  hintText: '*******************1234',
                  filled: true,
                  fillColor: AppColors.lightCardColor,
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                "Cash Header Name",
                style: TextStyle(fontSize: 17),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              width: 400,
              height: 50,
              child: TextFormField(
                // obscureText: _confirmVisible,
                // controller: _password,
                style: const TextStyle(
                  letterSpacing: 2,
                  height: 1,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  hintText: 'Jenifer Lopez',
                  filled: true,
                  fillColor: AppColors.lightCardColor,
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "Expiry Date",
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 5, right: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      width: 90,
                      height: 40,
                      child: TextFormField(
                        keyboardType: TextInputType.datetime,
                        // obscureText: _confirmVisible,
                        // controller: _password,
                        style: const TextStyle(
                          letterSpacing: 2,
                          height: 1,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          hintText: 'MM/YY',
                          filled: true,
                          fillColor: AppColors.lightCardColor,
                          hintStyle: TextStyle(color: Colors.grey[600]),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "CVV",
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      width: 60,
                      height: 40,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        // obscureText: _confirmVisible,
                        // controller: _password,
                        style: const TextStyle(
                          letterSpacing: 4,
                          height: 1,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          hintText: '***',
                          filled: true,
                          fillColor: AppColors.lightCardColor,
                          hintStyle: TextStyle(color: Colors.grey[600]),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: selected,
                  onChanged: (newValue) {},
                ),
                const Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Select Cart Information",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10, top: 5),
                  child: Text(
                    "Total",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
                  child: Text(
                    "\$ ${productController.total.value.round()}",
                    style: const TextStyle(fontSize: 17),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(
                  bottom: 10, left: 15, right: 15, top: 10),
              width: 380,
              decoration: const BoxDecoration(
                  color: AppColors.brandColor,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: TextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            )),
                            backgroundColor: AppColors.lightCardColor,
                            child: SizedBox(
                              height: 400,
                              width: 1000,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Center(
                                      child: Image.asset(
                                        "assets/images/congratulations.jpg",
                                        width: 150,
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Text(
                                      "Order Sucessful",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const Text(
                                      "your order Id#5466 sucessfully placed"),
                                  Container(
                                      margin: const EdgeInsets.only(top: 30),
                                      width: 250,
                                      decoration: BoxDecoration(
                                          color: AppColors.brandColor,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: TextButton(
                                          onPressed: () {},
                                          child: const Text(
                                            "Track My Order",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color:
                                                    AppColors.lightCardColor),
                                          ))),
                                  Container(
                                      margin: const EdgeInsets.only(top: 10),
                                      width: 250,
                                      decoration: BoxDecoration(
                                          color: AppColors.lightCardColor,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text(
                                            "Go Back",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: AppColors.blackColor),
                                          )))
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  child: const Text(
                    "Pay Now",
                    style: TextStyle(color: AppColors.whiteColor, fontSize: 18),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
