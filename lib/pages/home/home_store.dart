import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:vogon_chat/app_store.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final appStore = GetIt.I.get<AppStore>();

  @observable 
  ObservableList<String> contatos = ObservableList<String>();

  TextEditingController  adicionarContatosController = TextEditingController(text:'');

  @action
  void adicionarNovoContato() {
    var nome = adicionarContatosController.text;
    contatos.add(nome);
    appStore.contato = nome;
  }
    
}