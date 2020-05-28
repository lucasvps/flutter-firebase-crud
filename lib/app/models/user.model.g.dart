// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserModel on _UserModelBase, Store {
  final _$emailAtom = Atom(name: '_UserModelBase.email');

  @override
  String get email {
    _$emailAtom.context.enforceReadPolicy(_$emailAtom);
    _$emailAtom.reportObserved();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.context.conditionallyRunInAction(() {
      super.email = value;
      _$emailAtom.reportChanged();
    }, _$emailAtom, name: '${_$emailAtom.name}_set');
  }

  final _$nomeAtom = Atom(name: '_UserModelBase.nome');

  @override
  String get nome {
    _$nomeAtom.context.enforceReadPolicy(_$nomeAtom);
    _$nomeAtom.reportObserved();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.context.conditionallyRunInAction(() {
      super.nome = value;
      _$nomeAtom.reportChanged();
    }, _$nomeAtom, name: '${_$nomeAtom.name}_set');
  }

  final _$_UserModelBaseActionController =
      ActionController(name: '_UserModelBase');

  @override
  dynamic setEmail(String value) {
    final _$actionInfo = _$_UserModelBaseActionController.startAction();
    try {
      return super.setEmail(value);
    } finally {
      _$_UserModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setNome(String value) {
    final _$actionInfo = _$_UserModelBaseActionController.startAction();
    try {
      return super.setNome(value);
    } finally {
      _$_UserModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'email: ${email.toString()},nome: ${nome.toString()}';
    return '{$string}';
  }
}
