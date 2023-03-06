import 'package:flutter/material.dart';
import 'package:note_learning_game/piano/piano.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: height / 20,
              ),
              //=============CLEFIMAGE===========
              Container(
                color: Colors.white,
                height: height / 5,
                width: height / 5,
                child: ClefImage(
                    clef: Clef.Bass,
                    size: Size(height / 5, height / 5),
                    noteRange: NoteRange.forClefs([Clef.Bass], extended: true),
                    noteImages: [
                      NoteImage(notePosition: NotePosition.middleC),
                    ],
                    clefColor: Colors.red,
                    noteRangeToClip: NoteRange.forClefs([Clef.Bass]),
                    noteColor: Colors.blue),
              ),
              SizedBox(
                height: height / 5,
                width: height / 7,
                child: CustomPaint(
                    size: Size.fromHeight(
                      height / 5,
                    ),
                    painter: ClefPainter(
                        noteImages: [
                          NoteImage(notePosition: NotePosition.middleA),
                        ],
                        lineHeight: height ~/ 300,
                        clefColor: Colors.green,
                        clef: Clef.Treble,
                        noteRange: NoteRange.forClefs(
                          [Clef.Treble],
                        ))),
              ),

              // Container(
              //   height: 300,
              //   child: InteractivePiano(
              //     highlightedNotes: [NotePosition(note: Note.C, octave: 3)],
              //     naturalColor: Colors.white,
              //     accidentalColor: Colors.black,
              //     keyWidth: 60,
              //     noteRange: NoteRange.forClefs([
              //       Clef.Treble,
              //     ]),
              //     onNotePositionTapped: (position) {
              //       // Use an audio library like flutter_midi to play the sound
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
