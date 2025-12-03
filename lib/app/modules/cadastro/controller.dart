import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitapp/app/modules/cadastro/repository.dart';

class CadastroController extends GetxController {
  final CadastroRepository _repository;
  CadastroController({
    required CadastroRepository repository,
  }) : _repository = repository;

  final loginFormKey = GlobalKey<FormState>();

  Rx<TextEditingController> userTextController = TextEditingController().obs;
  Rx<FocusNode> userFocusNode = FocusNode().obs;

  Rx<TextEditingController> passwordTextController = TextEditingController().obs;
  Rx<FocusNode> passwordFocusNode = FocusNode().obs;

  Rx<TextEditingController> nomeTextController = TextEditingController().obs;
  Rx<FocusNode> nomeFocusNode = FocusNode().obs;

  Rx<TextEditingController> emailTextController = TextEditingController().obs;
  Rx<FocusNode> emailFocusNode = FocusNode().obs;

  Rx<TextEditingController> telefoneTextController = TextEditingController().obs;
  Rx<FocusNode> telefoneFocusNode = FocusNode().obs;

  Rx<TextEditingController> permissaoTextController = TextEditingController().obs;
  Rx<FocusNode> permissaoFocusNode = FocusNode().obs;
}
