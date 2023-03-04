import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

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

  SharedPreferenceHelper() {
    getSoundOn();
  }
}
