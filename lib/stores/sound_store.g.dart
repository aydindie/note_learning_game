// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sound_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SoundStore on _SoundStoreBase, Store {
  late final _$soundBoolAtom =
      Atom(name: '_SoundStoreBase.soundBool', context: context);

  @override
  bool get soundBool {
    _$soundBoolAtom.reportRead();
    return super.soundBool;
  }

  @override
  set soundBool(bool value) {
    _$soundBoolAtom.reportWrite(value, super.soundBool, () {
      super.soundBool = value;
    });
  }

  late final _$changeSoundAsyncAction =
      AsyncAction('_SoundStoreBase.changeSound', context: context);

  @override
  Future<void> changeSound() {
    return _$changeSoundAsyncAction.run(() => super.changeSound());
  }

  @override
  String toString() {
    return '''
soundBool: ${soundBool}
    ''';
  }
}
