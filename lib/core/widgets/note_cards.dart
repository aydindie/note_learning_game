// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../features/Note/model/note_model.dart';


class NoteCard extends StatelessWidget {
  final NoteModel noteModel;
  const NoteCard({
    Key? key,
    required this.noteModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          noteModel.generalName.toString(),
          style: TextStyle(
              backgroundColor: noteModel.noteId != null
                  ? Colors.red[noteModel.noteId! % 10 * 100]
                  : Colors.black),
        ),
        leading: Text(noteModel.notePic.toString()),
        subtitle: Text(noteModel.noteSound.toString()),
      ),
    );
  }
}
