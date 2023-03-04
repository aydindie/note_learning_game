// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';

import '../data/sharedpref/shared_preference_helper.dart';
part 'sound_store.g.dart';

class SoundStore = _SoundStoreBase with _$SoundStore;

abstract class _SoundStoreBase with Store {
  @observable
  bool soundBool = true; //initial value

//get value from shared pref or set default value
  void getSoundFromShared() async {
    soundBool = await SharedPreferenceHelper().getSoundOn() ?? true;
  }

  @action
  Future<void> changeSound() async {
    soundBool = !soundBool;
    await SharedPreferenceHelper().saveSoundOn(soundBool);
  }

  @action
  _SoundStoreBase() {
    getSoundFromShared();
  }
}
