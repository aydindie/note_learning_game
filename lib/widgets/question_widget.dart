// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:note_learning_game/stores/theme_store.dart';
import 'package:provider/provider.dart';

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
    final themeStore = Provider.of<ThemeStore>(context);
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
                  decoration: BoxDecoration(
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: questionBoxShadow,
                    //     spreadRadius: 5,
                    //     blurRadius: 7,
                    //     offset: const Offset(0, 3),
                    //   ),
                    // ],
                    // gradient: LinearGradient(
                    //   begin: Alignment.topLeft,
                    //   end: Alignment.bottomRight,
                    //   colors: [
                    //     themeStore.isDarkMode
                    //         ? questionBoxBorderColorDarkMode
                    //         : questionBoxBorderColorLightMode,
                    //     themeStore.isDarkMode
                    //         ? questionBoxBorderColor2DarkMode
                    //         : questionBoxBorderColor2LightMode,
                    //   ],
                    // ),
                    // border: Border.all(
                    //   color: themeStore.isDarkMode
                    //       ? questionBorderDarkMode
                    //       : questionBorderLightMode,
                    //   width: 2,
                    // ),
                    color: questionBackgroundColor,
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
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
                      decoration: BoxDecoration(
                        color: hidedQuestionBackgroundColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            viewModel.countDownController.start();
                            viewModel.counterStarted();
                            viewModel.counterNotFinished();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: playButtonColor,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50)),
                            ),
                            child: const Icon(
                              Icons.play_arrow,
                              color: Colors.white,
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
