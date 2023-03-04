// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_local_variable
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../constants/enums.dart';
import '../../stores/all_store.dart';
import '../../widgets/sound_on_off_widget.dart';
import '../../widgets/tema_widget.dart';
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
    const List<String> list = <String>[
      "English",
      "German",
      "French",
      "Turkish"
    ];
    LanguagePreferences dropdownValue = viewModel.languagePreferences;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.grey,
          title: const Text('Settings',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w400)),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextWidget(text: "Sound"),
            const SizedBox(height: 10),
            // sound on off button with icon
            const SoundOnOffWidget(),
            const SizedBox(height: 10),
            // dark mode on off button with icon
            const TextWidget(text: "Clef"),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Observer(builder: (_) {
                  return Container(
                      width: MediaQuery.of(context).size.width * 0.12,
                      height: MediaQuery.of(context).size.width * 0.16,
                      decoration: BoxDecoration(
                        color:
                            viewModel.isTrebleOn ? Colors.green : Colors.grey,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 8),
                        child: InkWell(
                          enableFeedback: false,
                          onTap: () => viewModel.changeTreble(),
                          child: const Image(
                              image: AssetImage('assets/images/treble.png')),
                        ),
                      ));
                }),
                SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                Observer(builder: (_) {
                  return Container(
                      width: MediaQuery.of(context).size.width * 0.12,
                      height: MediaQuery.of(context).size.width * 0.16,
                      decoration: BoxDecoration(
                        color: viewModel.isBassOn ? Colors.green : Colors.grey,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 8),
                        child: InkWell(
                          enableFeedback: false,
                          onTap: () => viewModel.changeBass(),
                          child: const Image(
                              image: AssetImage('assets/images/bass.png')),
                        ),
                      ));
                }),

                //==========ALTO  CLEF BUTTON==========
                // SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                // Observer(builder: (_) {
                //   return Container(
                //       width: MediaQuery.of(context).size.width * 0.12,
                //       height: MediaQuery.of(context).size.width * 0.16,
                //       decoration: BoxDecoration(
                //         color: settingsViewModel.isAltoOn
                //             ? Colors.green
                //             : Colors.grey,
                //         borderRadius: BorderRadius.circular(15),
                //       ),
                //       child: Padding(
                //         padding: const EdgeInsets.symmetric(
                //             vertical: 10, horizontal: 8),
                //         child: InkWell(
                //           enableFeedback: false,
                //           onTap: () => settingsViewModel.changeAlto(),
                //           child: const Image(
                //               image: AssetImage('assets/images/alto.png')),
                //         ),
                //       ));
                // }),
              ],
            ),
            const SizedBox(height: 10),
            //note
            //==============DURATION BUTTONS=================
            const TextWidget(text: "Duration"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Observer(builder: (_) {
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.width * 0.12,
                    decoration: BoxDecoration(
                      color: viewModel.durationPreferences ==
                              DurationPreferences.TWENTY
                          ? Colors.green
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 8),
                      child: InkWell(
                          enableFeedback: false,
                          onTap: () {
                            viewModel.changeDurationPreferences(
                                DurationPreferences.TWENTY);
                            viewModel.restartCountDown();
                          },
                          child: const Center(
                            child: Text("20s"),
                          )),
                    ),
                  );
                }),
                //observer

                SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                Observer(builder: (_) {
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.width * 0.12,
                    decoration: BoxDecoration(
                      color: viewModel.durationPreferences ==
                              DurationPreferences.MINUTE
                          ? Colors.green
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 8),
                      child: InkWell(
                          enableFeedback: false,
                          onTap: () {
                            viewModel.changeDurationPreferences(
                                DurationPreferences.MINUTE);
                            viewModel.restartCountDown();
                          },
                          child: const Center(
                            child: Text("min"),
                          )),
                    ),
                  );
                }),

                //observer
                SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                Observer(builder: (_) {
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.width * 0.12,
                    decoration: BoxDecoration(
                      color: viewModel.durationPreferences ==
                              DurationPreferences.FIVE_MIN
                          ? Colors.green
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 8),
                      child: InkWell(
                          enableFeedback: false,
                          onTap: () {
                            viewModel.changeDurationPreferences(
                                DurationPreferences.FIVE_MIN);
                            viewModel.restartCountDown();
                          },
                          child: const Center(
                            child: Text("5 min"),
                          )),
                    ),
                  );
                }),
                SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                Observer(builder: (_) {
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.width * 0.12,
                    decoration: BoxDecoration(
                      color: viewModel.durationPreferences ==
                              DurationPreferences.NONE
                          ? Colors.green
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 8),
                      child: InkWell(
                          enableFeedback: false,
                          onTap: () {
                            viewModel.changeDurationPreferences(
                                DurationPreferences.NONE);

                            viewModel.restartCountDown();
                          },
                          child: const Center(
                            child: Text("None"),
                          )),
                    ),
                  );
                }),
              ],
            ),

            const SizedBox(height: 10),

            const TextWidget(text: "Note Names Prefences"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //bool onpreess text
                Observer(builder: (_) {
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.width * 0.12,
                    decoration: BoxDecoration(
                      color: viewModel.noteNamesPreferences ==
                              NoteNamesPreferences.B
                          ? Colors.green
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 8),
                      child: InkWell(
                          enableFeedback: false,
                          onTap: () => viewModel.changeNoteNamesPreferences(
                              NoteNamesPreferences.B),
                          child: const Center(
                            child: Text("C..G,A,B"),
                          )),
                    ),
                  );
                }),
                const SizedBox(
                  width: 10,
                ),
                Observer(builder: (_) {
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.width * 0.12,
                    decoration: BoxDecoration(
                      color: viewModel.noteNamesPreferences ==
                              NoteNamesPreferences.H
                          ? Colors.green
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 8),
                      child: InkWell(
                          enableFeedback: false,
                          onTap: () => viewModel.changeNoteNamesPreferences(
                              NoteNamesPreferences.H),
                          child: const Center(
                            child: Text("C..G,A,H"),
                          )),
                    ),
                  );
                }),
                const SizedBox(
                  width: 10,
                ),
                Observer(builder: (_) {
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.width * 0.12,
                    decoration: BoxDecoration(
                      color: viewModel.noteNamesPreferences ==
                              NoteNamesPreferences.SI
                          ? Colors.green
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 8),
                      child: InkWell(
                          enableFeedback: false,
                          onTap: () => viewModel.changeNoteNamesPreferences(
                              NoteNamesPreferences.SI),
                          child: const Center(
                            child: Text("do..sol,la,si"),
                          )),
                    ),
                  );
                }),
                const SizedBox(
                  width: 10,
                ),
                Observer(builder: (_) {
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.width * 0.12,
                    decoration: BoxDecoration(
                      color: viewModel.noteNamesPreferences ==
                              NoteNamesPreferences.TI
                          ? Colors.green
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 8),
                      child: InkWell(
                          enableFeedback: false,
                          onTap: () => viewModel.changeNoteNamesPreferences(
                              NoteNamesPreferences.TI),
                          child: const Center(
                            child: Text("do..sol,la,ti"),
                          )),
                    ),
                  );
                }),
              ],
            ),
            const SizedBox(height: 10),
            const TextWidget(text: "Language"),
            DropdownButton(
                value: dropdownValue,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (value) {
                  setState(() {
                    //change the language enum.
                    viewModel.changeLanguagePreferences(
                        value as LanguagePreferences);
                  });
                },
                items: const [
                  DropdownMenuItem(
                    value: LanguagePreferences.English,
                    child: Text('English'),
                  ),
                  DropdownMenuItem(
                    value: LanguagePreferences.German,
                    child: Text('German'),
                  ),
                  DropdownMenuItem(
                    value: LanguagePreferences.French,
                    child: Text('French'),
                  ),
                  DropdownMenuItem(
                    value: LanguagePreferences.Turkish,
                    child: Text('Turkish'),
                  ),
                ]),

            const TemaWidget(),
          ],
        ),
      ),
    );
  }
}
