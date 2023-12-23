import 'package:cartify/controller/products_controller.dart';
import 'package:cartify/screens/allproducts.dart';
import 'package:cartify/utils/theme/app_colors.dart';
import 'package:cartify/widget/brands.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ProductController productController = Get.put(ProductController());

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 3000)).then((value) {
      setState(() {
        isLoading = true;
      });
    });
  }

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Brands",
              style: TextStyle(fontSize: 25),
            ),
          ),
          isLoading
              ? const Brands()
              : Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.white,
                  child: const Brands()),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Popular Shoes",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                color: AppColors.lightCardColor,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            margin: const EdgeInsets.only(left: 30),
            height: 250,
            width: 350,
            child: Stack(
              children: [
                Container(
                  height: 170,
                  width: 300,
                  margin: const EdgeInsets.only(left: 30, top: 10, right: 30),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/beautiful-nike.jpg"),
                        fit: BoxFit.cover,
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10, left: 40),
                      child: const Text(
                        "Nike Air Jordan",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 128),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite_outline,
                            color: Colors.redAccent,
                            size: 20,
                          )),
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 190, left: 20),
                  child: Row(
                    children: [
                      const Row(
                        children: [
                          Text("Review"),
                          Text("(4.9"),
                          Icon(
                            Icons.star,
                            size: 17,
                            color: Colors.orange,
                          ),
                          Text(")")
                        ],
                      ),
                      Container(
                          height: 30,
                          width: 30,
                          margin: const EdgeInsets.only(left: 170),
                          decoration: BoxDecoration(
                              color: AppColors.brandColor,
                              borderRadius: BorderRadius.circular(30)),
                          child: const Icon(
                            Icons.add,
                            size: 20,
                            color: AppColors.lightCardColor,
                          ))
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 215, left: 20),
                  child: const Text("\$ 98.9"),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  "New Arrivals",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "view all",
                    style: TextStyle(color: AppColors.blackColor),
                  ))
            ],
          ),
          isLoading
              ? const AllProducts()
              : Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.white,
                  child: const AllProducts())
        ],
      ),
    );
  }
}
