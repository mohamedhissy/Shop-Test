import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_test/core/extension/extensions.dart';
import 'package:shop_test/core/resources/manager_font_sizes.dart';
import 'package:shop_test/core/resources/manager_font_weight.dart';
import 'package:shop_test/core/resources/manager_strings.dart';
import 'package:shop_test/features/home/presentation/controller/home_controller.dart';
import '../../../../../core/resources/manager_colors.dart';
import '../../../../../core/resources/manager_height.dart';
import '../../../../config/locale/locale_settings.dart';
import '../../../../core/resources/manager_raduis.dart';
import '../../../../core/resources/manager_width.dart';
import '../controller/locale_notifier_controller.dart';
import '../controller/theme_controller.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          ManagerStrings.setting,
          style: TextStyle(
            fontSize: ManagerFontSizes.s20,
            fontWeight: ManagerFontWeight.w600,
          ),
        ),
      ),
      body: GetBuilder<LocaleNotifierController>(builder: (controller) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Text(ManagerStrings.male),
                  Spacer(),
                  Obx(() => Radio<int>(
                        value: 1,
                        groupValue: controller.selectedValue.value,
                        onChanged: (int? value) {
                          controller.saveSelectedValue(value!);
                        },
                        activeColor: ManagerColors.primaryColor,
                      )),
                ],
              ),
              Row(
                children: [
                  Text(ManagerStrings.feMale),
                  Spacer(),
                  Obx(() => Radio<int>(
                        value: 2,
                        groupValue: controller.selectedValue.value,
                        onChanged: (int? value) {
                          controller.saveSelectedValue(value!);
                        },
                        activeColor: ManagerColors.primaryColor,
                      )),
                ],
              ),
              SizedBox(height: ManagerHeight.h20),
              GetBuilder<LocaleNotifierController>(builder: (controller) {
                return Container(
                  width: double.infinity,
                  height: ManagerHeight.h50,
                  margin: EdgeInsets.symmetric(horizontal: ManagerWidth.w10),
                  decoration: BoxDecoration(
                    border: Border.all(color: ManagerColors.color),
                    borderRadius: BorderRadius.circular(ManagerRadius.r10),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      dropdownStyleData: DropdownStyleData(
                        elevation: 0,
                        decoration: BoxDecoration(
                          color: ManagerColors.primaryColor,
                          borderRadius:
                              BorderRadius.circular(ManagerRadius.r10),
                        ),
                      ),
                      customButton: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(width: ManagerWidth.w10),
                          Icon(Icons.language, color: ManagerColors.black),
                          SizedBox(width: ManagerWidth.w10),
                          Text(ManagerStrings.language),
                          Spacer(),
                          Text(
                            LocaleSettings.languages[controller.currentLanguage]
                                .onNull(),
                          ),
                          SizedBox(width: ManagerWidth.w10),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 16,
                            color: ManagerColors.white,
                          ),
                          SizedBox(width: ManagerWidth.w10),
                        ],
                      ),
                      items: controller.languagesList.values.map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      isExpanded: true,
                      value:
                          LocaleSettings.languages[controller.currentLanguage],
                      onChanged: (value) {
                        for (var entry in controller.languagesList.entries) {
                          if (entry.value == value) {
                            controller.changeLanguage(
                              context: context,
                              languageCode: entry.key,
                            );
                          }
                        }
                      },
                    ),
                  ),
                );
              }),
              GetBuilder<ThemeController>(builder: (themeController) {
                return Center(
                  child: Obx(() => SwitchListTile(
                        title: Text(ManagerStrings.darkMode),
                        value: themeController.isDarkMode.value,
                        onChanged: (value) {
                          themeController.toggleTheme();
                        },
                      )),
                );
              }),
            ],
          ),
        );
      }),
      bottomNavigationBar: GetBuilder<HomeController>(builder: (controller) {
        return Obx(() => BottomNavigationBar(
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
                BottomNavigationBarItem(icon: Icon(Icons.settings), label: "")
              ],
              currentIndex: controller.currentPage2Index.value,
              onTap: (index) =>
                  controller.onBottomNavItemTapped(index, context),
              selectedItemColor: ManagerColors.primaryColor,
              unselectedItemColor: ManagerColors.color,
              iconSize: 30,
            ));
      }),
    );
  }
}
