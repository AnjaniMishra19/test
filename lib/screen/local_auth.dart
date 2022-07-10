import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuth {
  static final _auth = LocalAuthentication();

  static Future<bool> hasBiometrics() async {
    try {
      return await _auth.canCheckBiometrics;
    } on PlatformException {
      return false;
    }
  }

  static Future<List<BiometricType>> getBiometrics() async {
    try {
      return await _auth.getAvailableBiometrics();
    } on PlatformException {
      return <BiometricType>[];
    }
  }

  static Future<bool> authenticate() async {
    var localAuth = LocalAuthentication();
    bool didAuthenticate =
        await localAuth.authenticate(localizedReason: 'Please authenticate');
    final isAvailable = await hasBiometrics();
    // final biometrics = await LocalAuth.getBiometrics();
    if (!isAvailable && !didAuthenticate) {
      return false;
    } else if (didAuthenticate) {
      return true;
    } else if (!isAvailable) {
      return false;
    }
    try {
      return await _auth.authenticate(
          localizedReason: 'Scan FingerPrint to Authenticate',
          useErrorDialogs: true,
          biometricOnly: true,
          stickyAuth: true);
    } on PlatformException {
      return false;
    }
  }
}
