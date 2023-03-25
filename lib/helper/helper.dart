import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  DBHelper._();

  static final DBHelper dbHelper = DBHelper._();

  final String producTable = "";
  final String id = "id";
  final String name = "name";
  final String price = "price";
  final String dummyPrice = "dummyPrice";
  final String image = "image";

  late Database database;

  Future<void> createDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, "demo.db");

    database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      String query =
          "CREATE TABLE IF NOT EXISTS $producTable ($id INTEGER PRIMARY KEY AUTOINCREMENT,$name TEXT,$price INTEGER,$dummyPrice INTEGER,$image BLOB);";
      await db.execute(query);
    });
  }

  Future<List<Map<String, dynamic>>> fetchAllData() async {
    await createDB();
    String query = "SELECT * FROM $producTable;";
    List<Map<String, dynamic>> allData = await database.rawQuery(query);
    return allData;
  }

  Future<int> deleteData({required int id}) async {
    await createDB();
    String query = "DELETE FROM $producTable WHERE $id = ?;";
    List argy = [id];
    int item = await database.rawDelete(query, argy);
    return item;
  }
}
