import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/enums.dart';
import 'constants/preferences.dart';

class SharedPreferenceHelper {
  // shared pref instance

  // constructor

  //=============== isSoundOn value ===============
  Future<bool?> getSoundOn() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    var ourBoolget = sharedPreference.getBool(Preferences.is_sound_on);
    return ourBoolget;
  }

  Future<bool> saveSoundOn(bool value) async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    var ourBoolsave =
        await sharedPreference.setBool(Preferences.is_sound_on, value);

    return ourBoolsave;
  }

  Future<bool> removeSoundOn() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    var ourBoolRemove = await sharedPreference.remove(Preferences.is_sound_on);

    return ourBoolRemove;
  }

  //=============== isTrebleOn value ===============
  Future<bool?> getTrebleOn() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    var ourBoolget = sharedPreference.getBool(Preferences.is_treble_on);
    return ourBoolget;
  }

  Future<bool> saveTrebleOn(bool value) async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    var ourBoolsave =
        await sharedPreference.setBool(Preferences.is_treble_on, value);

    return ourBoolsave;
  }

  //=============== isBassOn value ===============
  Future<bool?> getBassOn() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    var ourBoolget = sharedPreference.getBool(Preferences.is_bass_on);
    return ourBoolget;
  }

  Future<bool> saveBassOn(bool value) async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    var ourBoolsave =
        await sharedPreference.setBool(Preferences.is_bass_on, value);

    return ourBoolsave;
  }

//=============== get duration value ===============
  Future<DurationPreferences?> getDurationPreferences() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    var ourIntget = sharedPreference.getInt(Preferences.current_duration);
    return DurationPreferences.values[ourIntget ?? 0];
  }

  Future<bool> saveDurationPreferences(DurationPreferences value) async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    var ourIntsave = await sharedPreference.setInt(
        Preferences.current_duration, value.index);

    return ourIntsave;
  }

  //======================SCORE====================
  Future<int?> getScore() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    var ourIntget = sharedPreference.getInt(Preferences.current_score);
    return ourIntget;
  }

  Future<bool> saveScore(int value) async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    var ourIntsave =
        await sharedPreference.setInt(Preferences.current_score, value);

    return ourIntsave;
  }

  //======================BESTSCORE20S====================
  Future<int?> getBestScore20s() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    var ourIntget = sharedPreference.getInt(Preferences.best_score_20s);
    return ourIntget;
  }

  Future<bool> saveBestScore20s(int value) async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    var ourIntsave =
        await sharedPreference.setInt(Preferences.best_score_20s, value);

    return ourIntsave;
  }

  //======================BESTSCORE1M====================
  Future<int?> getBestScore1m() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    var ourIntget = sharedPreference.getInt(Preferences.best_score_1m);
    return ourIntget;
  }

  Future<bool> saveBestScore1m(int value) async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    var ourIntsave =
        await sharedPreference.setInt(Preferences.best_score_1m, value);

    return ourIntsave;
  }

  //======================BESTSCORE5M====================
  Future<int?> getBestScore5m() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    var ourIntget = sharedPreference.getInt(Preferences.best_score_5m);
    return ourIntget;
  }

  Future<bool> saveBestScore5m(int value) async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    var ourIntsave =
        await sharedPreference.setInt(Preferences.best_score_5m, value);

    return ourIntsave;
  }

  SharedPreferenceHelper() {
    getSoundOn();
    getTrebleOn();
    getBassOn();
    getDurationPreferences();
    getScore();
    getBestScore20s();
    getBestScore1m();
    getBestScore5m();
  }
}
