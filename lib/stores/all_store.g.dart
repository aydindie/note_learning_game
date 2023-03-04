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

  late final _$isAltoOnAtom =
      Atom(name: '_AllStoreBase.isAltoOn', context: context);

  @override
  bool get isAltoOn {
    _$isAltoOnAtom.reportRead();
    return super.isAltoOn;
  }

  @override
  set isAltoOn(bool value) {
    _$isAltoOnAtom.reportWrite(value, super.isAltoOn, () {
      super.isAltoOn = value;
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

  late final _$fetchItemsAsyncAction =
      AsyncAction('_AllStoreBase.fetchItems', context: context);

  @override
  Future<void> fetchItems() {
    return _$fetchItemsAsyncAction.run(() => super.fetchItems());
  }

  late final _$_AllStoreBaseActionController =
      ActionController(name: '_AllStoreBase', context: context);

  @override
  void changeTreble() {
    final _$actionInfo = _$_AllStoreBaseActionController.startAction(
        name: '_AllStoreBase.changeTreble');
    try {
      return super.changeTreble();
    } finally {
      _$_AllStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeBass() {
    final _$actionInfo = _$_AllStoreBaseActionController.startAction(
        name: '_AllStoreBase.changeBass');
    try {
      return super.changeBass();
    } finally {
      _$_AllStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeAlto() {
    final _$actionInfo = _$_AllStoreBaseActionController.startAction(
        name: '_AllStoreBase.changeAlto');
    try {
      return super.changeAlto();
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
  void changeDurationPreferences(DurationPreferences durationPreferences) {
    final _$actionInfo = _$_AllStoreBaseActionController.startAction(
        name: '_AllStoreBase.changeDurationPreferences');
    try {
      return super.changeDurationPreferences(durationPreferences);
    } finally {
      _$_AllStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void scoreIncrement() {
    final _$actionInfo = _$_AllStoreBaseActionController.startAction(
        name: '_AllStoreBase.scoreIncrement');
    try {
      return super.scoreIncrement();
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
isTrebleOn: ${isTrebleOn},
isBassOn: ${isBassOn},
isAltoOn: ${isAltoOn},
languagePreferences: ${languagePreferences},
countDownController: ${countDownController},
noteNamesPreferences: ${noteNamesPreferences},
durationPreferences: ${durationPreferences},
items: ${items},
pageLifes: ${pageLifes},
noteIndex: ${noteIndex},
score: ${score},
defaultList: ${defaultList},
defaultDuration: ${defaultDuration},
itemCount: ${itemCount}
    ''';
  }
}
