import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shop_test/features/home/data/mapper/home_mapper.dart';
import '../../../../core/constants.dart';
import '../../../../core/storage/local/database/shared_preferences/app_settings_shared_preferences.dart';
import '../../../../core/widgets/helpers.dart';
import '../../presentation/model/home_model.dart';
import '../response/home_response.dart';

class HomeApiController with Helpers {
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

  Future get({
    required String endPoint,
    required Map<String, String> header,
  }) async {
    return await http.get(
      Uri.parse(endPoint),
      headers: header,
    );
  }

  Future<HomeModel> home({required BuildContext context}) async {
    http.Response response = await get(
      endPoint: ApiRequest.home,
      header: {},
    );

    int statusCode = response.statusCode;

    if (statusCode >= 200 && statusCode < 300) {
      var json = jsonDecode(response.body);

      return HomeResponse.fromJson(json).toDomain();
    } else if (statusCode >= 400 && statusCode < 500) {
      var json = jsonDecode(response.body);
      return HomeModel(
        data: [ ],
        success: json['success'],
        status: json['status'],
      );
    } else if (statusCode >= 500 && statusCode < 600) {
      return HomeModel(
        data: [],
        success: false,
        status: 500,
      );
    }

    showSnackBar(
      context: context,
      message: 'Something Went Error',
      error: true,
    );
    return HomeModel(
      data: [],
      success: false,
      status: 404,
    );
  }
}
