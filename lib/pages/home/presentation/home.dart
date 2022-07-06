import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:vogon_chat/pages/home/home_store.dart';

final store = GetIt.I.get<HomeStore>();

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vogon chat'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) {
                return SimpleDialog(
                  children: [
                    const Text('Adicionar contato'),
                    TextFormField(
                      controller: store.adicionarContatosController,
                      decoration: InputDecoration(hintText: 'Nome do Contato'),
                    ),
                    ElevatedButton(onPressed: (() {
                      store.adicionarNovoContato();
                      Navigator.of(context).pop();
                    }), child: Text('Salvar'))
                  ],
                );
              });
        },
      ),
    );
  }
}
