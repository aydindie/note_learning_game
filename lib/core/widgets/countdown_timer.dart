import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../features/Note/viewmodel/note_view_model.dart';

class CountdownTimer extends StatelessWidget {
  const CountdownTimer({
    Key? key,
    required CountDownController countDownController,
  })  : _countDownController = countDownController,
        super(key: key);

  final CountDownController _countDownController;

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<NoteViewModel>(context);
    return Observer(builder: (_) {
      return viewModel.durationPreferences == DurationPreferences.NONE
          ? Container()
          : InkWell(
              onTap: () {
                _countDownController.start();
              },
              child: CircularCountDownTimer(
                duration: 10,
                initialDuration: 0,
                controller: _countDownController,
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
                  debugPrint('Countdown Started');
                },
                onComplete: () {
                  debugPrint('Countdown Ended');
                },
                onChange: (String timeStamp) {
                  debugPrint('Countdown Changed $timeStamp');
                },
                timeFormatterFunction: (defaultFormatterFunction, duration) {
                  if (duration.inSeconds == 10) {
                    return "Start";
                  } else {
                    return Function.apply(defaultFormatterFunction, [duration]);
                  }
                },
              ),
            );
    });
  }
}
