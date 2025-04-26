class UserModel {
  String? nom;
  String? prenom;
  String? email;
  String? password;
  String? passwordConfirmation;
  String? sexe;
  String? telephone;
  bool? donneur;

  UserModel({
    this.nom,
    this.prenom,
    this.email,
    this.password,
    this.passwordConfirmation,
    this.sexe,
    this.telephone,
    this.donneur,
  });
}
