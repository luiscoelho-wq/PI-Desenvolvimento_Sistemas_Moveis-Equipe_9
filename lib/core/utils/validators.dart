class Validators {
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return "Email obrigatório";
    }

    final regex =
        RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!regex.hasMatch(value)) {
      return "Email inválido";
    }

    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return "Senha obrigatória";
    }

    if (value.length < 6) {
      return "Mínimo 6 caracteres";
    }

    return null;
  }

  static String? name(String? value) {
    if (value == null || value.isEmpty) {
      return "Nome obrigatório";
    }

    return null;
  }
}