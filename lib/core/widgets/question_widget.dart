// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../Note/view/note_view.dart';
import '../../Note/viewmodel/note_view_model.dart';

class QuestionWidget extends StatelessWidget {
  final NoteViewModel viewModel;
  const QuestionWidget({
    Key? key,
    required this.viewModel,
    required this.h,
    required this.w,
  }) : super(key: key);

  final double h;
  final double w;

  @override
  Widget build(BuildContext context) {
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
              viewModel: viewModel,
            )
          ],
        ));
  }
}
