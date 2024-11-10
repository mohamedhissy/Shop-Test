import 'package:flutter/material.dart';
import 'package:shop_test/core/resources/manager_assets.dart';
import 'package:shop_test/core/resources/manager_colors.dart';
import 'package:shop_test/core/resources/manager_font_sizes.dart';
import 'package:shop_test/core/resources/manager_font_weight.dart';
import 'package:shop_test/core/resources/manager_height.dart';
import 'package:shop_test/core/resources/manager_raduis.dart';
import 'package:shop_test/core/resources/manager_strings.dart';
import 'package:shop_test/core/resources/manager_width.dart';
import 'package:shop_test/core/storage/local/database/shared_preferences/app_settings_shared_preferences.dart';
import 'package:shop_test/core/widgets/base_button.dart';

import '../../../../routes/routes.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {

  int selectedValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: ManagerWidth.w114),
              width: ManagerWidth.w140,
              height: ManagerHeight.h140,
              decoration: BoxDecoration(
                color: ManagerColors.primaryColor,
                image: DecorationImage(
                  image: AssetImage(
                    ManagerAssets.splash,
                  ),
                ),
                borderRadius: BorderRadius.circular(ManagerRadius.r30),
              ),
            ),
            SizedBox(height: ManagerHeight.h20,),
            Text(ManagerStrings.findYour,style: TextStyle(
              fontSize: ManagerFontSizes.s48,
              fontWeight: ManagerFontWeight.bold,
            ),),
            Text(ManagerStrings.homeService,style: TextStyle(
              fontSize: ManagerFontSizes.s48,
              fontWeight: ManagerFontWeight.bold,
              height: 0.4,
            ),),
            SizedBox(height: ManagerHeight.h78,),
            Text(ManagerStrings.selectLanguage,style: TextStyle(
              fontSize: ManagerFontSizes.s20,
              fontWeight: ManagerFontWeight.bold,
            ),),
           SizedBox(height: ManagerHeight.h18,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(ManagerStrings.english,
                style: TextStyle(
                  fontSize: ManagerFontSizes.s16,
                  fontWeight: ManagerFontWeight.w600,
                ),),
                Radio(
                  value: 1,
                  groupValue: selectedValue,
                  onChanged: (value){
                    setState(() {
                      selectedValue = 1;
                    });
                  },
                  activeColor: ManagerColors.primaryColor,
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(right: 20),
              child: Divider(
                thickness: 1,
                color: ManagerColors.black,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(ManagerStrings.arabic,
                  style: TextStyle(
                    fontSize: ManagerFontSizes.s16,
                    fontWeight: ManagerFontWeight.w600,
                  ),),
                Radio(
                  value: 2,
                  groupValue: selectedValue,
                  onChanged: (value){
                    setState(() {
                      selectedValue = 2;
                    });
                  },
                  activeColor: ManagerColors.primaryColor,
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(right: 20),
              child: Divider(
                thickness: 1,
                color: ManagerColors.black,
              ),
            ),
            SizedBox(height: ManagerHeight.h28,),
            Text(ManagerStrings.byCreatingAnAccountYouAgreeToOur,style: TextStyle(
              fontSize: ManagerFontSizes.s12,
              fontWeight: ManagerFontWeight.w400,
            ),),
            Text(ManagerStrings.termAndConditions,style: TextStyle(
              fontSize: ManagerFontSizes.s12,
              fontWeight: ManagerFontWeight.w400,
              color: ManagerColors.primaryColor,
            ),),
            SizedBox(height: ManagerHeight.h28,),
            BaseButton(onPressed: (){
              AppSettingsSharedPreferences().outBoardingViewed?
              Navigator.pushReplacementNamed(context, Routes.loginView):
              Navigator.pushReplacementNamed(context, Routes.outBoardingScreen);
            },),
          ],
        ),
      ),
    );
  }
}
