// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_local_variable
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:note_learning_game/widgets/animated_switch.dart';
import 'package:note_learning_game/widgets/note_names_preferences_widget.dart';
import 'package:provider/provider.dart';

import '../../constants/enums.dart';
import '../../stores/all_store.dart';
import '../../utils/colors.dart';
import '../../widgets/clef_widget.dart';
import '../../widgets/duration_widget.dart';
import '../../widgets/sound_on_off_widget.dart';
import '../../widgets/text_widget.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AllStore>(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    //LanguagePreferences dropdownValue = viewModel.languagePreferences;
    return Scaffold(
      backgroundColor: settingsBackgroundColor,
      appBar: AppBar(
          backgroundColor: settingsAppBarBackgroundColor,
          title: Text('settings'.tr(),
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: settingsAppBarTextColor,
                      fontWeight: FontWeight.w400))
              .tr(),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: settingAppBarIconColor,
              size: 35,
            ),
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.015),
            TextWidget(text: "sound".tr()),
            SizedBox(height: height * 0.015),

            // sound on off button with icon
            const SoundOnOffWidget(),
            divider(height),
            // dark mode on off button with icon
            TextWidget(text: "clef".tr()),
            SizedBox(height: height * 0.012),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClefWidget(context: context, isItTreble: true),
                SizedBox(width: width * 0.05),
                ClefWidget(context: context, isItTreble: false),
              ],
            ),
            divider(height),

            //note
            //==============DURATION BUTTONS=================
            TextWidget(text: "duration".tr()),
            SizedBox(
              height: height * 0.012,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DurationWidget(
                    context: context,
                    durationPreferences: DurationPreferences.TWENTY,
                    text: "20s"),
                DurationWidget(
                    context: context,
                    durationPreferences: DurationPreferences.MINUTE,
                    text: "min"),
                DurationWidget(
                    context: context,
                    durationPreferences: DurationPreferences.FIVE_MIN,
                    text: "5min"),
                DurationWidget(
                    context: context,
                    durationPreferences: DurationPreferences.NONE,
                    text: "none"),
              ],
            ),
            divider(height),

            SizedBox(height: height * 0.012),

            TextWidget(text: "note_names_prefences".tr()),
            SizedBox(height: height * 0.012),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NoteNamesWiget(
                    context: context,
                    noteNamesPreferences: NoteNamesPreferences.B,
                    text: "C..G,A,B"),
                NoteNamesWiget(
                    context: context,
                    noteNamesPreferences: NoteNamesPreferences.H,
                    text: "C..G,A,H"),
                NoteNamesWiget(
                    context: context,
                    noteNamesPreferences: NoteNamesPreferences.SI,
                    text: "do..sol,la,si"),
                NoteNamesWiget(
                    context: context,
                    noteNamesPreferences: NoteNamesPreferences.TI,
                    text: "do..sol,la,ti"),
              ],
            ),

            SizedBox(height: height * 0.012),
            divider(height),
            SizedBox(height: height * 0.012),

            // const TemaWidget(),
            // const AnimatedSwitch()
          ],
        ),
      ),
    );
  }

  Divider divider(double height) {
    return const Divider(
      color: Colors.black,
      thickness: 2,
    );
  }
}
