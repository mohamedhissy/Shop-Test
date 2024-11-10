import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_test/core/resources/manager_font_sizes.dart';
import 'package:shop_test/core/resources/manager_font_weight.dart';
import 'package:shop_test/core/resources/manager_height.dart';
import 'package:shop_test/core/resources/manager_strings.dart';
import 'package:shop_test/core/storage/local/database/shared_preferences/app_settings_shared_preferences.dart';

import '../../../../core/resources/manager_assets.dart';
import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_raduis.dart';
import '../../../../core/resources/manager_width.dart';
import '../../../../routes/routes.dart';
import '../../../auth/presentation/controller/auth_controller.dart';
import '../../../home/presentation/controller/home_controller.dart';

class ProfileView extends StatelessWidget {
   ProfileView({super.key});




  // int selectedValue = 1;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            ManagerStrings.profile,
            style: TextStyle(
              fontWeight: ManagerFontWeight.bold,
              fontSize: ManagerFontSizes.s18,
            ),
          ),
        ),
        body: Column(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: ManagerWidth.w40),
                width: ManagerWidth.w90,
                height: ManagerHeight.h90,
                child: CircleAvatar(
                  backgroundColor: ManagerColors.white,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            controller.appSettingsSharedPreferences.selectedValue == 1
                                ? ManagerAssets.profile1
                                : ManagerAssets.profile2),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: ManagerHeight.h30,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: ManagerWidth.w20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      ManagerStrings.name,
                      style: TextStyle(
                        fontSize: ManagerFontSizes.s16,
                        fontWeight: ManagerFontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ManagerHeight.h8,
                  ),
                  IgnorePointer(
                    child: TextField(
                      decoration: InputDecoration(
                          labelText:
                              controller.appSettingsSharedPreferences.userName,
                          labelStyle: TextStyle(
                            color: ManagerColors.black,
                            fontWeight: ManagerFontWeight.w600,
                            fontSize: ManagerFontSizes.s16,
                          ),
                          suffixIcon: Icon(Icons.person),
                          suffixIconColor: ManagerColors.color,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(ManagerRadius.r10)),
                            borderSide: BorderSide(
                              color: ManagerColors.color,
                            ),
                          ),
                          filled: true,
                          fillColor: ManagerColors.bgColorTextField),
                    ),
                  ),
                  SizedBox(
                    height: ManagerHeight.h18,
                  ),
                  Container(
                    child: Text(
                      ManagerStrings.email,
                      style: TextStyle(
                        fontSize: ManagerFontSizes.s16,
                        fontWeight: ManagerFontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ManagerHeight.h8,
                  ),
                  IgnorePointer(
                    child: TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                          labelText:
                              controller.appSettingsSharedPreferences.userEmail,
                          labelStyle: TextStyle(
                            color: ManagerColors.black,
                            fontWeight: ManagerFontWeight.w600,
                            fontSize: ManagerFontSizes.s16,
                          ),
                          suffixIcon: Icon(Icons.email),
                          suffixIconColor: ManagerColors.color,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(ManagerRadius.r10)),
                            borderSide: BorderSide(
                              color: ManagerColors.color,
                            ),
                          ),
                          filled: true,
                          fillColor: ManagerColors.bgColorTextField),
                    ),
                  ),
                  SizedBox(
                    height: ManagerHeight.h18,
                  ),
                  Container(
                    child: Text(
                      ManagerStrings.phone,
                      style: TextStyle(
                        fontSize: ManagerFontSizes.s16,
                        fontWeight: ManagerFontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ManagerHeight.h8,
                  ),
                  IgnorePointer(
                    child: TextField(
                      decoration: InputDecoration(
                          labelText:
                              controller.appSettingsSharedPreferences.userPhone,
                          labelStyle: TextStyle(
                            color: ManagerColors.black,
                            fontWeight: ManagerFontWeight.w600,
                            fontSize: ManagerFontSizes.s16,
                          ),
                          suffixIcon: Icon(Icons.phone),
                          suffixIconColor: ManagerColors.color,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(ManagerRadius.r10)),
                            borderSide: BorderSide(
                              color: ManagerColors.color,
                            ),
                          ),
                          filled: true,
                          fillColor: ManagerColors.bgColorTextField),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Obx(() => BottomNavigationBar(
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
            )),
      );
    });
  }
}
