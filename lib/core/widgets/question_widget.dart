// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'note_view.dart';
import '../../features/Note/viewmodel/note_view_model.dart';


class QuestionWidget extends StatelessWidget {
  final NoteViewModel viewModel;
  const QuestionWidget({
    Key? key,
    required this.viewModel,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Container(
        height: h * 0.18,
        width: w * 0.8,
        decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NoteView(
            )
          ],
        ));
  }
}
