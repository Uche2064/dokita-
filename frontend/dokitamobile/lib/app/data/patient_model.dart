import 'package:dokitamobile/app/data/user_model.dart';

class PatientModel extends UserModel {
  String? adresse;

  PatientModel({
    String? nom,
    String? prenom,
    String? email,
    String? password,
    String? passwordConfirmation,
    String? sexe,
    String? telephone,
    bool? donneur,
    this.adresse,
  }) : super(
         nom: nom,
         prenom: prenom,
         email: email,
         password: password,
         passwordConfirmation: passwordConfirmation,
         sexe: sexe,
         telephone: telephone,
         donneur: donneur,
       );
}
