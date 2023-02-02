// ignore_for_file: library_private_types_in_public_api, constant_identifier_names

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

import '../model/note_model.dart';
import '../service/INoteService.dart';
import '../service/note_service.dart';
part 'note_view_model.g.dart';

class NoteViewModel = _NoteViewModelBase with _$NoteViewModel;

abstract class _NoteViewModelBase with Store {
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
      noteIndex = Random().nextInt(items.length);
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
}

enum LifeState { IDLE, LOADING, DONE }
