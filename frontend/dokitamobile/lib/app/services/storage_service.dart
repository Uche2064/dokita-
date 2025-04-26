import 'package:get_storage/get_storage.dart';

class StorageService {
  static final GetStorage _box = GetStorage();

  static const String _firstLaunchKey = 'isFirstLaunch';
  static const String _profileCompletedKey = 'profileCompleted';
  static const String _patient = 'patient';
  static const String _medecin = 'medecin';
  static const String _userRole = "userRole";

  static bool isFirstLaunch() => _box.read(_firstLaunchKey) ?? true;

  static void setFirstLaunchDone() => _box.write(_firstLaunchKey, false);

  static bool isProfileCompleted() => _box.read(_profileCompletedKey) ?? false;
  static void setProfileCompletedTrue() =>
      _box.write(_profileCompletedKey, true);

  static void setUserRole({required String role}) =>
      _box.write(_userRole, role);

  static bool isMedecin() {
    if (_box.read(_userRole) != null && _box.read(_userRole) == _medecin) {
      return true;
    } else {
      return false;
    }
  }
}
