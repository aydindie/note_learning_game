// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NoteViewModel on _NoteViewModelBase, Store {
  Computed<int>? _$itemCountComputed;

  @override
  int get itemCount =>
      (_$itemCountComputed ??= Computed<int>(() => super.itemCount,
              name: '_NoteViewModelBase.itemCount'))
          .value;

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
items: ${items},
pageLifes: ${pageLifes},
noteIndex: ${noteIndex},
score: ${score},
itemCount: ${itemCount}
    ''';
  }
}
