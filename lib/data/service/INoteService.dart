// ignore_for_file: file_names


import '../../models/note_model.dart';

abstract class INoteService {
  Future<List<NoteModel>> getAllNotes();
  //Future<NoteModel> getNoteByIndex(int id);
  // Future<int> insert(NoteModel note);
  // Future<int> update(NoteModel note);
  // Future<int> delete(int id);
}
