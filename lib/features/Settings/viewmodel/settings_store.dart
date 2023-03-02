// // ignore_for_file: constant_identifier_names

// import 'package:mobx/mobx.dart';
// part 'settings_store.g.dart';

// final List<String> siList = ["do", "re", "mi", "fa", "sol", "la", "si"];
// final List<String> tiList = ["do", "re", "mi", "fa", "sol", "la", "ti"];
// final List<String> bList = ["C", "D", "E", "F", "G", "A", "B"];
// final List<String> hList = ["C", "D", "E", "F", "G", "A", "B"];
// class SettingsViewModel = _SettingsViewModelBase with _$SettingsViewModel;

// abstract class _SettingsViewModelBase with Store {
//   @computed
//   List<String> get defaultList {
//     switch (noteNamesPreferences) {
//       case NoteNamesPreferences.B:
//         return bList;
//       case NoteNamesPreferences.H:
//         return hList;
//       case NoteNamesPreferences.SI:
//         return siList;
//       case NoteNamesPreferences.TI:
//         return tiList;

//       default:
//         return siList;
//     }
//   }

//   @observable
//   bool isSoundOn = true;

//   @action
//   void changeSound() {
//     isSoundOn = !isSoundOn;
//   }

//   @observable
//   bool isDarkMode = false;

//   @action
//   void changeTheme() {
//     isDarkMode = !isDarkMode;
//   }

//   @observable
//   bool isTrebleOn = true;

  

//   @action
//   void changeTreble() {
//     isTrebleOn = !isTrebleOn;
//   }

//   @observable
//   bool isBassOn = true;

//   @action
//   void changeBass() {
//     isBassOn = !isBassOn;
//   }

//   @observable
//   bool isAltoOn = true;

//   @action
//   void changeAlto() {
//     isAltoOn = !isAltoOn;
//   }

//   @observable
//   NoteNamesPreferences noteNamesPreferences = NoteNamesPreferences.SI;

//   @action
//   void changeNoteNamesPreferences(NoteNamesPreferences noteNamesPreferences) {
//     this.noteNamesPreferences = noteNamesPreferences;
//   }
// }

// enum NoteNamesPreferences { B, H, SI, TI }
