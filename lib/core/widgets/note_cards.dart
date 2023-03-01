// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:audioplayers/audioplayers.dart';
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
    final player = AudioCache();
    print("piano-mp3/${noteModel.generalName.toString()}.mp3");
    player.play("piano-mp3/${noteModel.generalName.toString()}.mp3");
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(noteModel.notePic.toString()),
        const SizedBox(
          height: 75,
          width: 75,
          child: Image(image: NetworkImage("https://picsum.photos/75")),
        ),
        Text(
          noteModel.generalName.toString(),
        )
      ],
    );
  }
}
