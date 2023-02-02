import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:note_learning_game/Note/model/note_model.dart';
import 'package:note_learning_game/Note/service/INoteService.dart';

class NoteService extends INoteService {
  // Future<void> readJson() async {
  //   final String response =
  //       await rootBundle.loadString('assets/example_data.json');
  //   final data = await json.decode(response);
  //   // ...
  // }
  final String path = "assets/data/example_data.json";

  @override
  Future<List<NoteModel>> getAllNotes() async {
    final response = await rootBundle.loadString(path);
    print(response);
    final List<dynamic> data = json.decode(response.toString());
    final List<NoteModel> notes = data
        .map((dynamic item) => NoteModel.fromJson(item as Map<String, dynamic>))
        .toList();
    print(notes);
    return notes;
  }
  

}
