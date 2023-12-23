import 'package:cartify/controller/products_controller.dart';
import 'package:cartify/screens/allproducts.dart';
import 'package:cartify/screens/profile.dart';
import 'package:cartify/utils/theme/app_colors.dart';
import 'package:cartify/widget/brands.dart';
import 'package:cartify/widget/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 3000)).then((value) {
      setState(() {
        isLoading = true;
      });
    });
  }

  int current = 0;
  final List<Widget> screens = [
    const AllProducts(),
    const Profile(),
  ];

  final ProductController productController = Get.put(ProductController());

  bool isLoading = false;
  Widget currentpage = const AllProducts();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            width: 350,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40))),
            margin: const EdgeInsets.only(left: 21),
            child: GestureDetector(
                onTap: () {
                  Get.to(const Search());
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.lightCardColor,
                  ),
                  height: 50,
                  width: 200,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 25),
                            child: const Icon(
                              Icons.search,
                              size: 25,
                              color: AppColors.blackColor,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 50),
                            child: Text(
                              'search here',
                              style: TextStyle(
                                  color: Colors.grey[600], fontSize: 20),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 80),
                            child: const Icon(
                              Icons.mic_outlined,
                              size: 25,
                              color: AppColors.blackColor,
                            ),
                          )
                        ]),
                  ),
                ))),
        const SizedBox(
          height: 20,
        ),
        isLoading
            ? const Brands()
            : Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.white,
                child: const Brands()),
        Container(
          margin: const EdgeInsets.only(left: 20, top: 10),
          child: const Text(
            "Gender",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10, left: 20),
          child: Row(
            children: [
              Container(
                  margin: const EdgeInsets.only(right: 10),
                  width: 80,
                  height: 40,
                  decoration: BoxDecoration(
                      color: current == 0
                          ? AppColors.brandColor
                          : AppColors.lightCardColor,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          current = 0;
                        });
                      },
                      child: Text(
                        "All",
                        style: TextStyle(
                          color: current == 0
                              ? AppColors.lightCardColor
                              : AppColors.darkCardColor,
                        ),
                      ))),
              Container(
                  margin: const EdgeInsets.only(right: 10),
                  width: 80,
                  height: 40,
                  decoration: BoxDecoration(
                      color: current == 1
                          ? AppColors.brandColor
                          : AppColors.lightCardColor,
                      borderRadius: const BorderRadius.all(Radius.circular(20))),
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          current = 1;
                        });
                      },
                      child: Text(
                        "Men",
                        style: TextStyle(
                          color: current == 1
                              ? AppColors.lightCardColor
                              : AppColors.darkCardColor,
                        ),
                      ))),
              Container(
                  width: 80,
                  height: 40,
                  decoration: const BoxDecoration(
                      color: AppColors.lightCardColor,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Women",
                        style: TextStyle(color: AppColors.blackColor),
                      )))
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        current == 0
            ? isLoading
                ? const AllProducts()
                : Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.white,
                    child: const AllProducts())
            : const SizedBox()
      ],
    );
  }
}
