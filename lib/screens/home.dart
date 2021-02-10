import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:writing/screens/new_entry.dart';
import 'package:writing/state/state.dart';

class HomeScreen extends StatelessWidget {
  final DbController _controller = Get.put(DbController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Writing App'),
      ),
      body: Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Expanded(
                  child: Obx(() => ListView.builder(
                      itemCount: _controller.notesData.length,
                      itemBuilder: (context, index) => ListTile(
                          leading: Text(_controller.notesData[index].note),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              _controller
                                  .deleteData(_controller.notesData[index].id);
                            },
                          ))))),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => NewEntryScreen()));
        },
      ),
    );
  }
}
