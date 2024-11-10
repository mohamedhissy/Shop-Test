import 'package:get/get.dart';
import '../../../../core/storage/local/database/shared_preferences/app_settings_shared_preferences.dart';
import '../../../../routes/routes.dart';
class SplashController extends GetxController {
  AppSettingsSharedPreferences appSettingsSharedPreferences =
  AppSettingsSharedPreferences();

  @override
  void onInit() {
    super.onInit();
    Future.delayed(
        Duration(
          seconds: 2,
        ), () {
          // appSettingsSharedPreferences.clear();
      String route = appSettingsSharedPreferences.loggedIn
          ? Routes.homeView
          : appSettingsSharedPreferences.outBoardingViewed
          ? Routes.loginView
          : Routes.outBoardingScreen;
      Get.offAllNamed(route);
    });
  }
}
