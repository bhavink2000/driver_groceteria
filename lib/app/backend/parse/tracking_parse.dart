/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Ultimate Grocery Full App Flutter
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2024-present initappz.
*/
import 'package:driver/app/backend/api/api.dart';
import 'package:driver/app/helper/shared_pref.dart';
import 'package:driver/app/util/constant.dart';
import 'package:get/get.dart';

class TrackingParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  TrackingParser({required this.sharedPreferencesManager, required this.apiService});

  String getCurrencySide() {
    return sharedPreferencesManager.getString('currencySide') ?? AppConstants.defaultCurrencySide;
  }

  String getUID() {
    return sharedPreferencesManager.getString('uid') ?? '';
  }

  String getCurrencySymbol() {
    return sharedPreferencesManager.getString('currencySymbol') ?? AppConstants.defaultCurrencySymbol;
  }

  Future<Response> updateDriver(var param) async {
    return await apiService.postPrivate(AppConstants.updateDriverStatus, param, sharedPreferencesManager.getString('token') ?? '');
  }
}
