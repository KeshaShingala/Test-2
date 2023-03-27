import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test2/modal/modal_page.dart';
import 'package:test2/res/data_res.dart';

class DataDBHelper {
  DataDBHelper._();

  static final DataDBHelper dataDBHelper = DataDBHelper._();

  final String databaseName = "shopping.db";
  final String tableName = "product";
  final String colId = "Id";
  final String colName = "Name";
  final String colquantity = "quantity";
  final String colPrice = "Price";
  final String coldummyPrice = "dummyPrice";
  final String colImage = "Image";

  Database? database;

  Future<void> initDB() async {
    String dbpath = await getDatabasesPath();
    String path = join(dbpath, databaseName);

    database = await openDatabase(path, version: 1,
        onCreate: (Database database, int version) async {
          await database.execute(
              "CREATE TABLE IF NOT EXISTS $tableName($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colName TEXT,$colquantity INTEGER,$coldummyPrice INTEGER, $colPrice INTEGER, $colImage BLOB);");
        });
  }

  Future<void> insertRecord() async {
    await initDB();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isInserted = prefs.getBool(tableName) ?? false;

    if (isInserted == false) {
      for (int i = 0; i < allData.length; i++) {
        Data data = Data.fromData(data: allData[i]);

        String query =
            "INSERT INTO $tableName($colName,$colquantity,$colPrice,$coldummyPrice ,$colImage) VALUES(?, ?, ?,?,?);";
        List args = [
          data.name,
          data.quantity,
          data.price,
          data.dummyPrice,
          data.image,
        ];
        await database!.rawInsert(query, args);
      }
      prefs.setBool(tableName, true);
    }
  }

  Future<List<DataDB>> getAllRecode() async {
    await insertRecord();

    String query = "SELECT * FROM $tableName";

    List<Map<String, dynamic>> data = await database!.rawQuery(query);

    List<DataDB> productDB =
    data.map((e) => DataDB.fromData(data: e)).toList();
    return productDB;
  }
}


