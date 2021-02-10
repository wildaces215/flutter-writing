class Note {
  int id;
  String note;
  Note({this.id, this.note});

  Map<String, dynamic> toMap() {
    return {'id': id, 'note': note};
  }
}
