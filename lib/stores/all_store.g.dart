// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AllStore on _AllStoreBase, Store {
  Computed<List<String>>? _$defaultListComputed;

  @override
  List<String> get defaultList =>
      (_$defaultListComputed ??= Computed<List<String>>(() => super.defaultList,
              name: '_AllStoreBase.defaultList'))
          .value;
  Computed<int>? _$defaultDurationComputed;

  @override
  int get defaultDuration =>
      (_$defaultDurationComputed ??= Computed<int>(() => super.defaultDuration,
              name: '_AllStoreBase.defaultDuration'))
          .value;
  Computed<int>? _$itemCountComputed;

  @override
  int get itemCount => (_$itemCountComputed ??=
          Computed<int>(() => super.itemCount, name: '_AllStoreBase.itemCount'))
      .value;

  late final _$isCounterStartedAtom =
      Atom(name: '_AllStoreBase.isCounterStarted', context: context);

  @override
  bool get isCounterStarted {
    _$isCounterStartedAtom.reportRead();
    return super.isCounterStarted;
  }

  @override
  set isCounterStarted(bool value) {
    _$isCounterStartedAtom.reportWrite(value, super.isCounterStarted, () {
      super.isCounterStarted = value;
    });
  }

  late final _$isCounterFinishedAtom =
      Atom(name: '_AllStoreBase.isCounterFinished', context: context);

  @override
  bool get isCounterFinished {
    _$isCounterFinishedAtom.reportRead();
    return super.isCounterFinished;
  }

  @override
  set isCounterFinished(bool value) {
    _$isCounterFinishedAtom.reportWrite(value, super.isCounterFinished, () {
      super.isCounterFinished = value;
    });
  }

  late final _$durationPreferencesAtom =
      Atom(name: '_AllStoreBase.durationPreferences', context: context);

  @override
  DurationPreferences get durationPreferences {
    _$durationPreferencesAtom.reportRead();
    return super.durationPreferences;
  }

  @override
  set durationPreferences(DurationPreferences value) {
    _$durationPreferencesAtom.reportWrite(value, super.durationPreferences, () {
      super.durationPreferences = value;
    });
  }

  late final _$isTrebleOnAtom =
      Atom(name: '_AllStoreBase.isTrebleOn', context: context);

  @override
  bool get isTrebleOn {
    _$isTrebleOnAtom.reportRead();
    return super.isTrebleOn;
  }

  @override
  set isTrebleOn(bool value) {
    _$isTrebleOnAtom.reportWrite(value, super.isTrebleOn, () {
      super.isTrebleOn = value;
    });
  }

  late final _$isBassOnAtom =
      Atom(name: '_AllStoreBase.isBassOn', context: context);

  @override
  bool get isBassOn {
    _$isBassOnAtom.reportRead();
    return super.isBassOn;
  }

  @override
  set isBassOn(bool value) {
    _$isBassOnAtom.reportWrite(value, super.isBassOn, () {
      super.isBassOn = value;
    });
  }

  late final _$languagePreferencesAtom =
      Atom(name: '_AllStoreBase.languagePreferences', context: context);

  @override
  LanguagePreferences get languagePreferences {
    _$languagePreferencesAtom.reportRead();
    return super.languagePreferences;
  }

  @override
  set languagePreferences(LanguagePreferences value) {
    _$languagePreferencesAtom.reportWrite(value, super.languagePreferences, () {
      super.languagePreferences = value;
    });
  }

  late final _$countDownControllerAtom =
      Atom(name: '_AllStoreBase.countDownController', context: context);

  @override
  CountDownController get countDownController {
    _$countDownControllerAtom.reportRead();
    return super.countDownController;
  }

  @override
  set countDownController(CountDownController value) {
    _$countDownControllerAtom.reportWrite(value, super.countDownController, () {
      super.countDownController = value;
    });
  }

  late final _$noteNamesPreferencesAtom =
      Atom(name: '_AllStoreBase.noteNamesPreferences', context: context);

  @override
  NoteNamesPreferences get noteNamesPreferences {
    _$noteNamesPreferencesAtom.reportRead();
    return super.noteNamesPreferences;
  }

  @override
  set noteNamesPreferences(NoteNamesPreferences value) {
    _$noteNamesPreferencesAtom.reportWrite(value, super.noteNamesPreferences,
        () {
      super.noteNamesPreferences = value;
    });
  }

  late final _$itemsAtom = Atom(name: '_AllStoreBase.items', context: context);

  @override
  List<NoteModel> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(List<NoteModel> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  late final _$pageLifesAtom =
      Atom(name: '_AllStoreBase.pageLifes', context: context);

  @override
  LifeState get pageLifes {
    _$pageLifesAtom.reportRead();
    return super.pageLifes;
  }

  @override
  set pageLifes(LifeState value) {
    _$pageLifesAtom.reportWrite(value, super.pageLifes, () {
      super.pageLifes = value;
    });
  }

  late final _$noteIndexAtom =
      Atom(name: '_AllStoreBase.noteIndex', context: context);

  @override
  int get noteIndex {
    _$noteIndexAtom.reportRead();
    return super.noteIndex;
  }

  @override
  set noteIndex(int value) {
    _$noteIndexAtom.reportWrite(value, super.noteIndex, () {
      super.noteIndex = value;
    });
  }

  late final _$scoreAtom = Atom(name: '_AllStoreBase.score', context: context);

  @override
  int get score {
    _$scoreAtom.reportRead();
    return super.score;
  }

  @override
  set score(int value) {
    _$scoreAtom.reportWrite(value, super.score, () {
      super.score = value;
    });
  }

  late final _$score20sAtom =
      Atom(name: '_AllStoreBase.score20s', context: context);

  @override
  int get score20s {
    _$score20sAtom.reportRead();
    return super.score20s;
  }

  @override
  set score20s(int value) {
    _$score20sAtom.reportWrite(value, super.score20s, () {
      super.score20s = value;
    });
  }

  late final _$best20sScoreAtom =
      Atom(name: '_AllStoreBase.best20sScore', context: context);

  @override
  int get best20sScore {
    _$best20sScoreAtom.reportRead();
    return super.best20sScore;
  }

  @override
  set best20sScore(int value) {
    _$best20sScoreAtom.reportWrite(value, super.best20sScore, () {
      super.best20sScore = value;
    });
  }

  late final _$score1mAtom =
      Atom(name: '_AllStoreBase.score1m', context: context);

  @override
  int get score1m {
    _$score1mAtom.reportRead();
    return super.score1m;
  }

  @override
  set score1m(int value) {
    _$score1mAtom.reportWrite(value, super.score1m, () {
      super.score1m = value;
    });
  }

  late final _$best1mScoreAtom =
      Atom(name: '_AllStoreBase.best1mScore', context: context);

  @override
  int get best1mScore {
    _$best1mScoreAtom.reportRead();
    return super.best1mScore;
  }

  @override
  set best1mScore(int value) {
    _$best1mScoreAtom.reportWrite(value, super.best1mScore, () {
      super.best1mScore = value;
    });
  }

  late final _$score5mAtom =
      Atom(name: '_AllStoreBase.score5m', context: context);

  @override
  int get score5m {
    _$score5mAtom.reportRead();
    return super.score5m;
  }

  @override
  set score5m(int value) {
    _$score5mAtom.reportWrite(value, super.score5m, () {
      super.score5m = value;
    });
  }

  late final _$best5mScoreAtom =
      Atom(name: '_AllStoreBase.best5mScore', context: context);

  @override
  int get best5mScore {
    _$best5mScoreAtom.reportRead();
    return super.best5mScore;
  }

  @override
  set best5mScore(int value) {
    _$best5mScoreAtom.reportWrite(value, super.best5mScore, () {
      super.best5mScore = value;
    });
  }

  late final _$changeDurationPreferencesAsyncAction =
      AsyncAction('_AllStoreBase.changeDurationPreferences', context: context);

  @override
  Future<void> changeDurationPreferences(
      DurationPreferences durationPreferences) {
    return _$changeDurationPreferencesAsyncAction
        .run(() => super.changeDurationPreferences(durationPreferences));
  }

  late final _$changeTrebleAsyncAction =
      AsyncAction('_AllStoreBase.changeTreble', context: context);

  @override
  Future<void> changeTreble() {
    return _$changeTrebleAsyncAction.run(() => super.changeTreble());
  }

  late final _$changeBassAsyncAction =
      AsyncAction('_AllStoreBase.changeBass', context: context);

  @override
  Future<void> changeBass() {
    return _$changeBassAsyncAction.run(() => super.changeBass());
  }

  late final _$changeScoreAsyncAction =
      AsyncAction('_AllStoreBase.changeScore', context: context);

  @override
  Future<void> changeScore() {
    return _$changeScoreAsyncAction.run(() => super.changeScore());
  }

  late final _$changeScore20sAsyncAction =
      AsyncAction('_AllStoreBase.changeScore20s', context: context);

  @override
  Future<void> changeScore20s() {
    return _$changeScore20sAsyncAction.run(() => super.changeScore20s());
  }

  late final _$changeScore1mAsyncAction =
      AsyncAction('_AllStoreBase.changeScore1m', context: context);

  @override
  Future<void> changeScore1m() {
    return _$changeScore1mAsyncAction.run(() => super.changeScore1m());
  }

  late final _$changeScore5mAsyncAction =
      AsyncAction('_AllStoreBase.changeScore5m', context: context);

  @override
  Future<void> changeScore5m() {
    return _$changeScore5mAsyncAction.run(() => super.changeScore5m());
  }

  late final _$fetchItemsAsyncAction =
      AsyncAction('_AllStoreBase.fetchItems', context: context);

  @override
  Future<void> fetchItems() {
    return _$fetchItemsAsyncAction.run(() => super.fetchItems());
  }

  late final _$_AllStoreBaseActionController =
      ActionController(name: '_AllStoreBase', context: context);

  @override
  void counterStarted() {
    final _$actionInfo = _$_AllStoreBaseActionController.startAction(
        name: '_AllStoreBase.counterStarted');
    try {
      return super.counterStarted();
    } finally {
      _$_AllStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void counterStopped() {
    final _$actionInfo = _$_AllStoreBaseActionController.startAction(
        name: '_AllStoreBase.counterStopped');
    try {
      return super.counterStopped();
    } finally {
      _$_AllStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void counterFinished() {
    final _$actionInfo = _$_AllStoreBaseActionController.startAction(
        name: '_AllStoreBase.counterFinished');
    try {
      return super.counterFinished();
    } finally {
      _$_AllStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void counterNotFinished() {
    final _$actionInfo = _$_AllStoreBaseActionController.startAction(
        name: '_AllStoreBase.counterNotFinished');
    try {
      return super.counterNotFinished();
    } finally {
      _$_AllStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void restartCountDown() {
    final _$actionInfo = _$_AllStoreBaseActionController.startAction(
        name: '_AllStoreBase.restartCountDown');
    try {
      return super.restartCountDown();
    } finally {
      _$_AllStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeLanguagePreferences(LanguagePreferences languagePreferences) {
    final _$actionInfo = _$_AllStoreBaseActionController.startAction(
        name: '_AllStoreBase.changeLanguagePreferences');
    try {
      return super.changeLanguagePreferences(languagePreferences);
    } finally {
      _$_AllStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeNoteNamesPreferences(NoteNamesPreferences noteNamesPreferences) {
    final _$actionInfo = _$_AllStoreBaseActionController.startAction(
        name: '_AllStoreBase.changeNoteNamesPreferences');
    try {
      return super.changeNoteNamesPreferences(noteNamesPreferences);
    } finally {
      _$_AllStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateRandomIndex() {
    final _$actionInfo = _$_AllStoreBaseActionController.startAction(
        name: '_AllStoreBase.updateRandomIndex');
    try {
      return super.updateRandomIndex();
    } finally {
      _$_AllStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setContext(BuildContext? context) {
    final _$actionInfo = _$_AllStoreBaseActionController.startAction(
        name: '_AllStoreBase.setContext');
    try {
      return super.setContext(context);
    } finally {
      _$_AllStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isCounterStarted: ${isCounterStarted},
isCounterFinished: ${isCounterFinished},
durationPreferences: ${durationPreferences},
isTrebleOn: ${isTrebleOn},
isBassOn: ${isBassOn},
languagePreferences: ${languagePreferences},
countDownController: ${countDownController},
noteNamesPreferences: ${noteNamesPreferences},
items: ${items},
pageLifes: ${pageLifes},
noteIndex: ${noteIndex},
score: ${score},
score20s: ${score20s},
best20sScore: ${best20sScore},
score1m: ${score1m},
best1mScore: ${best1mScore},
score5m: ${score5m},
best5mScore: ${best5mScore},
defaultList: ${defaultList},
defaultDuration: ${defaultDuration},
itemCount: ${itemCount}
    ''';
  }
}
