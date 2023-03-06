// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:note_learning_game/stores/all_store.dart';
import 'package:note_learning_game/stores/sound_store.dart';
import 'package:provider/provider.dart';

import '../constants/isDebug.dart';
import '../models/note_model.dart';
import '../piano/piano.dart';

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
    final height = MediaQuery.of(context).size.height;
    final soundStore = Provider.of<SoundStore>(context);
    final player = AudioCache();
    final allStore = Provider.of<AllStore>(context);
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
      child: Observer(builder: (_) {
        return Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isDebug
                  ? Column(
                      children: [
                        Text(
                          "${allStore.isBassOn ? "bass" : ""} ${allStore.isTrebleOn ? "Treble" : ""}",
                          style: const TextStyle(color: Colors.red),
                        ),
                        Text(widget.noteModel.notePic.toString()),
                        Text(widget.noteModel.noteId!.toString()),
                        Text(getClef(widget.noteModel.noteId!).toString()),
                        Text(
                            getNotePosition(widget.noteModel.noteId!)
                                .name
                                .toString(),
                            style: const TextStyle(fontSize: 10)),
                      ],
                    )
                  : Container(),
              Container(
                child: ClefImage(
                    size: Size(height / 6, height / 6),
                    clef: getClef(widget.noteModel.noteId!),
                    noteRange:
                        NoteRange.forClefs([getClef(widget.noteModel.noteId!)]),
                    noteImages: [
                      NoteImage(
                          notePosition:
                              getNotePosition(widget.noteModel.noteId!)),
                    ],
                    clefColor: Colors.black,
                    noteRangeToClip: NoteRange.forClefs(
                        [getClef(widget.noteModel.noteId!)]), //onemsiz gibi
                    noteColor: Colors.black),
              ),
              //;}) SizedBox(
              //   height: height / 6,
              //   width: height / 6,
              //   child: CustomPaint(
              //       painter: ClefPainter(
              //           padding: EdgeInsets.zero,
              //           noteImages: [
              //             NoteImage(notePosition: NotePosition.middleA),
              //           ],
              //           lineHeight: height ~/ 300,
              //           clefColor: Colors.green,
              //           clef: Clef.Treble,
              //           noteRange: NoteRange.forClefs(
              //             [Clef.Treble],
              //           ))),
              // ),
              // const SizedBox(
              //   height: 75,
              //   width: 75,
              //   child: Padding(
              //     padding: EdgeInsets.all(1.0),
              //     child: Image(image: AssetImage("assets/images/alto.png")),
              //   ),
              // ),
              // Text(
              //   widget.noteModel.generalName.toString(),
              // ),
            ],
          ),
        );
      }),
    );
  }
}

Clef getClef(int index) {
  print("index: $index");
  if (index >= 0) {
    if (index <= 14) {
      return Clef.Bass;
    } else {
      return Clef.Treble;
    }
  }
  return Clef.Treble;
}

NotePosition getNotePosition(int index) {
  if (index >= 0) {
    return NotePosition(note: getNote(index), octave: ((index - 1) ~/ 7.0) + 2);
  }
  return NotePosition.middleC;
}

Note getNote(int index) {
  if (index % 7 == 1) {
    return Note.C;
  } else if (index % 7 == 2) {
    return Note.D;
  } else if (index % 7 == 3) {
    return Note.E;
  } else if (index % 7 == 4) {
    return Note.F;
  } else if (index % 7 == 5) {
    return Note.G;
  } else if (index % 7 == 6) {
    return Note.A;
  } else if (index % 7 == 0) {
    return Note.B;
  } else {
    return Note.C;
  }
}
