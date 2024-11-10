import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_test/core/resources/manager_height.dart';
import 'package:shop_test/core/resources/manager_raduis.dart';
import 'package:shop_test/core/widgets/base_button.dart';
import 'package:shop_test/features/auth/presentation/controller/auth_controller.dart';

import '../../../../core/resources/manager_assets.dart';
import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_font_sizes.dart';
import '../../../../core/resources/manager_font_weight.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/resources/manager_width.dart';
import '../../../../routes/routes.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (controller) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 58),
                  child: Text(
                    ManagerStrings.register,
                    style: TextStyle(
                      fontSize: ManagerFontSizes.s28,
                      fontWeight: ManagerFontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: ManagerHeight.h14,
                ),
                Container(
                  width: 260,
                  height: 50,
                  child: Text(
                    textAlign: TextAlign.center,
                    ManagerStrings.pleaseEnterYourPhoneAndPasswordToContinue,
                    style: TextStyle(
                      fontSize: ManagerFontSizes.s14,
                      fontWeight: ManagerFontWeight.regular,
                      color: ManagerColors.subStringLlogin,
                    ),
                  ),
                ),
                SizedBox(
                  height: ManagerHeight.h18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        ManagerStrings.name,
                        style: TextStyle(
                          fontWeight: ManagerFontWeight.w600,
                          fontSize: ManagerFontSizes.s16,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      controller: controller.userNameTextEditingController,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.person),
                        suffixIconColor: ManagerColors.color,
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(ManagerRadius.r10),
                          borderSide: BorderSide(
                            color: ManagerColors.primaryColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(ManagerRadius.r10),
                          borderSide: BorderSide(
                            color: ManagerColors.primaryColor,
                            width: 2,
                          ),
                        ),
                        labelText: ManagerStrings.enterYourName,
                        labelStyle: TextStyle(
                          color: ManagerColors.bgColorTextFieldString,
                        ),
                        filled: true,
                        fillColor: ManagerColors.bgColorTextField,
                        errorText: controller.nameError,
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(ManagerRadius.r10),
                          borderSide: BorderSide(
                            color: ManagerColors.red,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: ManagerHeight.h4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        ManagerStrings.password,
                        style: TextStyle(
                          fontWeight: ManagerFontWeight.w600,
                          fontSize: ManagerFontSizes.s16,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      controller: controller.passwordTextEditingController,
                      obscureText: controller.showPassword,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () =>
                                controller.changePasswordVisibility(),
                            icon: controller.showPassword
                                ? Icon(Icons.visibility_off)
                                : Icon(
                                    Icons.visibility,
                                    color: ManagerColors.primaryColor,
                                  )),
                        suffixIconColor: ManagerColors.color,
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(ManagerRadius.r10),
                          borderSide: BorderSide(
                            color: ManagerColors.primaryColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(ManagerRadius.r10),
                          borderSide: BorderSide(
                            color: ManagerColors.primaryColor,
                            width: 2,
                          ),
                        ),
                        labelText: ManagerStrings.enterYourPassword,
                        labelStyle: TextStyle(
                          color: ManagerColors.bgColorTextFieldString,
                        ),
                        filled: true,
                        fillColor: ManagerColors.bgColorTextField,
                        errorText: controller.passwordError,
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(ManagerRadius.r10),
                          borderSide: BorderSide(
                            color: ManagerColors.red,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: ManagerHeight.h4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        ManagerStrings.confirmPassword,
                        style: TextStyle(
                          fontWeight: ManagerFontWeight.w600,
                          fontSize: ManagerFontSizes.s16,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      controller:
                          controller.confirmPasswordTextEditingController,
                      obscureText: controller.showConfirmPassword,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () =>
                                controller.changeConfirmPasswordVisibility(),
                            icon: controller.showConfirmPassword
                                ? Icon(Icons.visibility_off)
                                : Icon(
                              Icons.visibility,
                              color: ManagerColors.primaryColor,
                            )),
                        suffixIconColor: ManagerColors.color,
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(ManagerRadius.r10),
                          borderSide: BorderSide(
                            color: ManagerColors.primaryColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(ManagerRadius.r10),
                          borderSide: BorderSide(
                            color: ManagerColors.primaryColor,
                            width: 2,
                          ),
                        ),
                        labelText: ManagerStrings.confirmPassword,
                        labelStyle: TextStyle(
                          color: ManagerColors.bgColorTextFieldString,
                        ),
                        filled: true,
                        fillColor: ManagerColors.bgColorTextField,
                        errorText: controller.confirmPasswordError,
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(ManagerRadius.r10),
                          borderSide: BorderSide(
                            color: ManagerColors.red,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: ManagerHeight.h4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        ManagerStrings.email,
                        style: TextStyle(
                          fontWeight: ManagerFontWeight.w600,
                          fontSize: ManagerFontSizes.s16,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      controller: controller.emailTextEditingController,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.email),
                        suffixIconColor: ManagerColors.color,
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(ManagerRadius.r10),
                          borderSide: BorderSide(
                            color: ManagerColors.primaryColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(ManagerRadius.r10),
                          borderSide: BorderSide(
                            color: ManagerColors.primaryColor,
                            width: 2,
                          ),
                        ),
                        labelText: ManagerStrings.enterYourEmail,
                        labelStyle: TextStyle(
                          color: ManagerColors.bgColorTextFieldString,
                        ),
                        filled: true,
                        fillColor: ManagerColors.bgColorTextField,
                        errorText: controller.emailError,
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(ManagerRadius.r10),
                          borderSide: BorderSide(
                            color: ManagerColors.red,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: ManagerHeight.h4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        ManagerStrings.phone,
                        style: TextStyle(
                          fontWeight: ManagerFontWeight.w600,
                          fontSize: ManagerFontSizes.s16,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      controller: controller.phoneTextEditingController,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.phone),
                        suffixIconColor: ManagerColors.color,
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(ManagerRadius.r10),
                          borderSide: BorderSide(
                            color: ManagerColors.primaryColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(ManagerRadius.r10),
                          borderSide: BorderSide(
                            color: ManagerColors.primaryColor,
                            width: 2,
                          ),
                        ),
                        labelText: ManagerStrings.enterYourPhone,
                        labelStyle: TextStyle(
                          color: ManagerColors.bgColorTextFieldString,
                        ),
                        filled: true,
                        fillColor: ManagerColors.bgColorTextField,
                        errorText: controller.phoneError,
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(ManagerRadius.r10),
                          borderSide: BorderSide(
                            color: ManagerColors.red,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: ManagerHeight.h8,
                ),
                BaseButton(
                  onPressed: () {
                    controller.performRegister(context);
                  },
                  title: ManagerStrings.register,
                  textStyle: TextStyle(
                    fontSize: ManagerFontSizes.s18,
                    fontWeight: ManagerFontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: ManagerHeight.h10,
                ),
                Text('OR'),
                SizedBox(
                  height: ManagerHeight.h10,
                ),
                Container(
                  width: 360,
                  height: 60,
                  decoration: BoxDecoration(
                    color: ManagerColors.color,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: ManagerHeight.h33,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              ManagerAssets.fasebook,
                            ),
                          ),
                        ),
                      ),
                      Text(ManagerStrings.facebook),
                    ],
                  ),
                ),
                SizedBox(
                  height: ManagerHeight.h12,
                ),
                Container(
                  width: 360,
                  height: 60,
                  decoration: BoxDecoration(
                    color: ManagerColors.color,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: ManagerHeight.h33,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              ManagerAssets.google,
                            ),
                          ),
                        ),
                      ),
                      Text(ManagerStrings.google),
                    ],
                  ),
                ),
                SizedBox(
                  height: ManagerHeight.h24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      ManagerStrings.haveAccount,
                      style: TextStyle(
                        fontSize: ManagerFontSizes.s16,
                        fontWeight: ManagerFontWeight.regular,
                      ),
                    ),
                    SizedBox(
                      width: ManagerWidth.w8,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, Routes.loginView);
                      },
                      child: Text(
                        ManagerStrings.signUp,
                        style: TextStyle(
                          color: ManagerColors.primaryColor,
                          fontSize: ManagerFontSizes.s16,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: ManagerHeight.h80,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
