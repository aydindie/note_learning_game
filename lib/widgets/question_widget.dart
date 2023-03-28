// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../constants/enums.dart';
import '../stores/all_store.dart';
import '../utils/colors.dart';
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
                  height: h * noteHeighttoOne,
                  width: w * 0.8,
                  decoration: const BoxDecoration(
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
                      clipBehavior: Clip.antiAlias,
                      height: h * 0.2,
                      width: w * 0.8,
                      decoration: const BoxDecoration(
                        // color: hidedQuestionBackgroundColor,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              viewModel.countDownController.start();
                              viewModel.counterStarted();
                              viewModel.counterNotFinished();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: playButtonbgColor,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(50)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.play_arrow_outlined,
                                  color: playIconColor,
                                  size: 60,
                                ),
                              ),
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
