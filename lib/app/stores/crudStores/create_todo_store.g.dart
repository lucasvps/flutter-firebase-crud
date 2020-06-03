// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_todo_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateTodoStore on _CreateTodoStoreBase, Store {
  final _$titleAtom = Atom(name: '_CreateTodoStoreBase.title');

  @override
  String get title {
    _$titleAtom.context.enforceReadPolicy(_$titleAtom);
    _$titleAtom.reportObserved();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.context.conditionallyRunInAction(() {
      super.title = value;
      _$titleAtom.reportChanged();
    }, _$titleAtom, name: '${_$titleAtom.name}_set');
  }

  final _$_CreateTodoStoreBaseActionController =
      ActionController(name: '_CreateTodoStoreBase');

  @override
  dynamic setTitle(String value) {
    final _$actionInfo = _$_CreateTodoStoreBaseActionController.startAction();
    try {
      return super.setTitle(value);
    } finally {
      _$_CreateTodoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'title: ${title.toString()}';
    return '{$string}';
  }
}
