import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shop_test/features/auth/data/mapper/login_mapper.dart';
import '../../../../core/constants.dart';
import '../../../../core/storage/local/database/shared_preferences/app_settings_shared_preferences.dart';
import '../../../../core/widgets/helpers.dart';
import '../../presentation/model/login_model.dart';
import '../response/login_response.dart';

class AuthApiController with Helpers {
  AppSettingsSharedPreferences appSettingsSharedPreferences =
  AppSettingsSharedPreferences();

  Future post({
    required String endPoint,
    required Map<String, dynamic> body,
    required Map<String, String> header,
  }) async {
    return await http.post(
      Uri.parse(endPoint),
      body: body,
      headers: header,
    );
  }

  Future<bool> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    http.Response response = await post(
      endPoint: ApiRequest.login,
      body: {ApiConstants.email: email, ApiConstants.password: password},
      header: {
        ApiConstants.acceptLanguage: appSettingsSharedPreferences.defaultLocale,
      },
    );

    var json = jsonDecode(response.body);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      LoginResponse loginResponse = LoginResponse.fromJson(json);
      LoginModel loginModel = loginResponse.toDomain();
      appSettingsSharedPreferences.setToken(loginModel.accessToken);
      appSettingsSharedPreferences.saveUserInfo(loginModel.user);
      appSettingsSharedPreferences.setLoggedIn();
      return true;
    }

    showSnackBar(
      context: context,
      message: json[ApiConstants.errorMessage] ?? 'Error',
      error: true,
    );
    return false;
  }

  Future<bool> register({
    required String email,
    required String password,
    required String confirmPassword,
    required String name,
    required String phone,
    required BuildContext context,
  }) async {
    Response response = await post(
      endPoint: ApiRequest.register,
      body: {
        ApiConstants.email: email,
        ApiConstants.password: password,
        ApiConstants.confirmPassword: confirmPassword,
        ApiConstants.authName: name,
        ApiConstants.phone: phone,
        ApiConstants.registerBy: 'email',
      },
      header: {},
    );

    var json = jsonDecode(response.body);

    print(json);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return true;
    }

    showSnackBar(
      context: context,
      message: json[ApiConstants.errorMessage] ?? 'Error',
      error: true,
    );
    return false;
  }
}
