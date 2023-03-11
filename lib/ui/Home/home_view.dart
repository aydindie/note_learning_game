// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../constants/enums.dart';
import '../../stores/all_store.dart';
import '../../utils/colors.dart';
import '../../widgets/anwers_widget.dart';
import '../../widgets/countdown_timer.dart';
import '../../widgets/question_widget.dart';
import '../../widgets/top_iconbuttons.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // controller
  @override
  Widget build(BuildContext context) {
    final noteViewModel = Provider.of<AllStore>(context);

    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: Center(
            child: Column(
              children: [
                const TopIconButtons(),
                const SizedBox(
                  height: 2,
                ),
                Observer(builder: (_) {
                  return Container(
                    child: noteViewModel.durationPreferences ==
                            DurationPreferences.NONE
                        ? const SizedBox(
                            height: 0,
                          )
                        : noteViewModel.durationPreferences ==
                                DurationPreferences.TWENTY
                            ? Observer(
                                builder: (_) {
                                  return scoreBar(
                                      h,
                                      w,
                                      bestScoreBackgroundColor,
                                      "${"best_score".tr()}: ${noteViewModel.best20sScore}");
                                },
                              )
                            : noteViewModel.durationPreferences ==
                                    DurationPreferences.MINUTE
                                ? Observer(
                                    builder: (_) {
                                      return scoreBar(
                                          h,
                                          w,
                                          bestScoreBackgroundColor,
                                          "${"best_score".tr()}: ${noteViewModel.best1mScore}");
                                    },
                                  )
                                : noteViewModel.durationPreferences ==
                                        DurationPreferences.FIVE_MIN
                                    ? Observer(
                                        builder: (_) {
                                          return scoreBar(
                                              h,
                                              w,
                                              bestScoreBackgroundColor,
                                              "${"best_score".tr()}: ${noteViewModel.best5mScore}");
                                        },
                                      )
                                    : null,
                  );
                }),

                Observer(builder: (_) {
                  return const CountdownTimer();
                }),
                Observer(
                  builder: (_) {
                    return scoreBar(
                        h,
                        w,
                        currentScoreBackgroundColor,
                        noteViewModel.durationPreferences ==
                                DurationPreferences.NONE
                            ? "${"score".tr()}: ${noteViewModel.score}"
                            : noteViewModel.durationPreferences ==
                                    DurationPreferences.TWENTY
                                ? "${"score".tr()}: ${noteViewModel.score20s}"
                                : noteViewModel.durationPreferences ==
                                        DurationPreferences.MINUTE
                                    ? "${"score".tr()}: ${noteViewModel.score1m}"
                                    : noteViewModel.durationPreferences ==
                                            DurationPreferences.FIVE_MIN
                                        ? "${"score".tr()}: ${noteViewModel.score5m}"
                                        : "score".tr());
                  },
                ),

                const SizedBox(
                  height: 5,
                ),
                QuestionWidget(
                  viewModel: noteViewModel,
                ),
                SizedBox(
                  height: h * 0.03,
                ),
                //numpad gridview

                const AnswersWidget(),

                // Observer(builder: (_) {
                //   return Center(
                //     child: Switch(
                //       value: themeStore.isDarkMode,
                //       onChanged: (value) {
                //         themeStore.toggleTheme();
                //       },
                //     ),
                //   );
                // }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  FittedBox scoreBar(double h, double w, Color color, String text) {
    return FittedBox(
      child: Container(
        alignment: Alignment.center,
        height: h * 0.04,
        width: w * 0.3,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}




//  Ink.image(
//   fit: BoxFit.cover,
//   image: const NetworkImage(
//       'https://www.kindacode.com/wp-content/uploads/2022/07/bottle.jpeg'),
// ),