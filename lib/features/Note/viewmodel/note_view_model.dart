// ignore_for_file: library_private_types_in_public_api, constant_identifier_names

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:note_learning_game/features/Settings/viewmodel/settings_store.dart';

import '../model/note_model.dart';
import '../service/INoteService.dart';
import '../service/note_service.dart';
part 'note_view_model.g.dart';
final List<String> siList = ["do", "re", "mi", "fa", "sol", "la", "si"];
final List<String> tiList = ["do", "re", "mi", "fa", "sol", "la", "ti"];
final List<String> bList = ["C", "D", "E", "F", "G", "A", "B"];
final List<String> hList = ["C", "D", "E", "F", "G", "A", "B"];
class NoteViewModel = _NoteViewModelBase with _$NoteViewModel;

abstract class _NoteViewModelBase with Store {
    @computed
  List<String> get defaultList {
    switch (noteNamesPreferences) {
      case NoteNamesPreferences.B:
        return bList;
      case NoteNamesPreferences.H:
        return hList;
      case NoteNamesPreferences.SI:
        return siList;
      case NoteNamesPreferences.TI:
        return tiList;

      default:
        return siList;
    }
  }

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

  BuildContext? contextt;
  late INoteService homeService;
  @observable
  List<NoteModel> items = [];
  @observable
  LifeState pageLifes = LifeState.IDLE;

  @computed
  int get itemCount => items.length;

  @observable
  int noteIndex = 0;

  @observable
  int score = 0;

  @action
  void scoreIncrement() {
    score++;
  }

  @action
  void updateRandomIndex() {
    if (itemCount > 0) {
      if (isTrebleOn && isBassOn) {
        //hepsi
        noteIndex = Random().nextInt(items.length);
      } else if (isTrebleOn && !(isBassOn)) {
        //ilk14
        noteIndex = Random().nextInt(14) + 1;
      } else if (!(isTrebleOn) && (isBassOn)) {
        //15-28
        noteIndex = Random().nextInt(14) + 15;
      } else {
        //hepsi
        noteIndex = Random().nextInt(items.length);
      }
    } else {
      if (kDebugMode) {
        print("items boş");
      }
    }
  }

  @action
  _NoteViewModelBase() {
    homeService = NoteService();
  }
  @action
  void setContext(BuildContext? context) {
    contextt = context;
    fetchItems();
  }

  @action
  Future<void> fetchItems() async {
    pageLifes = LifeState.LOADING;
    items = await homeService.getAllNotes();
    pageLifes = LifeState.DONE;
  }

  // @computed
  // int get getRandomIndex{

  // }
}

enum LifeState { IDLE, LOADING, DONE }
enum NoteNamesPreferences { B, H, SI, TI }