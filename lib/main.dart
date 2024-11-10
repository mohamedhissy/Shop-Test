import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_test/config/dependancy_injection.dart';
import 'package:shop_test/config/locale/locale_settings.dart';
import 'package:shop_test/core/resources/manager_assets.dart';
import 'package:shop_test/core/resources/manager_colors.dart';
import 'package:shop_test/features/settings/presentation/controller/theme_controller.dart';
import 'package:shop_test/routes/routes.dart';
import 'package:shop_test/features/home/presentation/view/home_view.dart';
import 'features/splash/presentaion/view/splash_screen.dart';

void main() async {
  await initModule();
  runApp(EasyLocalization(
      supportedLocales: localeSettings.locales,
      path: ManagerPaths.translationsPath,
      startLocale: localeSettings.defaultLocale,
      fallbackLocale: localeSettings.defaultLocale,
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ThemeController themeController =
      Get.put<ThemeController>(ThemeController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      themeMode:
          themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
          brightness: Brightness.light,
          appBarTheme: AppBarTheme(
            elevation: 0,
            backgroundColor: ManagerColors.white,
            foregroundColor: ManagerColors.black,
          )),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: ManagerColors.transparent,
          foregroundColor: ManagerColors.white,
        )
      ),
      initialRoute: Routes.splashScreen,
      onGenerateRoute: RouteGenerator.getRoute,
    );
  }
}
