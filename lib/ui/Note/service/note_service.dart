import 'dart:convert';
import 'package:flutter/services.dart';

import '../../../models/note/note_model.dart';
import 'INoteService.dart';

class NoteService extends INoteService {

  final String path = "assets/data/example_data.json";

  @override
  Future<List<NoteModel>> getAllNotes() async {
    final response = await rootBundle.loadString(path);
    final List<dynamic> data = json.decode(response.toString());
    final List<NoteModel> notes = data
        .map((dynamic item) => NoteModel.fromJson(item as Map<String, dynamic>))
        .toList();
    return notes;
  }
}
