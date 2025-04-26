import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

class Validators {
  Validators._();

  static String? validateNotEmpty(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Ce champ est requis';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Mot de passe requis';
    } else if (value.length < 8) {
      return 'Le mot de passe doit contenir au moins 8 caractères';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Veuillez entrer votre adresse e-mail';
    }

    if (!GetUtils.isEmail(value)) {
      return 'Adresse e-mail invalide';
    }

    return null;
  }
}
