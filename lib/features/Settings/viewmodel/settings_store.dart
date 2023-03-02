// ignore_for_file: constant_identifier_names

import 'package:mobx/mobx.dart';
part 'settings_store.g.dart';

class SettingsViewModel = _SettingsViewModelBase with _$SettingsViewModel;

abstract class _SettingsViewModelBase with Store {
  @observable
  bool isSoundOn = true;

  @action
  void changeSound() {
    isSoundOn = !isSoundOn;
  }

  @observable
  bool isDarkMode = false;

  @action
  void changeTheme() {
    isDarkMode = !isDarkMode;
  }

  @observable
  bool isTrebleOn = true;

  @action
  void changeTreble() {
    isTrebleOn = !isTrebleOn;
  }

  @observable
  bool isBassOn = true;

  @action
  void changeBass() {
    isBassOn = !isBassOn;
  }

  @observable
  bool isAltoOn = true;

  @action
  void changeAlto() {
    isAltoOn = !isAltoOn;
  }

  @observable
  NoteNamesPreferences noteNamesPreferences = NoteNamesPreferences.SI;

  @action
  void changeNoteNamesPreferences(NoteNamesPreferences noteNamesPreferences) {
    this.noteNamesPreferences = noteNamesPreferences;
  }
  


  


}

enum NoteNamesPreferences { B, H, SI,TI }
