import 'package:cartify/controller/Shoppingcontroller.dart';
import 'package:cartify/controller/favourite_controller.dart';
import 'package:cartify/controller/products_controller.dart';
import 'package:cartify/screens/Description.dart';
import 'package:cartify/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({super.key});

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  final ProductController productController = Get.put(ProductController());
  final ShoppingCartController shoppingCartController =
      Get.put(ShoppingCartController());
  final FavouritesController _favoriteController =
      Get.put(FavouritesController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 2050,
        child: GridView.extent(
          physics: const NeverScrollableScrollPhysics(),
          maxCrossAxisExtent: 230.0,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          padding: const EdgeInsets.all(8.0),
          children: productController.products.map((item) {
            // text = item.title;
            return GestureDetector(
              onTap: () {
                Get.to(Description(products: item));
              },
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: AppColors.lightCardColor,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    margin: const EdgeInsets.only(left: 10),
                    height: 260,
                    width: 180,
                  ),
                  Container(
                    height: 110,
                    width: 160,
                    margin: const EdgeInsets.only(
                      left: 20,
                      top: 10,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(item.image!),
                            fit: BoxFit.cover)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5, left: 20),
                    child: Obx(
                      () => IconButton(
                        onPressed: () {
                          const Icon(
                            Icons.favorite,
                            color: Colors.redAccent,
                          );

                          _favoriteController.updateFavourites(item);
                        },
                        icon: Icon(
                          productController.pressed.value
                              ? Icons.favorite
                              : Icons.favorite_outline,
                          color: Colors.redAccent,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.only(top: 130, left: 20, right: 20),
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      item.title!,
                      style: const TextStyle(
                          fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 150, left: 20),
                    child: Row(
                      children: [
                        Text('Review (${item.rating!.rate!}'),
                        const Icon(
                          Icons.star,
                          size: 17,
                          color: Colors.orange,
                        ),
                        const Text(")"),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 150, left: 150),
                    child: IconButton(
                        onPressed: () {
                          shoppingCartController.updateProducts(item);
                        },
                        icon: Container(
                            decoration: BoxDecoration(
                                color: AppColors.brandColor,
                                borderRadius: BorderRadius.circular(20)),
                            child: const Icon(Icons.add,
                                color: AppColors.lightCardColor, size: 20))),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 170, left: 20),
                    child: Text("\$ ${item.price}"),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
