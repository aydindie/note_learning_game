// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:note_learning_game/stores/all_store.dart';

import '../constants/enums.dart';
import '../utils/colors.dart';

class DurationWidget extends StatefulWidget {
  final BuildContext context;
  final DurationPreferences durationPreferences;
  final String text;

  const DurationWidget({
    Key? key,
    required this.context,
    required this.durationPreferences,
    required this.text,
  }) : super(key: key);

  @override
  State<DurationWidget> createState() => _DurationWidgetState();
}

class _DurationWidgetState extends State<DurationWidget> {
  @override
  Widget build(BuildContext context) {
    final allStore = Provider.of<AllStore>(widget.context);
    //
    return Observer(builder: (_) {
      return Container(
        width: MediaQuery.of(context).size.width * 0.2,
        height: MediaQuery.of(context).size.width * 0.12,
        decoration: BoxDecoration(
          color: getColor(widget.durationPreferences, allStore),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          child: InkWell(
              //enableFeedback: false,
              onTap: () {
                allStore.changeDurationPreferences(widget.durationPreferences);
                allStore.restartCountDown();
                allStore.countDownController.reset();
              },
              child: Center(
                child: Text(widget.text.tr()),
              )),
        ),
      );
    });
  }
}

Color getColor(DurationPreferences durationPreferences, AllStore allStore) {
  if (allStore.durationPreferences == durationPreferences) {
    return choosedDurationBackgroundColor;
  }
  return notChoosedDurationBackgroundColor;
}

Function() getMyFunction(
    DurationPreferences durationPreferences, AllStore allStore) {
  if (durationPreferences == DurationPreferences.TWENTY) {
    return () {
      allStore.changeDurationPreferences(DurationPreferences.TWENTY);
    };
  } else if (durationPreferences == DurationPreferences.MINUTE) {
    return () {
      allStore.changeDurationPreferences(DurationPreferences.MINUTE);
      allStore.restartCountDown();
      allStore.countDownController.reset();
    };
  } else if (durationPreferences == DurationPreferences.FIVE_MIN) {
    return () {
      allStore.changeDurationPreferences(DurationPreferences.FIVE_MIN);
      allStore.restartCountDown();
      allStore.countDownController.reset();
    };
  } else if (durationPreferences == DurationPreferences.NONE) {
    return () {
      allStore.changeDurationPreferences(DurationPreferences.NONE);
      allStore.restartCountDown();
      allStore.countDownController.reset();
    };
  }
  return () {
    allStore.changeDurationPreferences(DurationPreferences.TWENTY);
    allStore.restartCountDown();
    allStore.countDownController.reset();
  };
}
