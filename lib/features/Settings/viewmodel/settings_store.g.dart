// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SettingsViewModel on _SettingsViewModelBase, Store {
  late final _$isSoundOnAtom =
      Atom(name: '_SettingsViewModelBase.isSoundOn', context: context);

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
      Atom(name: '_SettingsViewModelBase.isDarkMode', context: context);

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
      Atom(name: '_SettingsViewModelBase.isTrebleOn', context: context);

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
      Atom(name: '_SettingsViewModelBase.isBassOn', context: context);

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
      Atom(name: '_SettingsViewModelBase.isAltoOn', context: context);

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

  late final _$noteNamesPreferencesAtom = Atom(
      name: '_SettingsViewModelBase.noteNamesPreferences', context: context);

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

  late final _$_SettingsViewModelBaseActionController =
      ActionController(name: '_SettingsViewModelBase', context: context);

  @override
  void changeSound() {
    final _$actionInfo = _$_SettingsViewModelBaseActionController.startAction(
        name: '_SettingsViewModelBase.changeSound');
    try {
      return super.changeSound();
    } finally {
      _$_SettingsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeTheme() {
    final _$actionInfo = _$_SettingsViewModelBaseActionController.startAction(
        name: '_SettingsViewModelBase.changeTheme');
    try {
      return super.changeTheme();
    } finally {
      _$_SettingsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeTreble() {
    final _$actionInfo = _$_SettingsViewModelBaseActionController.startAction(
        name: '_SettingsViewModelBase.changeTreble');
    try {
      return super.changeTreble();
    } finally {
      _$_SettingsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeBass() {
    final _$actionInfo = _$_SettingsViewModelBaseActionController.startAction(
        name: '_SettingsViewModelBase.changeBass');
    try {
      return super.changeBass();
    } finally {
      _$_SettingsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeAlto() {
    final _$actionInfo = _$_SettingsViewModelBaseActionController.startAction(
        name: '_SettingsViewModelBase.changeAlto');
    try {
      return super.changeAlto();
    } finally {
      _$_SettingsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeNoteNamesPreferences(NoteNamesPreferences noteNamesPreferences) {
    final _$actionInfo = _$_SettingsViewModelBaseActionController.startAction(
        name: '_SettingsViewModelBase.changeNoteNamesPreferences');
    try {
      return super.changeNoteNamesPreferences(noteNamesPreferences);
    } finally {
      _$_SettingsViewModelBaseActionController.endAction(_$actionInfo);
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
noteNamesPreferences: ${noteNamesPreferences}
    ''';
  }
}
