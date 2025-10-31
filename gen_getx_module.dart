// ignore_for_file: avoid_print

import 'dart:io';


void gerarArquivo(String nome, String conteudo) {
  File(nome)
    ..createSync(recursive: true)
    ..writeAsStringSync(conteudo);
}

void main(List<String> arguments) {

  String nomeModulo = arguments[0];
  String caminho = './lib/app/modules/$nomeModulo';

  if (!Directory(caminho).existsSync()) {
    Directory(caminho).createSync(recursive: true);
  } else {
    print('O modulo $nomeModulo já existe!');
    
    return;
  }

  gerarArquivo('$caminho/binding.dart',
'''
import 'package:fitapp/app/modules/$nomeModulo/controller.dart';
import 'package:fitapp/app/modules/$nomeModulo/repository.dart';
import 'package:get/get.dart';

class ${nomeModulo[0].toUpperCase() + nomeModulo.substring(1)}Binding implements Bindings {

  // TODO: Adicionar dependências (Providers, API, etc)

  @override
  void dependencies() {
    Get.lazyPut<${nomeModulo[0].toUpperCase() + nomeModulo.substring(1)}Controller>(
      () => ${nomeModulo[0].toUpperCase() + nomeModulo.substring(1)}Controller(
        repository: ${nomeModulo[0].toUpperCase() + nomeModulo.substring(1)}Repository(),
      ),
    );
  }

}''');


  gerarArquivo('$caminho/controller.dart',
'''import 'package:get/get.dart';
import 'package:fitapp/app/modules/$nomeModulo/repository.dart';


class ${nomeModulo[0].toUpperCase() + nomeModulo.substring(1)}Controller extends GetxController {

  final ${nomeModulo[0].toUpperCase() + nomeModulo.substring(1)}Repository _repository;
  ${nomeModulo[0].toUpperCase() + nomeModulo.substring(1)}Controller({
    required ${nomeModulo[0].toUpperCase() + nomeModulo.substring(1)}Repository repository
  }) : _repository = repository;


}
''');


  gerarArquivo('$caminho/page.dart',
'''import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitapp/app/modules/$nomeModulo/controller.dart';


class ${nomeModulo[0].toUpperCase() + nomeModulo.substring(1)}Page extends GetView<${nomeModulo[0].toUpperCase() + nomeModulo.substring(1)}Controller> {

  const ${nomeModulo[0].toUpperCase() + nomeModulo.substring(1)}Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('MyPage'),
      ),
      body: const SafeArea(
        child: Text('MyController'),
      )
    );
  }
}''' );

  gerarArquivo('$caminho/repository.dart',
'''

abstract interface class I${nomeModulo[0].toUpperCase() + nomeModulo.substring(1)}Repository {

}

// TODO: Adicionar Providers
class ${nomeModulo[0].toUpperCase() + nomeModulo.substring(1)}Repository implements I${nomeModulo[0].toUpperCase() + nomeModulo.substring(1)}Repository {

  // final BaseProvider _baseProvider;

  ${nomeModulo[0].toUpperCase() + nomeModulo.substring(1)}Repository(
    //{ required BaseProvider baseProvider, }
  ); 

}''');

    print('Estrutura inicial do modulo $nomeModulo criada com sucesso!');

}
