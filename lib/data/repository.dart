import 'dart:async';

import 'package:note_learning_game/data/sharedpref/shared_preference_helper.dart';

class Repository {
  // shared pref object
  final SharedPreferenceHelper _sharedPrefsHelper;

  // constructor
  Repository(this._sharedPrefsHelper);

  // Login:---------------------------------------------------------------------
  Future<bool> login(String email, String password) async {
    return await Future.delayed(const Duration(seconds: 2), () => true);
  }
}
