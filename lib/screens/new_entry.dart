import 'package:flutter/material.dart';
import 'package:writing/state/state.dart';
import 'package:get/get.dart';

class NewEntryScreen extends StatelessWidget {
  final DbController _controller = Get.put(DbController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Note'),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_left),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
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
      ),
    );
  }
}
