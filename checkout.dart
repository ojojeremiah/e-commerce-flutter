import 'package:cartify/controller/Shoppingcontroller.dart';
import 'package:cartify/screens/paymentdetails.dart';
import 'package:cartify/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOut extends StatefulWidget {
  // ShoppingCartModel cartModel;
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  final ShoppingCartController productController = Get.find();
  int shippingfee = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[100],
        title: Container(
          margin: const EdgeInsets.only(left: 80),
          child: const Text(
            "Checkout",
            style: TextStyle(
                color: AppColors.blackColor, fontWeight: FontWeight.bold),
          ),
        ),
        leading: const BackButton(color: AppColors.darkCardColor),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: productController.products.length,
                itemBuilder: (context, index) {
                  //  final = products[index];
                  final product = productController.products[index];
                  return Container(
                    height: 200,
                    width: 360,
                    margin: const EdgeInsets.only(
                        top: 10, left: 25, right: 20, bottom: 10),
                    decoration: BoxDecoration(
                        color: AppColors.lightCardColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 150,
                                margin: const EdgeInsets.only(top: 10),
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  product.title!,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Row(
                                  children: [
                                    Text('Review (${product.rating!.rate!}'),
                                    const Icon(
                                      Icons.star,
                                      size: 17,
                                      color: Colors.orange,
                                    ),
                                    const Text(")"),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: SizedBox(
                                  width: 80,
                                  child: Text(
                                    // overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    "\$ ${product.totalprice = product.price! * product.quantity}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text(
                                    "quantity :",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(
                                      width: 30,
                                      child: Center(
                                        child: Text(
                                          "${product.quantity}",
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )),
                                ],
                              )
                            ],
                          ),
                          Container(
                            height: 220,
                            width: 160,
                            margin: const EdgeInsets.only(
                              left: 20,
                            ),
                            decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                              image: NetworkImage(product.image!),
                              fit: BoxFit.cover,
                            )),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 40),
            height: 150,
            width: 369,
            decoration: BoxDecoration(
                color: AppColors.lightCardColor,
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Order Summary",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Store Total",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Text("\$ ${productController.total.value.round()}",
                            // overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(
                                fontSize: 17, color: Colors.grey)),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Shipping fee",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Text("\$ $shippingfee",
                            // overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(
                                fontSize: 17, color: Colors.grey)),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Text(
                          "\$ ${productController.total.value.round() + shippingfee}",
                          // overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                              fontSize: 17, color: Colors.grey)),
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            width: 380,
            decoration: const BoxDecoration(
                color: AppColors.brandColor,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: TextButton(
                onPressed: () {
                  Get.to(const PaymentDetails());
                },
                child: const Text(
                  "Proceed to payment",
                  style: TextStyle(color: AppColors.whiteColor, fontSize: 18),
                )),
          ),
        ],
      ),
    );
  }
}
