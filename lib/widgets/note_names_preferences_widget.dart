// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:note_learning_game/stores/all_store.dart';

import '../constants/enums.dart';
import '../utils/colors.dart';

class NoteNamesWiget extends StatefulWidget {
  final BuildContext context;
  final NoteNamesPreferences noteNamesPreferences;
  final String text;
  const NoteNamesWiget({
    Key? key,
    required this.context,
    required this.noteNamesPreferences,
    required this.text,
  }) : super(key: key);

  @override
  State<NoteNamesWiget> createState() => _NoteNamesWigetState();
}

class _NoteNamesWigetState extends State<NoteNamesWiget> {
  @override
  Widget build(BuildContext context) {
    final allStore = Provider.of<AllStore>(widget.context);
    return Observer(builder: (_) {
      return Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.23,
            height: MediaQuery.of(context).size.width * 0.12,
            decoration: BoxDecoration(
              color:
                  allStore.noteNamesPreferences == widget.noteNamesPreferences
                      ? choosedNoteNamesBackgroundColor
                      : notChoosedNoteNamesBackgroundColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              child: InkWell(
                  enableFeedback: false,
                  onTap: () => allStore
                      .changeNoteNamesPreferences(widget.noteNamesPreferences),
                  child: Center(
                    child: FittedBox(
                      child: Text(widget.text,
                          style: const TextStyle(color: Colors.white)),
                    ),
                  )),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.02,
          ),
          CircleAvatar(
              backgroundColor:
                  allStore.noteNamesPreferences == widget.noteNamesPreferences
                      ? Colors.black
                      : Colors.transparent,
              radius: 7)
        ],
      );
    });
  }
}
