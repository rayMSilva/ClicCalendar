class UserColaborador {
  // TODO: usar JsonSerializable com Freezed para gerar as funções toJson, fromJson e toString, etc;
  // TODO: caso existir banco interno usar/criar BaseDao para generalizar as funções de CRUD;
  int id;
  String user;
  String password;

  UserColaborador({
    required this.id,
    required this.user,
    required this.password,
  });
}
