import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../constants/enums.dart';
import '../constants/isDebug.dart';
import '../stores/all_store.dart';

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

    return Observer(builder: (_) {
      //TODO: burada controllerin dispose olmaması için 0 pixellik bir container oluşturuldu. Bu çözüm geçici bir çözüm. Daha iyi bir çözüm bulunmalı.
      return viewModel.durationPreferences == DurationPreferences.NONE
          // ignore: avoid_unnecessary_containers
          ? Container(
              child: CircularCountDownTimer(
                width: 0,
                height: 0,
                duration: viewModel.defaultDuration,
                ringColor: Colors.black,
                fillColor: Colors.blueAccent[100]!,
                initialDuration: 0,
                controller: viewModel.countDownController,
                backgroundColor: Colors.transparent,
                strokeWidth: 5.0,
                strokeCap: StrokeCap.round,
                textStyle: const TextStyle(
                    fontSize: 33.0,
                    color: Colors.black,
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
                    duration: viewModel.defaultDuration,
                    initialDuration: 0,
                    controller: viewModel.countDownController,
                    width: MediaQuery.of(context).size.width / 4,
                    height: MediaQuery.of(context).size.width / 4,
                    ringColor: Colors.black,
                    fillColor: Colors.blueAccent[100]!,
                    backgroundColor: Colors.transparent,
                    strokeWidth: 5.0,
                    strokeCap: StrokeCap.round,
                    textStyle: const TextStyle(
                        fontSize: 33.0,
                        color: Colors.black,
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
                      if (duration.inMilliseconds ==
                              viewModel.defaultDuration * 1000 ||
                          duration.inMilliseconds == 0) {
                        return "Start";
                      } else {
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
