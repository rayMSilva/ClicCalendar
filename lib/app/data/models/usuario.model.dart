class Usuario {
  int? codigo;
  String? name;
  String? email;
  String? userName;
  String? telefone;
  String? senha;
  String? tipoUsuario;
  String? dataCriacao;

  Usuario({
    this.codigo,
    this.name,
    this.email,
    this.userName,
    this.telefone,
    this.senha,
    this.tipoUsuario,
    this.dataCriacao,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      codigo: json['codigo'],
      name: json['name'],
      email: json['email'],
      userName: json['userName'],
      telefone: json['telefone'],
      senha: json['senha'],
      tipoUsuario: json['tipoUsuario'],
      dataCriacao: json['dataCriacao'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'codigo': codigo,
      'name': name,
      'email': email,
      'userName': userName,
      'telefone': telefone,
      'senha': senha,
      'tipoUsuario': tipoUsuario,
      'dataCriacao': dataCriacao,
    };
  }

  Map<String, dynamic> toJsonLogin() {
    return {
      'username': userName,
      'password': senha,
    };
  }
}
