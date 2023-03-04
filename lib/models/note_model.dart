class NoteModel {
  String? generalName;
  int? noteNameId;
  String? notePic;
  int? noteId;
  String? noteSound;

  NoteModel(
      {this.generalName,
      this.noteNameId,
      this.notePic,
      this.noteId,
      this.noteSound});

  NoteModel.fromJson(Map<String, dynamic> json) {
    generalName = json['generalName'];
    noteNameId = json['noteNameId'];
    notePic = json['notePic'];
    noteId = json['noteId'];
    noteSound = json['noteSound'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['generalName'] = generalName;
    data['noteNameId'] = noteNameId;
    data['notePic'] = notePic;
    data['noteId'] = noteId;
    data['noteSound'] = noteSound;
    return data;
  }

  factory NoteModel.fake() {
    return NoteModel(
      generalName: "C",
      noteNameId: 1,
      notePic: "assets/images/notes/c.png",
      noteId: 1,
      noteSound: "assets/sounds/c.mp3",
    );
  }
}
