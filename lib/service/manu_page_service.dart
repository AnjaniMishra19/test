import 'package:sahash/config/api_end_points.dart';
import 'package:sahash/models/table_model.dart';
import 'package:sahash/networking/api_helper.dart';
import 'package:sahash/storage/local_strorage_repository.dart';
import 'package:flutter/material.dart';
import '../constants/constants.dart';

class ManuPageService {
  LocalStorageRepository _localStorageRepository;
  ApiHelper _apiHelper;

  ManuPageService() {
    _localStorageRepository = LocalStorageRepository("selectedLanguage");
    _apiHelper = ApiHelper();
  }

  Future<Locale> setLocale(String languageCode) async {
    await _localStorageRepository.setValue(LAGUAGE_CODE, languageCode);
    return _locale(languageCode);
  }

  Future<Locale> getLocale() async {
    String languageCode =
        await _localStorageRepository.getValue(LAGUAGE_CODE) ?? "en";

    return _locale(languageCode);
  }

  Future<List<TableList>> getTable() async {
    dynamic queryParameters = {
      'patientid': 'p1',
    };
    final allListJson =
        await _apiHelper.get(ApiEndPoints.getTable, queryParameters) as List;
    return allListJson
        .map((doctorJson) => TableList.fromJson(doctorJson))
        .toList();
  }

  Future<void> setAuthentication(bool isAuthentication) async {
    await _localStorageRepository.setValue("selectedAuth", isAuthentication);
  }

  Future<bool> getAuthentication() async {
    var authValue =
        await _localStorageRepository.getValue("selectedAuth") ?? false;
    return authValue;
  }

  Locale _locale(String languageCode) {
    switch (languageCode) {
      case ENGLISH:
        return const Locale(ENGLISH, 'US');
      case HINDI:
        return const Locale(HINDI, "IN");
      case CHINESE:
        return const Locale(CHINESE, "CN");
      case SPANISH:
        return const Locale(SPANISH, "ES");
      case ARABIC:
        return const Locale(ARABIC, "DZ");
      case RUSSIAN:
        return const Locale(RUSSIAN, "RU");
      case JAPANESE:
        return const Locale(JAPANESE, "JP");
      case DEUTSCH:
        return const Locale(DEUTSCH, "DE");
      default:
        return const Locale(ENGLISH, 'US');
    }
  }
}
