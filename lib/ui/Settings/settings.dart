// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_local_variable
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:note_learning_game/widgets/note_names_preferences_widget.dart';
import 'package:provider/provider.dart';

import '../../constants/enums.dart';
import '../../controller/language_controller.dart';
import '../../stores/all_store.dart';
import '../../utils/colors.dart';
import '../../widgets/clef_widget.dart';
import '../../widgets/duration_widget.dart';
import '../../widgets/sound_on_off_widget.dart';
import '../../widgets/text_widget.dart';

const List<String> list = ['English', 'French', 'German', 'Turkish'];

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    context.watch<LanguageController>();
    final viewModel = Provider.of<AllStore>(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    //LanguagePreferences dropdownValue = viewModel.languagePreferences;
    return Scaffold(
      backgroundColor: settingsBackgroundColor,
      appBar: AppBar(
          elevation: 1,
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
              size: 30,
            ),
          )),
      body: Center(
        child: ListView(
          children: [
            Column(
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
                divider(height),
                TextWidget(text: "language".tr()),

                SizedBox(height: height * 0.012),

                // const TemaWidget(),
                // const AnimatedSwitch(),

                // DropdownButton<String>(
                //   value: dropdownValue, //Gozüken string
                //   icon: const Icon(Icons.translate_outlined),
                //   elevation: 16,
                //   style: const TextStyle(color: Colors.deepPurple),
                //   underline: Container(
                //     height: 2,
                //     color: Colors.deepPurpleAccent,
                //   ),
                //   onChanged: (String? value) {
                //     // This is called when the user selects an item.
                //     print(value);
                //     setState(() {
                //       dropdownValue = value!;
                //     });
                //   },
                //   items: list.map<DropdownMenuItem<String>>((String value) {
                //     return DropdownMenuItem<String>(
                //       value: value,
                //       child: Text(value),
                //     );
                //   }).toList(),
                // ),
                const DropdownButtonExample(),
                // DropdownButtonExample(),
                // divider(height),
                // TextWidget(text: "tema".tr()),

                // SizedBox(height: height * 0.012),
                SizedBox(height: height * 0.03),
                //aydindie
                const Text("@aydindie"),

                // Text("${"version".tr()} 1.0.0"),
                const Text("© 2023"),
                // const Text("All rights reserved"),
              ],
            ),
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

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;
  void getValueFromLocale() {
    switch (context.locale.toString()) {
      case "en_US":
        dropdownValue = list[0];
        break;
      case "fr_FR":
        dropdownValue = list[1];
        break;
      case "de_DE":
        dropdownValue = list[2];
        break;
      case "tr_TR":
        dropdownValue = list[3];
        break;
      default:
        dropdownValue = list[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    getValueFromLocale();

    LanguageController controller = context.read<LanguageController>();
    return DropdownButton<String>(
      value: dropdownValue,
      hint: const Text("Language"),
      borderRadius: BorderRadius.circular(15),
      // icon: const Icon(Icons.translate_outlined),
      elevation: 16,
      style: const TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
        // switch case of value which is language and set language
        switch (value) {
          // case "English":
          //   context.setLocale(const Locale('en', 'US'));
          //   controller.onLanguageChanged();
          //   break;
          //const List<String> list = ['English', 'French', 'German', 'Turkish'];
          case "English":
            context.setLocale(const Locale('en', 'US'));
            controller.onLanguageChanged();
            break;
          case "French":
            context.setLocale(const Locale('fr', 'FR'));
            controller.onLanguageChanged();
            break;
          case "German":
            context.setLocale(const Locale('de', 'DE'));
            controller.onLanguageChanged();
            break;
          case "Turkish":
            context.setLocale(const Locale('tr', 'TR'));
            controller.onLanguageChanged();
            break;

          default:
            context.setLocale(const Locale('en', 'US'));
            controller.onLanguageChanged();
            break;
        }
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Column(
            children: [
              Expanded(
                  child: Container(
                      child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black,
                    ),
                    child: Center(
                      child: SizedBox(
                        width: width * 0.2,
                        child: Center(
                          child: Text(value,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .fontFamily)),
                        ),
                      ),
                    )),
              )))
            ],
          ),
        );
      }).toList(),
    );
  }
}
