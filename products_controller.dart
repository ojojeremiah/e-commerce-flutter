import 'package:cartify/model/products.dart';
import 'package:cartify/services/dio_Client.dart';
import 'package:cartify/services/products_service.dart';
import 'package:cartify/services/storageservice.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final StorageService _productStorage = StorageService();
  final ProductService _productService =
      ProductService(dioClient: DioClient(Dio()));
  var products = <Products>[].obs;
  var carts = <Products>[].obs;
  var pressed = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchProducts();
    fetchProduct();
  }

  // void fetchProductsByKeyword(String text) async {
  //   List<Products> productsList =
  //       await DataBaseHelper().getProductsByKeyword(text);

  //   products.value = productsList;
  // }

  void fetchProducts() async {
    List<Products> productsList = await _productStorage.getCartItems();
    carts.value = productsList;
    // print(products.value);
  }

  void fetchProduct() async {
    List<Products> productsList = await _productService.fetchProducts();
    products.value = productsList;
    // print(products.value);
  }

  void addProducts(Products products) async {
    await _productStorage.addItemToCart(products);
  }

  void savedquantity(int quantity) async {
    await _productStorage.quantityNumber();
  }

  void updateProducts(Products products) async {
    List<Products> productsList = await _productStorage.getCartItems();
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
      await _productStorage.addItemToCart(products);
      await _productStorage.getCartItems();
      fetchProducts();
      // productsList.add(products);
    }
    fetchProducts();
  }

  void deleteProducts(Products product) async {
    await _productStorage.removeItemFromCart(product);
    await _productStorage.getCartItems();
    fetchProducts();
  }
}
