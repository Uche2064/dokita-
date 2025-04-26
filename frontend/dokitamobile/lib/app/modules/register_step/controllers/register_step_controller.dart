import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:dokitamobile/app/data/medecin_model.dart';
import 'package:dokitamobile/app/data/patient_model.dart';
import 'package:dokitamobile/app/services/storage_service.dart';

class RegisterStepController extends GetxController {
  RxInt currentStep = 0.obs;
  bool isMedecin = StorageService.isMedecin();

  // Les modèles de données
  final PatientModel patient = PatientModel();
  final MedecinModel medecin = MedecinModel();

  //CONTROLLER POUR PATIENT
  final TextEditingController adresseController = TextEditingController();

  // CONTROLLERS POUR MÉDECIN
  final TextEditingController numeroOrdreController = TextEditingController();
  final TextEditingController numeroLicenceController = TextEditingController();
  final TextEditingController numeroSecuriteSocialeController =
      TextEditingController();
  final TextEditingController specialiteController = TextEditingController();
  final TextEditingController biographieController = TextEditingController();
  final TextEditingController languesController = TextEditingController();
  final TextEditingController anneeExperienceController =
      TextEditingController();

  void nextStep() {
    print(currentStep.value);
    if (currentStep.value < totalSteps - 1) {
      currentStep.value++;
    } else {
      submitRegistration();
    }
  }

  void previousStep() {
    if (currentStep.value > 0) {
      currentStep.value--;
    }
  }

  int get totalSteps => isMedecin ? 3 : 2;

  void submitRegistration() {
    if (isMedecin) {
      // Appeler l'API pour enregistrer un médecin
    } else {
      // Appeler l'API pour enregistrer un patient
    }
  }
}
