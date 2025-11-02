import 'package:get/get.dart';
import 'package:fitapp/app/modules/novo.horario/repository.dart';

class NovoHorarioController extends GetxController {
  final NovoHorarioRepository _repository;
  NovoHorarioController({required NovoHorarioRepository repository}) : _repository = repository;
}
