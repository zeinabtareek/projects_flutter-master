

import 'package:sqflite/sqflite.dart';
 import 'package:path/path.dart';
import 'package:sqflite/sql.dart';

import '../app_string.dart';
import '../models/cart_model.dart';
class CartDatabaseHelper {

  CartDatabaseHelper._();
  static final CartDatabaseHelper db =CartDatabaseHelper._();
  static Database ?_database;


  Future<Database?> get database async {
    if(_database !=null) return _database;
    _database = await initDb();
    return _database;
  }
  initDb ()async{
    String path =join(await getDatabasesPath(),'CartProduct.db');

    return await openDatabase(path,version: 1,
        onCreate: (Database db ,int version)async{
      await db.execute('''
         CREATE TABLE $tableCartProduct(

      $columnPrice INTEGER NOT NULL,
      $columnQuantity INTEGER NOT NULL,
      $columnName TEXT NOT NULL,
      $columnProductId TEXT NOT NULL

       )''');

    });
  }
  insert(CartProductModel model)async{
  var dbClient =await database;
  await dbClient!.insert(tableCartProduct,
      model.toJson(),conflictAlgorithm: ConflictAlgorithm.replace );

  }
  Future<List<CartProductModel>>getAllProduct()async{
    var dbClient =await database;
    List<Map> maps =await dbClient!.query(tableCartProduct);
    List<CartProductModel> list =maps.isNotEmpty?
        maps.map((product) => CartProductModel.fromJson(product)).toList()
        :[];
    return list;
  }
  updateProduct(CartProductModel model)async{

    var dbClient =await database;
    return await dbClient!.update(tableCartProduct, model.toJson(),
    where: '$columnProductId =?',whereArgs: [model.productId]
    );
   }
  deleteProduct(String name) async {
    var dbClient =await database;
    await dbClient!.delete(tableCartProduct,

        where: "$columnName = ?", whereArgs: [name]);
  }
  deleteAllProduct() async {
    var dbClient = await database;
    await dbClient!.delete(tableCartProduct);
  }
}
