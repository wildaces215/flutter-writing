import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:writing/models/note.dart';
import 'package:writing/state/state.dart';

class EditEntryScreen extends StatefulWidget {
  int id;
  String text;

  EditEntryScreen(this.id, this.text);

  @override
  _EditEntryScreenState createState() => _EditEntryScreenState();
}

class _EditEntryScreenState extends State<EditEntryScreen> {
  TextEditingController _noteEditController = TextEditingController();
  final DbController _controller = Get.put(DbController());

  @override
  void initState() {
    super.initState();
    _controller.updateTaskContoller = TextEditingController(text: widget.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Note'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: TextField(
            controller: _controller.updateTaskContoller,
            keyboardType: TextInputType.multiline,
            maxLines: 100,
            autofocus: true,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: () {
          _controller.updateData(Note(id: widget.id, note: widget.text),
              Note(id: widget.id, note: _controller.updateTaskContoller.text));
          Navigator.pop(context);
        },
      ),
    );
  }
}
