import 'dart:io';
import 'package:cartify/model/products.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper extends GetxController {
  static final DataBaseHelper _instance = DataBaseHelper.internal();
  DataBaseHelper.internal();
  factory DataBaseHelper() => _instance;

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await initDb();
    return _db!;
  }

  Future<Database> initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "newproducts.db");
    var ourDb = await openDatabase(path,
        version: 10, onCreate: _onCreate, onUpgrade: _onUpgrade);
    return ourDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE product(id INTEGER PRIMARY KEY, title TEXT, price REAL, description TEXT, category TEXT, image TEXT, count REAL, rate REAL, rating REAL)');
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // await db.execute('ALTER TABLE product RENAME  TO newproducts');
    // await db.execute('DROP TABLE products');
    await db.execute(
        'CREATE TABLE newproduct(id INTEGER PRIMARY KEY, title TEXT, price REAL, description TEXT, category TEXT, image TEXT, count REAL, rate REAL, rating REAL, quantity INTEGER)');
  }

  Future<int> saveProduct(Products products) async {
    var dbClient = await db;
    int res = await dbClient.insert('newproducts', products.toJson());
    print("=====================");
    print("saved product: $res");
    return res;
  }

  Future<List<Products>> getCart() async {
    var dbClient = await db;
    List<Map<String, dynamic>> list =
        await dbClient.rawQuery('SELECT * FROM newproducts');
    List<Products> products = [];
    for (var item in list) {
      products.add(Products.fromJson(item));
    }
    print("=====================");
    print(list);
    return products;
  }

  Future<List<Products>> getProductsByKeyword(String text) async {
    var dbClient = await db;
    List<Map<String, dynamic>> list = await dbClient
        .rawQuery('SELECT * FROM newproducts WHERE title = $text');

    List<Products> products = [];
    for (var item in list) {
      products.add(Products.fromJson(item));
    }
    return products;
  }

  Future<int> updateProduct(Products products) async {
    var dbClient = await db;
    return await dbClient.update('newproducts', products.toMap(),
        where: "id = ?", whereArgs: [products.id]);
  }

  Future<int> deleteProduct(int id) async {
    var dbClient = await db;
    return await dbClient
        .delete('newproducts', where: "id = ?", whereArgs: [id]);
  }
}
