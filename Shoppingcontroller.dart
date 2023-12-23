import 'package:cartify/model/products.dart';
import 'package:cartify/services/ShoppingCart.dart';
import 'package:get/get.dart';

class ShoppingCartController extends GetxController {
  final ShoppingCartService cartService = ShoppingCartService();
  var products = <Products>[].obs;
  var total = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    List<Products> productsList = await cartService.getCartItems();
    products.value = productsList;
    calculateTotal(productsList);
  }

  void updateProducts(Products products) async {
    List<Products> productsList = await cartService.getCartItems();
    bool productExists =
        productsList.where((e) => e.id == products.id).toList().isNotEmpty;

    if (productExists) {
      int index = productsList
          .indexOf(productsList.singleWhere((e) => e.id == products.id));

      productsList[index].quantity++;
      await cartService.updateCart(productsList);
    } else {
      await cartService.addItemToCart(products);
      await cartService.getCartItems();
      await fetchProducts();
    }
    await fetchProducts();
  }

  void deleteProducts(Products product) async {
    List<Products> productsList = await cartService.getCartItems();
    int index = productsList
        .indexOf(productsList.singleWhere((e) => e.id == product.id));

    productsList[index].quantity--;

    await cartService.deleteCart(productsList);
    await cartService.getCartItems();
    await fetchProducts();
  }

  void removeItem(Products product) async {
    await cartService.removeItemFromCart(product);
    await cartService.getCartItems();
    await fetchProducts();
  }

  void calculateTotal(List<Products> data) {
    var newTotal = 0.0;
    for (var price in data) {
      newTotal += price.price! * price.quantity;
    }
    total.value = newTotal;
  }
}
