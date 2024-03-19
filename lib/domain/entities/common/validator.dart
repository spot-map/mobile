abstract class TextValidators {
  static String? email(String email) {
    if (email.isEmpty) return "Email пуст";
    if (!RegExp(_Reg.email).hasMatch(email)) return "Неправильный email";
    return null;
  }

  static String? password(String password) {
    if (password.isEmpty) return 'Заполните поле';
    return null;
  }

  static String? name(String name) {
    if (name.isEmpty) return 'Заполните поле';
    return null;
  }

  static String? spotName(String name) {
    if (name.isEmpty) return 'Заполните поле';
    if (name.length < 10) return 'Название слишком короткое';
    return null;
  }

  static String? description(String name) {
    if (name.isEmpty) return 'Заполните поле';
    if (name.length < 10) return 'Описание слишком короткое';
    return null;
  }

  static String? address(String name) {
    if (name.isEmpty) return 'Заполните поле';
    if (name.length < 10) return 'Описание слишком короткое';
    return null;
  }
}

abstract class _Reg {
  static const String email =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
}
