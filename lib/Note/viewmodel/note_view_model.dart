import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:note_learning_game/Note/model/note_model.dart';
import 'package:note_learning_game/Note/service/INoteService.dart';

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
    if (items.isNotEmpty) {
      noteIndex = Random().nextInt(items.length);
      print("noteIndex: $noteIndex");
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
