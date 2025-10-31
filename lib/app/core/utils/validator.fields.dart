import 'package:dart_date/dart_date.dart';
import 'package:intl/intl.dart';

class FieldValidator {
  static String? validateIfEmpty(value) => value.isEmpty || value == null ? 'Campo obrigatório' : null;

  static String? validateDropDown(value) => value == null ? 'Campo obrigatório' : null;

  static String? validateCPF(String value) {
    if (value.isEmpty) {
      return validateIfEmpty(value);
    } else if (RegExp(r'^\d{3}\.\d{3}\.\d{3}-\d{2}$').hasMatch(value) == false) {
      return 'Formato Inválido';
    } else {
      // Remove os caracteres especiais do CPF
      final cleanedCPF = value.replaceAll(RegExp(r'[^0-9]'), '');

      // Verifica se todos os dígitos são iguais (CPF inválido)
      if (cleanedCPF.split('').toSet().length == 1) {
        return 'CPF Inválido';
      }

      // Validação por pesos
      List<int> cpfDigits = cleanedCPF.split('').map(int.parse).toList();
      int verificationDigit1 = cpfDigits[9];
      int verificationDigit2 = cpfDigits[10];

      int sum = 0;
      for (int i = 0; i < 9; i++) {
        sum += cpfDigits[i] * (10 - i);
      }

      int remainder = sum % 11;
      int calculatedDigit1 = (remainder < 2) ? 0 : 11 - remainder;

      if (calculatedDigit1 != verificationDigit1) {
        return 'CPF Inválido';
      }

      sum = 0;
      for (int i = 0; i < 10; i++) {
        sum += cpfDigits[i] * (11 - i);
      }

      remainder = sum % 11;
      int calculatedDigit2 = (remainder < 2) ? 0 : 11 - remainder;

      if (calculatedDigit2 != verificationDigit2) {
        return 'CPF Inválido';
      }
    }
    return null;
  }

  static String? validatePhone(value) {
    if (value.isEmpty) {
      return validateIfEmpty(value);
    } else if (!(RegExp(r'^\([0-9]{2}\) [0-9]{4}-[0-9]{4}$').hasMatch(value) || RegExp(r'^\([0-9]{2}\) [0-9]{5}-[0-9]{4}$').hasMatch(value))) {
      return 'Formato Inválido';
    }
    return null;
  }

  static String? validateCNPJ(String value) {
    if (value.isEmpty) {
      return validateIfEmpty(value);
    } else if (RegExp(r'^\d{2}\.\d{3}\.\d{3}\/\d{4}-\d{2}$').hasMatch(value) == false) {
      return 'Formato Inválido';
    } else {
      // Remove os caracteres especiais do CNPJ
      final cleanedCNPJ = value.replaceAll(RegExp(r'[^0-9]'), '');

      // Verifica se todos os dígitos são iguais (CNPJ inválido)
      if (cleanedCNPJ.split('').toSet().length == 1) {
        return 'CNPJ Inválido';
      }

      // Validação do dígito verificador
      List<int> cnpjDigits = cleanedCNPJ.split('').map(int.parse).toList();
      int verificationDigit1 = cnpjDigits[12];
      int verificationDigit2 = cnpjDigits[13];

      int sum = 0;
      int weight = 5;
      for (int i = 0; i < 12; i++) {
        sum += cnpjDigits[i] * weight;
        weight = (weight == 2) ? 9 : weight - 1;
      }

      int remainder = sum % 11;
      int calculatedDigit1 = (remainder < 2) ? 0 : 11 - remainder;

      if (calculatedDigit1 != verificationDigit1) {
        return 'CNPJ Inválido';
      }

      sum = 0;
      weight = 6;
      for (int i = 0; i < 13; i++) {
        sum += cnpjDigits[i] * weight;
        weight = (weight == 2) ? 9 : weight - 1;
      }

      remainder = sum % 11;
      int calculatedDigit2 = (remainder < 2) ? 0 : 11 - remainder;

      if (calculatedDigit2 != verificationDigit2) {
        return 'CNPJ Inválido';
      }
    }

    return null;
  }

  static String? validateCep(value) {
    if (value.isEmpty) {
      return validateIfEmpty(value);
    } else if (RegExp('[0-9]{5}[-][0-9]{3}').hasMatch(value) == false) {
      return 'Formato Inválido';
    }
    return null;
  }

  static String? validateEmail(value) {
    if (value.isEmpty) {
      return 'Campo obrigatório.';
    } else if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value) == false) {
      return 'Formato inválido.';
    }
    return null;
  }

  static String? validateCpfCnpj(value) {
    // Veririca se o campo não está vazio
    if (value.isEmpty) {
      return 'Campo obrigatório';
      // Verifica se o valor preenchido é no formato de CPF ou CNPJ
    } else if (RegExp('([0-9]{2}[.]?[0-9]{3}[.]?[0-9]{3}[/]?[0-9]{4}[-]?[0-9]{2})|([0-9]{3}[.]?[0-9]{3}[.]?[0-9]{3}[-]?[0-9]{2})').hasMatch(value) == false) {
      return 'Formato Inválido';
      // Verifica se é CPF ou CNPJ
    } else if (RegExp('([0-9]{3}[.]?[0-9]{3}[.]?[0-9]{3}[-]?[0-9]{2})').hasMatch(value) == true) {
      return validateCPF(value);
    } else if (RegExp('([0-9]{2}[.]?[0-9]{3}[.]?[0-9]{3}[/]?[0-9]{4}[-]?[0-9]{2})').hasMatch(value) == true) {
      return validateCNPJ(value);
    }
    return null;
  }

  static String? validatePassword(value) {
    if (value.isEmpty) {
      return 'Campo obrigatório';
    } else if (value.length < 7) {
      return 'Mínimo de 7 caracteres';
    } else if (RegExp('^(?=.*[0-9])').hasMatch(value) == false) {
      return 'A senha deve conter um número';
    } else if (RegExp('(?=.*[A-Z])').hasMatch(value) == false) {
      return 'A senha deve conter um caractere maiúsculo';
    }
    return null;
  }

  static String? confirmPasswordSignup(password, confirmPassword) {
    if (confirmPassword.isEmpty) {
      return 'Campo obrigatório';
    } else if (confirmPassword != password) {
      return 'As senhas precisam ser iguais!';
    }
    return null;
  }

  static String? confirmPassword(passwordField, value) {
    if (value.isEmpty) {
      return 'Campo obrigatório';
    } else if (value != passwordField) {
      return 'As senhas precisam ser iguais!';
    }
    return null;
  }

  static String? dateField(value) {
    try {
      var dateFormatted = DateFormat('dd/MM/yyyy').parse(value);
      if (value.isEmpty) {
        return 'Campo obrigatório';
      } else if (dateFormatted.isPast && !dateFormatted.isToday) {
        return 'Data Inválida';
      }
    } catch (err) {
      return 'Formato Inválido';
    }
    return null;
  }

  static String? validateIE(value) {
    if (value.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }
}
