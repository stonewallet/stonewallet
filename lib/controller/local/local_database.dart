import 'package:sqflite/sqflite.dart';
import 'package:stone_wallet_main/UI/Model/portfolio/portfolio_model.dart';

class LocalDatabase {
  //Create or Open new Databae

  static Future<Database> createDatabase() async {
    return await openDatabase(
      "stone_wallet.db",
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            'CREATE TABLE portfolio (coin_name TEXT,quantity Double,sub_cat INT,value DOUBLE,image_url TEXT,coin_short TEXT)');

        await db.execute(
            'CREATE TABLE saved_time (page_no INTEGER PRIMARY KEY, lastSavedTime DATETIME)');
      },
    );
  }

  //Inset new data to the DataBase

  static Future insertPortfolioData(Portfolio portfolio) async {
    var db = await createDatabase();

    return await db.insert(
      "portfolio",
      {
        "coin_name": portfolio.coinName,
        "quantity": portfolio.quantity,
        "sub_cat": portfolio.subCat,
        "value": portfolio.value,
        "image_url": portfolio.imageUrl,
        "coin_short": portfolio.coinShort,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //read all the data from the local data base
  static Future<List<Map<String, dynamic>>> getData() async {
    var db = await createDatabase();

    return await db.query("portfolio");
  }

  //get more dat but in limit of 20
  //  static Future<List<Map<String,dynamic>>> getMoreData(int lastNo) async {
  //    var db = await createDatabase();

  //   return  await db.query("portfolio",limit: 20,offset:  lastNo);
  // }

  //count the number of news inside databse
  static Future<int?> getPortfolioCount() async {
    var db = await createDatabase();

    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM portfolio'));
  }

  //delete all news from local database
  static Future createDeletedatabase() async {
    var db = await createDatabase();
    return await db.delete("portfolio");
  }

  //insert time after saving to the database

  static Future insertSavedTime(int pageno) async {
    var db = await createDatabase();

    return await db.insert(
      "saved_time",
      {
        "page_no": pageno,
        "lastSavedTime": DateTime.now().toString(),
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //get the saved time of each page

  static Future<List<Map<String, dynamic>>> getSaveTime() async {
    var db = await createDatabase();
    var data = await db.query("saved_time");
    print(data);
    return data;
  }

  // delete the saved time table

  static Future deleteSavedTime() async {
    var db = await createDatabase();
    return await db.delete("saved_time");
  }
}
