// ignore_for_file: library_private_types_in_public_api, constant_identifier_names

import 'dart:math';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

import '../constants/enums.dart';
import '../constants/strings.dart';
import '../models/note_model.dart';
import '../data/service/INoteService.dart';
import '../data/service/note_service.dart';

part 'all_store.g.dart';

class AllStore = _AllStoreBase with _$AllStore;

abstract class _AllStoreBase with Store {
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

  @computed
  int get defaultDuration {
    switch (durationPreferences) {
      case DurationPreferences.TWENTY:
        return 20;
      case DurationPreferences.MINUTE:
        return 60;
      case DurationPreferences.FIVE_MIN:
        return 300;
      case DurationPreferences.NONE:
        return 0;

      default:
        return 0;
    }
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
  LanguagePreferences languagePreferences = LanguagePreferences.English;

  @observable
  CountDownController countDownController = CountDownController();

  @action
  void restartCountDown() {
    //Restartlanıyor ancak dispose edilmediğinden akmaya devam ediyor bu yüzden pause yapıyoruz ki autoStart gibi gözükmesin

    countDownController.restart(duration: defaultDuration);
    countDownController.pause();
  }

  @action
  void changeLanguagePreferences(LanguagePreferences languagePreferences) {
    this.languagePreferences = languagePreferences;
  }

  @observable
  NoteNamesPreferences noteNamesPreferences = NoteNamesPreferences.SI;

  @action
  void changeNoteNamesPreferences(NoteNamesPreferences noteNamesPreferences) {
    this.noteNamesPreferences = noteNamesPreferences;
  }

  @observable
  DurationPreferences durationPreferences = DurationPreferences.NONE;

  @action
  void changeDurationPreferences(DurationPreferences durationPreferences) {
    this.durationPreferences = durationPreferences;
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
        noteIndex = Random().nextInt(14) + 14;
      } else if (!(isTrebleOn) && (isBassOn)) {
        //15-28
        noteIndex =
            Random().nextInt(14); //0-13 gösteriyor bizim dizide yani 1 14
      } else {
        //hepsi
        //29tane var
        noteIndex = Random().nextInt(items.length);
        //0-28
      }
    } else {
      if (kDebugMode) {
        print("items boş");
      }
    }
  }

  @action
  _AllStoreBase() {
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
}
