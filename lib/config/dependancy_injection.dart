import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_test/core/storage/local/database/shared_preferences/app_settings_shared_preferences.dart';
import 'package:shop_test/features/home/presentation/controller/home_controller.dart';
import 'package:shop_test/features/settings/presentation/controller/theme_controller.dart';

import '../features/auth/presentation/controller/auth_controller.dart';
import '../features/settings/presentation/controller/locale_notifier_controller.dart';
import '../features/splash/presentaion/controller/splash_controller.dart';

initModule() async{
  WidgetsFlutterBinding.ensureInitialized();
  await AppSettingsSharedPreferences().initPreferences();
}

initSplash() {
  Get.put<SplashController>(SplashController());
}

disposeSplash() {
  Get.delete<SplashController>();
}

initAuth() {
  disposeSplash();
  Get.put<AuthController>(AuthController());
}

disposeAuth() {
  Get.delete<AuthController>();
}

initHome() {
  Get.put<HomeController>(HomeController());
  Get.put<ThemeController>(ThemeController());
  Get.put<LocaleNotifierController>(LocaleNotifierController());
  disposeSplash();
  disposeAuth();
}

disposeHome() {

}

initSetting() {
  disposeSplash();
  Get.put<LocaleNotifierController>(LocaleNotifierController());
  Get.put<ThemeController>(ThemeController());
}

disposeSetting() {
}




