import 'package:dokitamobile/app/data/user_model.dart';

class MedecinModel extends UserModel {
  String? numeroOrdre;
  String? numeroLicence;
  String? numeroSecuriteSociale;
  String? specialite;
  String? biographie;
  String? langues;
  int? anneeExperience;
  String? photo;

  MedecinModel({
    String? nom,
    String? prenom,
    String? email,
    String? password,
    String? passwordConfirmation,
    String? sexe,
    String? telephone,
    bool? donneur,
    this.numeroOrdre,
    this.numeroLicence,
    this.numeroSecuriteSociale,
    this.specialite,
    this.biographie,
    this.langues,
    this.anneeExperience,
    this.photo,
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
