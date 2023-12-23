import 'package:cartify/controller/Shoppingcontroller.dart';
import 'package:cartify/model/products.dart';
import 'package:cartify/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Description extends StatefulWidget {
  final Products products;
  Description({super.key, required this.products});
  final ShoppingCartController productController =
      Get.put(ShoppingCartController());

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const BackButton(
            color: AppColors.blackColor,
          ),
          elevation: 0,
          backgroundColor: Colors.grey[100],
          title: Container(
              margin: const EdgeInsets.only(left: 100),
              child: const Text(
                "Details",
                style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              )),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    margin: const EdgeInsets.only(top: 30, left: 90),
                    height: 300,
                    child: Image.network(widget.products.image!)),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  height: 380,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: Text(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              widget.products.title!,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$ ${widget.products.price}",
                                style: const TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "(${widget.products.rating!.count!} reviews )",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[500]),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 330),
                          child: Row(
                            children: [
                              Text(
                                "${widget.products.rating!.rate!}",
                                style: const TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              const Icon(
                                Icons.star_outlined,
                                color: Colors.orange,
                                size: 17,
                              )
                            ],
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: Text(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 5,
                              widget.products.description!,
                              style: TextStyle(
                                  color: Colors.grey[500],
                                  fontWeight: FontWeight.bold),
                            )),
                        Container(
                            width: 350,
                            margin: const EdgeInsets.only(top: 30, left: 15),
                            decoration: const BoxDecoration(
                                color: AppColors.brandColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            child: TextButton(
                                onPressed: () {
                                  widget.productController
                                      .updateProducts(widget.products);
                                },
                                child: const Text(
                                  "Add to Cart",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: AppColors.lightCardColor),
                                )))
                      ],
                    ),
                  )),
            ],
          ),
        ));
  }
}
