import 'package:flutter/material.dart';
import 'package:note_learning_game/widgets/sound_on_off_widget.dart';
import 'package:note_learning_game/ui/Onboard/onboarding_screen.dart';

import '../ui/Settings/settings_view.dart';

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
                icon: const Icon(
                  Icons.info_outline,
                  size: 31,
                )),
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SettingsView()));
                },
                icon: const Icon(
                  Icons.settings_outlined,
                  size: 31,
                )),
          ],
        )
      ],
    );
  }
}
