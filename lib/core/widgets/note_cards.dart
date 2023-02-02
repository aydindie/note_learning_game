// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:note_learning_game/Note/model/note_model.dart';

import '../../Note/viewmodel/note_view_model.dart';

class NoteCard extends StatelessWidget {
  final NoteModel noteModel;
   final NoteViewModel viewModel;
  const NoteCard({
    Key? key,
    required this.noteModel,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        // onTap: () {
        //   Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        //     return Scaffold(
        //       appBar: AppBar(),
        //       body: Image.network("https://picsum.photos/400"),
        //     );
        //   }));
        // },
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
