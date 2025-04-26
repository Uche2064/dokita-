import 'package:dokitamobile/app/translations/en.dart';
import 'package:dokitamobile/app/translations/fr.dart';
import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'fr_FR': fr,
    'en_US': en,
  };
}
