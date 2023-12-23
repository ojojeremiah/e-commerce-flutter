import 'package:cartify/controller/Shoppingcontroller.dart';
import 'package:cartify/screens/checkout.dart';
import 'package:cartify/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});
  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  final ShoppingCartController productController =
      Get.put(ShoppingCartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: const BackButton(color: AppColors.blackColor),
        elevation: 0,
        backgroundColor: Colors.grey[100],
        title: Container(
          margin: const EdgeInsets.only(left: 70),
          child: const Text(
            'Cart',
            style: TextStyle(
                color: AppColors.blackColor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        children: [
          Obx(
            () => Expanded(
              child: productController.products.isEmpty
                  ? const Center(child: Text("Your Cart is Empty "))
                  : ListView.builder(
                      itemCount: productController.products.length,
                      itemBuilder: (context, index) {
                        //  final = products[index];
                        final product = productController.products[index];
                        return Dismissible(
                          background: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: AppColors.brandColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Icon(Icons.delete_outline,
                                color: AppColors.lightCardColor),
                          ),
                          key: Key(product.id.toString()),
                          confirmDismiss: (DismissDirection direction) async {
                            await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text("Remove Item"),
                                  content: const Text(
                                      "Are you sure you want to remove this ?"),
                                  actions: <Widget>[
                                    ElevatedButton(
                                        // style: ButtonStyle(backgroundColor:  ),
                                        onPressed: () {
                                          setState(() {
                                            Navigator.of(context).pop(true);
                                            productController
                                                .removeItem(product);
                                          });
                                        },
                                        child: const Text("Yes")),
                                    ElevatedButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(false),
                                      child: const Text("No"),
                                    ),
                                  ],
                                );
                              },
                            );
                            return null;
                          },
                          onDismissed: (direction) => setState(() {
                            productController.products.removeAt(index);
                            // productController.deleteProducts(product);
                          }),
                          child: Container(
                            height: 220,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            Text(
                                                'Review (${product.rating!.rate!}'),
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
                                            "\$ ${product.price! * product.quantity}",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                if (product.quantity <= 1) {
                                                  productController
                                                      .removeItem(product);
                                                } else {
                                                  productController
                                                      .deleteProducts(product);
                                                }
                                              },
                                              icon: Container(
                                                  decoration: BoxDecoration(
                                                      color:
                                                          AppColors.brandColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: const Icon(
                                                    Icons.remove,
                                                    color: AppColors
                                                        .lightCardColor,
                                                    size: 20,
                                                  ))),
                                          Container(
                                              width: 30,
                                              color: AppColors.brandColor
                                                  .withOpacity(0.3),
                                              child: Center(
                                                child:
                                                    Text("${product.quantity}"),
                                              )),
                                          IconButton(
                                              onPressed: () async {
                                                productController
                                                    .updateProducts(product);
                                                product.quantity++;
                                              },
                                              icon: Container(
                                                decoration: BoxDecoration(
                                                    color: AppColors.brandColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: const Icon(
                                                  Icons.add,
                                                  color:
                                                      AppColors.lightCardColor,
                                                  size: 20,
                                                ),
                                              ))
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
                          ),
                        );
                      }),
            ),
          ),
          Container(
            height: 120,
            color: AppColors.lightCardColor,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total price : ",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Obx(
                        () => Container(
                          margin: const EdgeInsets.only(left: 20),
                          width: 55,
                          child: Text(
                              "\$ ${productController.total.value.round()}",
                              // overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold)),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 380,
                  decoration: const BoxDecoration(
                      color: AppColors.brandColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: TextButton(
                      onPressed: () async {
                        if (productController.products.isEmpty) {
                          null;
                        } else {
                          Get.to(const CheckOut());
                        }
                      },
                      child: const Text(
                        "Checkout",
                        style: TextStyle(
                            color: AppColors.whiteColor, fontSize: 18),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
