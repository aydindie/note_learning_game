import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../constants/enums.dart';
import '../constants/isDebug.dart';
import '../stores/all_store.dart';
import '../stores/theme_store.dart';
import '../utils/colors.dart';

class CountdownTimer extends StatefulWidget {
  const CountdownTimer({
    Key? key,
  }) : super(key: key);

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AllStore>(context);
    final themeModel = Provider.of<ThemeStore>(context);

    return Observer(builder: (_) {
      //TODO: burada controllerin dispose olmaması için 0 pixellik bir container oluşturuldu. Bu çözüm geçici bir çözüm. Daha iyi bir çözüm bulunmalı.
      return viewModel.durationPreferences == DurationPreferences.NONE
          // ignore: avoid_unnecessary_containers
          ? Container(
              child: CircularCountDownTimer(
                width: 0,
                height: 0,
                duration: viewModel.defaultDuration,
                ringColor: timerRingColor,
                fillColor: timerFillColor,
                initialDuration: 0,
                controller: viewModel.countDownController,
                backgroundColor: timerBackgroundColor,
                strokeWidth: 5.0,
                strokeCap: StrokeCap.round,
                textStyle: TextStyle(
                    fontSize: 33.0,
                    color: themeModel.isDarkMode
                        ? timerDarkModeTextColor
                        : timerLightModeTextColor,
                    fontWeight: FontWeight.bold),
                isReverse: true,
                autoStart: false,
                onStart: () {
                  debugPrint('Countdown Started');
                },
                onComplete: () {
                  debugPrint('Countdown Ended');
                },
                onChange: (String timeStamp) {
                  debugPrint('Countdown Changed $timeStamp');
                },
                timeFormatterFunction: (defaultFormatterFunction, duration) {
                  if (duration.inMilliseconds ==
                          viewModel.defaultDuration * 1000 ||
                      duration.inMilliseconds == 0) {
                    return "Start";
                  } else {
                    return Function.apply(defaultFormatterFunction, [duration]);
                  }
                },
              ),
            )
          : Column(
              children: [
                isDebug
                    ? Observer(builder: (_) {
                        return Text(viewModel.isCounterFinished
                            ? "Finished"
                            : viewModel.isCounterStarted
                                ? "Started"
                                : "Not Started");
                      })
                    : Container(),
                Observer(builder: (_) {
                  return
                      //  InkWell(
                      //   onTap: () {
                      //     viewModel.countDownController.start();
                      //   },
                      //   child:
                      CircularCountDownTimer(
                    // timerin iç yuvarlağını dolduran renk
                    backgroundGradient:  LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: timerBackgroundGradientColors,
                    ),
                    //akan zaman üstte
                    fillGradient:  LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: timerFillGradientColors,
                    ),
                    //arkada kalan renk akmayan tüm zaman
                    ringGradient:  SweepGradient(
                      colors: timerRingGradientColors,
                    ),

                    duration: viewModel.defaultDuration,
                    initialDuration: 0,
                    controller: viewModel.countDownController,
                    width: MediaQuery.of(context).size.width / 4,
                    height: MediaQuery.of(context).size.width / 4,
                    ringColor: timerRingColor,
                    fillColor: timerFillColor,
                    backgroundColor: timerBackgroundColor,
                    strokeWidth: 5.0,
                    strokeCap: StrokeCap.round,
                    textStyle: TextStyle(
                        fontSize: 33.0,
                        color: themeModel.isDarkMode
                            ? timerDarkModeTextColor
                            : timerLightModeTextColor,
                        fontWeight: FontWeight.bold),
                    textFormat: CountdownTextFormat.S,
                    isReverse: true,
                    isReverseAnimation: false,
                    isTimerTextShown: true,
                    autoStart: false,
                    onStart: () {
                      viewModel.resetScore20s();
                      viewModel.resetScore1m();
                      viewModel.resetScore5m();
                      viewModel.counterStarted();
                      viewModel.counterNotFinished();
                    },
                    onComplete: () {
                      debugPrint('Countdown Ended');
                      viewModel.counterStopped();
                      viewModel.counterFinished();
                      viewModel.resetScore20s();
                      viewModel.resetScore1m();
                      viewModel.resetScore5m();
                    },
                    onChange: (String timeStamp) {
                      debugPrint('Countdown Changed $timeStamp');
                    },

                    timeFormatterFunction:
                        (defaultFormatterFunction, duration) {
                      // if (duration.inMilliseconds ==
                      //         viewModel.defaultDuration * 1000 ||
                      //     duration.inMilliseconds == 0) {
                      //   return "start".tr();
                      // } else

                      {
                        return Function.apply(
                            defaultFormatterFunction, [duration]);
                      }
                    },
                    // ),
                  );
                }),
              ],
            );
    });
  }
}
