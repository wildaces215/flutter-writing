import 'package:get/get.dart';
//import 'package:writing/db/db_init.dart';
import 'package:writing/db/db_helpers.dart';
import 'package:writing/models/note.dart';
import 'package:flutter/material.dart';

class DbController extends GetxController {
  var notesData = List<Note>().obs;
  TextEditingController addTaskController;
  TextEditingController updateTaskContoller;

  @override
  void onInit() {
    super.onInit();
    _getData();
    addTaskController = TextEditingController();
  }

  void _getData() {
    HelperDb.instance.getAllEntries().then((value) {
      value.forEach((element) {
        notesData.add(Note(id: element['id'], note: element['note']));
      });
    });
  }

  void addData() async {
    await HelperDb.instance.setNewEntry(Note(note: addTaskController.text));
    notesData.insert(
        0, Note(id: notesData.length, note: addTaskController.text));
    addTaskController.clear();
  }

  void deleteData(int _id) async {
    HelperDb.instance.setDeleteEntry(_id);
    notesData.removeWhere((element) => element.id == _id);
  }
}
