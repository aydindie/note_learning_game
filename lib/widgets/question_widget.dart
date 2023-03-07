// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../constants/enums.dart';
import '../stores/all_store.dart';
import 'note_view.dart';

class QuestionWidget extends StatelessWidget {
  final AllStore viewModel;
  const QuestionWidget({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Observer(builder: (_) {
      return Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: h * 0.18,
                  width: w * 0.8,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [NoteView()],
                  )),
            ],
          ),
          (viewModel.isCounterStarted &&
                      (!viewModel.isCounterFinished) &&
                      viewModel.countDownController.isStarted) ||
                  (viewModel.durationPreferences == DurationPreferences.NONE)
              ? Container()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: h * 0.18,
                      width: w * 0.8,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(193, 0, 0, 0),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            viewModel.countDownController.start();
                            viewModel.counterStarted();
                            viewModel.counterNotFinished();
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.green,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            child: const Icon(
                              Icons.play_arrow,
                              size: 50,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ],
      );
    });
  }
}
