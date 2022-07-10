import 'package:sahash/networking/api_helper.dart';
import 'package:sahash/storage/local_strorage_repository.dart';

class RegistrationService {
  ApiHelper apiHelper;
  LocalStorageRepository _localStorageRegistration;

  RegistrationService() {
    apiHelper = ApiHelper();
    _localStorageRegistration = LocalStorageRepository("register");
  }

  Future<void> setLocalRegistration(var data) async {
    await _localStorageRegistration.setValue("register", data);
  }

  Future<dynamic> getLocalRegistration() async {
    return _localStorageRegistration.getValue("register");
  }
}
