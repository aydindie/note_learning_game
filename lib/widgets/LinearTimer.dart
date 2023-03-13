import 'dart:async';

import 'package:flutter/material.dart';

class LinearTimer extends StatefulWidget {
  final int durationMiliseconds;
  final Function onTimerFinish;

  const LinearTimer(
      {super.key,
      required this.durationMiliseconds,
      required this.onTimerFinish});

  @override
  _LinearTimerState createState() => _LinearTimerState();
}

class _LinearTimerState extends State<LinearTimer> {
  late int _milisecondsRemaining;
  late double _barWidth;
  late int _milisecondsRemaining2;
  late double _barWidth2;
  int durationMiliseconds = 17;

  @override
  void initState() {
    super.initState();
    _milisecondsRemaining = widget.durationMiliseconds;
    _barWidth = 1.0;
    _milisecondsRemaining2 = widget.durationMiliseconds;
    _barWidth2 = 1.0;
    startTimer();
  }

  void startTimer() {
    Timer.periodic(Duration(milliseconds: durationMiliseconds), (timer) {
      setState(() {
        if (_milisecondsRemaining2 > 0) {
          _milisecondsRemaining2 -= durationMiliseconds;
          _barWidth2 = _milisecondsRemaining2 <= 0
              ? 0
              : _milisecondsRemaining2 / widget.durationMiliseconds;
        } else {
          widget.onTimerFinish();
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 40.0,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.black,
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: _barWidth2,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _milisecondsRemaining2 = widget.durationMiliseconds;
              _barWidth2 = 1.0;
            });
            startTimer();
          },
          child: SizedBox(
            height: 40,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Text(
                      _milisecondsRemaining2 <= 0
                          ? "finished"
                          : ("${(_milisecondsRemaining2 / 1000).toStringAsFixed(0)}s left"),
                      style: TextStyle(
                        color: _milisecondsRemaining2 <= 0
                            ? Colors.white
                            : Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.timer_sharp,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
