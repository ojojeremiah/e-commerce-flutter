import 'package:cartify/model/products.dart';
import 'package:cartify/services/favourite_service.dart';
import 'package:get/get.dart';

class FavouritesController extends GetxController {
  final FavouritesService _productStorage = FavouritesService();
  var products = <Products>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchFavourites();
  }

  void fetchFavourites() async {
    List<Products> productsList = await _productStorage.getFavouritesItems();
    products.value = productsList;
    // print(products.value);
  }

  void addFavouirites(Products products) async {
    await _productStorage.addItemToFavourites(products);
  }

  void updateFavourites(Products products) async {
    List<Products> productsList = await _productStorage.getFavouritesItems();
    bool productExists =
        productsList.where((e) => e.id == products.id).toList().isNotEmpty;

    if (productExists) {
      var mockProduct = productsList.singleWhere((e) => e.id == products.id);
      if (products.quantity < mockProduct.quantity) {
        products = mockProduct;
        products.quantity++;
      }

      int index = productsList
          .indexOf(productsList.singleWhere((e) => e.id == products.id));

      productsList[index] = products;

      await _productStorage.updateCart(productsList);
    } else {
      await _productStorage.addItemToFavourites(products);
      await _productStorage.getFavouritesItems();
      fetchFavourites();
      // productsList.add(products);
    }
  }

  void deleteFavourites(Products product) async {
    await _productStorage.removeItemFromFavourites(product);
    await _productStorage.getFavouritesItems();
    fetchFavourites();
  }
}
