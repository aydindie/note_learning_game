// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NoteViewModel on _NoteViewModelBase, Store {
  Computed<List<String>>? _$defaultListComputed;

  @override
  List<String> get defaultList =>
      (_$defaultListComputed ??= Computed<List<String>>(() => super.defaultList,
              name: '_NoteViewModelBase.defaultList'))
          .value;
  Computed<int>? _$itemCountComputed;

  @override
  int get itemCount =>
      (_$itemCountComputed ??= Computed<int>(() => super.itemCount,
              name: '_NoteViewModelBase.itemCount'))
          .value;

  late final _$isSoundOnAtom =
      Atom(name: '_NoteViewModelBase.isSoundOn', context: context);

  @override
  bool get isSoundOn {
    _$isSoundOnAtom.reportRead();
    return super.isSoundOn;
  }

  @override
  set isSoundOn(bool value) {
    _$isSoundOnAtom.reportWrite(value, super.isSoundOn, () {
      super.isSoundOn = value;
    });
  }

  late final _$isDarkModeAtom =
      Atom(name: '_NoteViewModelBase.isDarkMode', context: context);

  @override
  bool get isDarkMode {
    _$isDarkModeAtom.reportRead();
    return super.isDarkMode;
  }

  @override
  set isDarkMode(bool value) {
    _$isDarkModeAtom.reportWrite(value, super.isDarkMode, () {
      super.isDarkMode = value;
    });
  }

  late final _$isTrebleOnAtom =
      Atom(name: '_NoteViewModelBase.isTrebleOn', context: context);

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
      Atom(name: '_NoteViewModelBase.isBassOn', context: context);

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
      Atom(name: '_NoteViewModelBase.isAltoOn', context: context);

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

  late final _$noteNamesPreferencesAtom =
      Atom(name: '_NoteViewModelBase.noteNamesPreferences', context: context);

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

  late final _$itemsAtom =
      Atom(name: '_NoteViewModelBase.items', context: context);

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
      Atom(name: '_NoteViewModelBase.pageLifes', context: context);

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
      Atom(name: '_NoteViewModelBase.noteIndex', context: context);

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

  late final _$scoreAtom =
      Atom(name: '_NoteViewModelBase.score', context: context);

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
      AsyncAction('_NoteViewModelBase.fetchItems', context: context);

  @override
  Future<void> fetchItems() {
    return _$fetchItemsAsyncAction.run(() => super.fetchItems());
  }

  late final _$_NoteViewModelBaseActionController =
      ActionController(name: '_NoteViewModelBase', context: context);

  @override
  void changeSound() {
    final _$actionInfo = _$_NoteViewModelBaseActionController.startAction(
        name: '_NoteViewModelBase.changeSound');
    try {
      return super.changeSound();
    } finally {
      _$_NoteViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeTheme() {
    final _$actionInfo = _$_NoteViewModelBaseActionController.startAction(
        name: '_NoteViewModelBase.changeTheme');
    try {
      return super.changeTheme();
    } finally {
      _$_NoteViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeTreble() {
    final _$actionInfo = _$_NoteViewModelBaseActionController.startAction(
        name: '_NoteViewModelBase.changeTreble');
    try {
      return super.changeTreble();
    } finally {
      _$_NoteViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeBass() {
    final _$actionInfo = _$_NoteViewModelBaseActionController.startAction(
        name: '_NoteViewModelBase.changeBass');
    try {
      return super.changeBass();
    } finally {
      _$_NoteViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeAlto() {
    final _$actionInfo = _$_NoteViewModelBaseActionController.startAction(
        name: '_NoteViewModelBase.changeAlto');
    try {
      return super.changeAlto();
    } finally {
      _$_NoteViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeNoteNamesPreferences(NoteNamesPreferences noteNamesPreferences) {
    final _$actionInfo = _$_NoteViewModelBaseActionController.startAction(
        name: '_NoteViewModelBase.changeNoteNamesPreferences');
    try {
      return super.changeNoteNamesPreferences(noteNamesPreferences);
    } finally {
      _$_NoteViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void scoreIncrement() {
    final _$actionInfo = _$_NoteViewModelBaseActionController.startAction(
        name: '_NoteViewModelBase.scoreIncrement');
    try {
      return super.scoreIncrement();
    } finally {
      _$_NoteViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateRandomIndex() {
    final _$actionInfo = _$_NoteViewModelBaseActionController.startAction(
        name: '_NoteViewModelBase.updateRandomIndex');
    try {
      return super.updateRandomIndex();
    } finally {
      _$_NoteViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setContext(BuildContext? context) {
    final _$actionInfo = _$_NoteViewModelBaseActionController.startAction(
        name: '_NoteViewModelBase.setContext');
    try {
      return super.setContext(context);
    } finally {
      _$_NoteViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isSoundOn: ${isSoundOn},
isDarkMode: ${isDarkMode},
isTrebleOn: ${isTrebleOn},
isBassOn: ${isBassOn},
isAltoOn: ${isAltoOn},
noteNamesPreferences: ${noteNamesPreferences},
items: ${items},
pageLifes: ${pageLifes},
noteIndex: ${noteIndex},
score: ${score},
defaultList: ${defaultList},
itemCount: ${itemCount}
    ''';
  }
}
