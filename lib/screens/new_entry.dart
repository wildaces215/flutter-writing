import 'package:flutter/material.dart';
import 'package:writing/state/state.dart';
import 'package:get/get.dart';

class NewEntryScreen extends StatelessWidget {
  final DbController _controller = Get.put(DbController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          child: TextField(
            controller: _controller.addTaskController,
          ),
        )),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save),
          onPressed: () {
            _controller.addData();
            Navigator.pop(context);
          },
        ));
  }
}
