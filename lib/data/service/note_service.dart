import 'dart:convert';
import 'package:flutter/services.dart';

import '../../constants/strings.dart';
import '../../models/note_model.dart';
import 'INoteService.dart';

class NoteService extends INoteService {


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
