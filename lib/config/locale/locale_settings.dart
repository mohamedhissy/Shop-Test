import 'dart:ui';
import '../../core/constants.dart';
import '../../core/storage/local/database/shared_preferences/app_settings_shared_preferences.dart';

LocaleSettings localeSettings = LocaleSettings();

class LocaleSettings {
  final AppSettingsSharedPreferences _appSettingsSharedPreferences =
  AppSettingsSharedPreferences();

  static Map<String, String> languages = {
    KeyConstants.arabic: KeyConstants.arabicName,
    KeyConstants.english: KeyConstants.englishName,
  };

  List<Locale> get locales =>
      languages.keys.map((langKey) => Locale(langKey)).toList();

  Locale get defaultLocale =>
      Locale(_appSettingsSharedPreferences.defaultLocale);

//  List<Locale> = [Locale('ar'), Locale('en')],
// locale = Locale('ar')
}
