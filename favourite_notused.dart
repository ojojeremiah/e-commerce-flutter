import 'dart:convert';

import 'package:cartify/model/favourite.dart';
import 'package:cartify/model/products.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> addToFavourite(Products products) async {
  final prefs = await SharedPreferences.getInstance();

  final List<String> favouriteList = prefs.getStringList('favourite') ?? [];

  favouriteList.add(jsonEncode(products.toMap()));

  await prefs.setStringList('favourite', favouriteList);
  await getFavouritetItems();
}

Future<void> removeFavourite(FavouriteModel products) async {
  final prefs = await SharedPreferences.getInstance();

  final List<String> favouriteList = prefs.getStringList('favourite') ?? [];

  favouriteList.remove(jsonEncode(products.toJson()));

  await prefs.setStringList('favourite', favouriteList);
  await getFavouritetItems();
}

Future<List<FavouriteModel>> getFavouritetItems() async {
  final prefs = await SharedPreferences.getInstance();

  final productsList = prefs.getStringList('favourite') ?? [];

  return productsList
      .map((value) => FavouriteModel.fromJson((jsonDecode(value))))
      .toList();
}
