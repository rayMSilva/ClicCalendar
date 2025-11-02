import 'package:fitapp/app/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitapp/app/modules/dashboard/repository.dart';

class DashboardController extends GetxController {
  final DashboardRepository _repository;
  DashboardController({required DashboardRepository repository}) : _repository = repository;

  final List<Map<String, dynamic>> cards = [
    {
      "titulo": "novo horário",
      "icone": Icons.add,
      "page": Routes.novoHorario,
    },
    {
      "titulo": "listar agendas",
      "icone": Icons.list_alt,
      "page": Routes.listarAgendas,
    },
    {
      "titulo": "pesquisas",
      "icone": Icons.search,
      "page": Routes.pesquisas,
    },
    {
      "titulo": "cadastro",
      "icone": Icons.person,
      "page": Routes.cadastro,
    },
    {
      "titulo": "métricas",
      "icone": Icons.analytics_outlined,
      "page": Routes.metricas,
    },
    {
      "titulo": "sincronização",
      "icone": Icons.restore_sharp,
      "page": Routes.sincronizacao,
    },
  ];
}
