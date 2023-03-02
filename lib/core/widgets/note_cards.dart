// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:note_learning_game/features/Note/viewmodel/note_view_model.dart';
import 'package:note_learning_game/features/Settings/viewmodel/settings_store.dart';
import 'package:provider/provider.dart';

import '../../features/Note/model/note_model.dart';

class NoteCard extends StatefulWidget {
  final NoteModel noteModel;
  const NoteCard({
    Key? key,
    required this.noteModel,
  }) : super(key: key);

  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  @override
  Widget build(BuildContext context) {
    final  viewmodel = Provider.of<NoteViewModel>(context);
    final player = AudioCache();
    print("piano-mp3/${widget.noteModel.generalName.toString()}.mp3");
    viewmodel.isSoundOn ? player.play("piano-mp3/${widget.noteModel.generalName.toString()}.mp3") : null;
    return InkWell(
      onTap: () {
        setState(() {});
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(widget.noteModel.notePic.toString()),
              const SizedBox(
                height: 75,
                width: 75,
                child: Padding(
                  padding: EdgeInsets.all(1.0),
                  child: Image(image: NetworkImage("https://picsum.photos/75")),
                ),
              ),
              Text(
                widget.noteModel.generalName.toString(),
              )
            ],
          ),
        ],
      ),
    );
  }
}
