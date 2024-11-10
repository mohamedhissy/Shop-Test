import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../config/locale/locale_settings.dart';
import '../../../../core/storage/local/database/shared_preferences/app_settings_shared_preferences.dart';

class LocaleNotifierController extends GetxController {
  final AppSettingsSharedPreferences appSettingsSharedPreferences =
      AppSettingsSharedPreferences();
  final languagesList = LocaleSettings.languages;
  var selectedValue = 1.obs; // Make it observable to reactively update UI


  String get currentLanguage => appSettingsSharedPreferences.defaultLocale;

  Future<void> changeLanguage(
      {required BuildContext context, required String languageCode}) async {
    appSettingsSharedPreferences.setDefaultLocale(languageCode);
    EasyLocalization.of(context)!.setLocale(
      Locale(
        languageCode,
      ),
    );
    Get.updateLocale(Locale(languageCode));
    update();
  }
  @override
  void onInit() {
    super.onInit();
    _initializePreferences(); // Initialize preferences when the controller is created
  }

  Future<void> _initializePreferences() async {
    await appSettingsSharedPreferences.initPreferences();
    selectedValue.value = appSettingsSharedPreferences.selectedValue; // Load saved selection
  }
  void saveSelectedValue(int value) {
    selectedValue.value = value;
    appSettingsSharedPreferences.saveSelectedValue(value); // Save to shared preferences
  }
}
