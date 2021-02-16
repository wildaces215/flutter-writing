import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class InitDb {
  InitDb._privateconstructor();
  static final InitDb instance = InitDb._privateconstructor();

  static const _version = 1;

  static const TABLE_NAME = 'entries';
  static const ID = 'id';
  static const NOTE = 'note';

  Future<String> getDbPath() async {
    return join(await getDatabasesPath(), 'db.db');
  }

  Future<Database> init() async {
    return await openDatabase(await getDbPath(), version: _version,
        onCreate: (db, version) {
      return db.execute(
          "CREATE TABLE $TABLE_NAME($ID INTEGER PRIMARY KEY AUTOINCREMENT,$NOTE TEXT)");
    });
  }
}
