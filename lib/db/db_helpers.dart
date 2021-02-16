//import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:writing/db/db_init.dart';
import 'package:writing/models/note.dart';

class HelperDb {
  HelperDb._privateConstructor();
  static final HelperDb instance = HelperDb._privateConstructor();

  Future<List<Map<String, dynamic>>> getAllEntries() async {
    Database _db = await InitDb.instance.init();
    var res = await _db.query(InitDb.TABLE_NAME, orderBy: "${InitDb.ID} DESC");
    return res;
  }

  Future<int> setNewEntry(Note _note) async {
    final _db = await InitDb.instance.init();
    var res = await _db.insert(InitDb.TABLE_NAME, _note.toMap());
    return res;
  }

  Future<int> setDeleteEntry(int _id) async {
    final _db = await InitDb.instance.init();
    return await _db
        .delete(InitDb.TABLE_NAME, where: '${InitDb.ID} = ?', whereArgs: [_id]);
  }

  Future<Note> updateEntry(Note _note) async {
    final _db = await InitDb.instance.init();
    await _db.update(InitDb.TABLE_NAME, _note.toMap(),
        where: InitDb.ID + " = ?", whereArgs: [_note.id]);
  }

  Future<void> setClearTable() async {
    final _db = await InitDb.instance.init();
    return await _db.query("DELETE FROM $InitDb.TABLE_NAME");
  }
}
