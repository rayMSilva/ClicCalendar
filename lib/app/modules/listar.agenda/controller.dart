import 'package:get/get.dart';
import 'package:fitapp/app/modules/listar.agenda/repository.dart';

class ListarAgendaController extends GetxController {
  final ListarAgendaRepository _repository;
  ListarAgendaController({required ListarAgendaRepository repository}) : _repository = repository;
}
