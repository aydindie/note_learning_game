import 'package:flutter/material.dart';
import 'package:note_learning_game/widgets/sound_on_off_widget.dart';
import 'package:note_learning_game/ui/Onboard/onboarding.dart';

import '../ui/Settings/settings.dart';
import '../utils/colors.dart';

class TopIconButtons extends StatefulWidget {
  const TopIconButtons({
    Key? key,
  }) : super(key: key);

  @override
  State<TopIconButtons> createState() => _TopIconButtonsState();
}

class _TopIconButtonsState extends State<TopIconButtons> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SoundOnOffWidget(),
        Row(
          children: [
            //info and settings iconbutton
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const OnboardingScreen()));
                },
                icon: Icon(
                  Icons.info_outline,
                  size: h >= 400 ? 35 : 32,
                  color: iconsColors,
                )),
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SettingsView()));
                },
                icon: Icon(
                  Icons.settings_outlined,
                  size: h >= 400 ? 35 : 32,
                  color: iconsColors,
                )),
          ],
        )
      ],
    );
  }
}
