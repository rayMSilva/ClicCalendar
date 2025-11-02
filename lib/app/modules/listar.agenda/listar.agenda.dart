import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitapp/app/modules/listar.agenda/controller.dart';

class ListarAgendaPage extends GetView<ListarAgendaController> {
  const ListarAgendaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('MyPage'),
        ),
        body: const SafeArea(
          child: Text('MyController'),
        ));
  }
}
