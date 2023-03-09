// ignore_for_file: library_private_types_in_public_api, constant_identifier_names

import 'dart:math';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

import '../constants/enums.dart';
import '../constants/strings.dart';
import '../data/sharedpref/shared_preference_helper.dart';
import '../models/note_model.dart';
import '../data/service/INoteService.dart';
import '../data/service/note_service.dart';

part 'all_store.g.dart';

class AllStore = _AllStoreBase with _$AllStore;

abstract class _AllStoreBase with Store {
  @observable
  bool isCounterStarted = false;

  @action
  void counterStarted() {
    isCounterStarted = true;
  }

  @action
  void counterStopped() {
    isCounterStarted = false;
  }

  @observable
  bool isCounterFinished = false;

  @action
  void counterFinished() {
    isCounterFinished = true;
  }

  @action
  void counterNotFinished() {
    isCounterFinished = false;
  }

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

//==================Duration==================

  @observable
  DurationPreferences durationPreferences = DurationPreferences.NONE;

  void getDurationFromShared() async {
    durationPreferences =
        await SharedPreferenceHelper().getDurationPreferences() ??
            DurationPreferences.NONE;
  }

  @action
  Future<void> changeDurationPreferences(
      DurationPreferences durationPreferences) async {
    this.durationPreferences = durationPreferences;
    await SharedPreferenceHelper().saveDurationPreferences(durationPreferences);
  }

//================================================
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

  //==========isTrebleOn================

  @observable
  bool isTrebleOn = true;

  void getTrebleFromShared() async {
    isTrebleOn = await SharedPreferenceHelper().getTrebleOn() ?? true;
  }

  @action
  Future<void> changeTreble() async {
    isTrebleOn = !isTrebleOn;
    await SharedPreferenceHelper().saveTrebleOn(isTrebleOn);
  }
  //===========isBassOn=================

  @observable
  bool isBassOn = true;

  void getBassFromShared() async {
    isBassOn = await SharedPreferenceHelper().getBassOn() ?? true;
  }

  @action
  Future<void> changeBass() async {
    isBassOn = !isBassOn;
    await SharedPreferenceHelper().saveBassOn(isBassOn);
  }

  // @observable
  // bool isAltoOn = true;

  // @action
  // void changeAlto() {
  //   isAltoOn = !isAltoOn;
  // }

  @observable
  LanguagePreferences languagePreferences = LanguagePreferences.en_US;

  @observable
  CountDownController countDownController = CountDownController();

  @action
  void restartCountDown() {
    //Restartlanıyor ancak dispose edilmediğinden akmaya devam ediyor bu yüzden pause yapıyoruz ki autoStart gibi gözükmesin

    countDownController.restart(duration: defaultDuration);
    countDownController.pause();
  }

  @action
  Future<void> changeLanguagePreferences(
      LanguagePreferences languagePreferences) async {
    this.languagePreferences = languagePreferences;
    var a = languagePreferences.name.split("_");
    print(a[0]);
    print(a[1]);
    await contextt!.setLocale(Locale(a[0], a[1]));
  }

  //==================NoteNames==================

  @observable
  NoteNamesPreferences noteNamesPreferences = NoteNamesPreferences.SI;

  void getNoteNamesFromShared() async {
    noteNamesPreferences =
        await SharedPreferenceHelper().getNoteNamesPreferences() ??
            NoteNamesPreferences.SI;
  }

  @action
  Future<void> changeNoteNamesPreferences(
      NoteNamesPreferences noteNamesPreferences) async {
    this.noteNamesPreferences = noteNamesPreferences;
    await SharedPreferenceHelper()
        .saveNoteNamesPreferences(noteNamesPreferences);
  }

//================================================

  BuildContext? contextt;
  BuildContext? context2;
  late INoteService homeService;
  @observable
  List<NoteModel> items = [];
  @observable
  LifeState pageLifes = LifeState.IDLE;

  @computed
  int get itemCount => items.length;

  @observable
  int noteIndex = 0;

  //============== Süresiz skor =============
/*

  @observable
  bool isBassOn = true;

  void getBassFromShared() async {
    isBassOn = await SharedPreferenceHelper().getBassOn() ?? true;
  }

  @action
  Future<void> changeBass() async {
    isBassOn = !isBassOn;
    await SharedPreferenceHelper().saveBassOn(isBassOn);
  }
*/
  @observable
  int score = 0;

  void getScoreFromShared() async {
    score = await SharedPreferenceHelper().getScore() ?? 0;
  }

  @action
  Future<void> changeScore() async {
    score++;
    await SharedPreferenceHelper().saveScore(score);
  }

  //============== 20 saniye Süreli skor =============

  @observable
  int score20s = 0; // anlık skor

  @observable
  int best20sScore = 0; //best skor

  void getScore20sFromShared() async {
    best20sScore = await SharedPreferenceHelper().getBestScore20s() ?? 0;
  }

  @action
  Future<void> changeScore20s() async {
    if (isCounterStarted && !isCounterFinished) {
      score20s++;
      //başladı  ve durdurulmadı ve bitmediyse
      if (score20s > best20sScore) {
        best20sScore = score20s;
      }
      await SharedPreferenceHelper().saveBestScore20s(best20sScore);
    }
  }

  void resetScore20s() {
    //Süre bitince skoru sıfırla
    score20s = 0;
  }

  //============== 1 dakika Süreli skor =============
  @observable
  int score1m = 0; // anlık skor

  @observable
  int best1mScore = 0; //best skor

  void getScore1mFromShared() async {
    best1mScore = await SharedPreferenceHelper().getBestScore1m() ?? 0;
  }

  @action
  Future<void> changeScore1m() async {
    if (isCounterStarted && !isCounterFinished) {
      score1m++;
      //başladı  ve durdurulmadı ve bitmediyse
      if (score1m > best1mScore) {
        best1mScore = score1m;
      }
      await SharedPreferenceHelper().saveBestScore1m(best1mScore);
    }
  }

  void resetScore1m() {
    //Süre bitince skoru sıfırla
    score1m = 0;
  }

  //============== 5 dakika Süreli skor =============
  @observable
  int score5m = 0; // anlık skor

  @observable
  int best5mScore = 0; //best skor

  void getScore5mFromShared() async {
    best5mScore = await SharedPreferenceHelper().getBestScore5m() ?? 0;
  }

  @action
  Future<void> changeScore5m() async {
    if (isCounterStarted && !isCounterFinished) {
      score5m++;
      //başladı  ve durdurulmadı ve bitmediyse
      if (score5m > best5mScore) {
        best5mScore = score5m;
      }
      await SharedPreferenceHelper().saveBestScore5m(best5mScore);
    }
  }

  void resetScore5m() {
    //Süre bitince skoru sıfırla
    score5m = 0;
  }

  //==============================================

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
    getTrebleFromShared();
    getBassFromShared();
    getDurationFromShared();
    getScoreFromShared();
    getScore20sFromShared();
    getScore1mFromShared();
    getScore5mFromShared();
    getNoteNamesFromShared();
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
