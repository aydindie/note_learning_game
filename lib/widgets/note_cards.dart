// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:note_learning_game/stores/sound_store.dart';
import 'package:provider/provider.dart';

import '../models/note_model.dart';

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
    final soundStore = Provider.of<SoundStore>(context);
    final player = AudioCache();
    // ignore: avoid_print
    print("piano-mp3/${widget.noteModel.generalName.toString()}.mp3");
    soundStore.soundBool
        ? player
            .play("piano-mp3/${widget.noteModel.generalName.toString()}.mp3")
        : null;
    return InkWell(
      enableFeedback: false, //basarken buton sesi gelmemesi için
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
                  child: Image(image: AssetImage("assets/images/alto.png")),
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
