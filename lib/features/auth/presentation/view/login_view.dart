import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_test/core/resources/manager_assets.dart';
import 'package:shop_test/core/resources/manager_colors.dart';
import 'package:shop_test/core/resources/manager_font_sizes.dart';
import 'package:shop_test/core/resources/manager_font_weight.dart';
import 'package:shop_test/core/resources/manager_height.dart';
import 'package:shop_test/core/resources/manager_raduis.dart';
import 'package:shop_test/core/resources/manager_strings.dart';
import 'package:shop_test/core/widgets/base_button.dart';
import 'package:shop_test/features/auth/presentation/controller/auth_controller.dart';

import '../../../../core/resources/manager_width.dart';
import '../../../../routes/routes.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (controller) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 58),
                    child: Text(ManagerStrings.login,style: TextStyle(
                      fontSize: ManagerFontSizes.s28,
                      fontWeight: ManagerFontWeight.bold,
                    ),),
                  ),
                  SizedBox(height: ManagerHeight.h14,),
                  Container(
                    width: 260,
                    height: 50,
                    child: Text(
                      textAlign : TextAlign.center,
                        ManagerStrings.pleaseEnterYourPhoneAndPasswordToContinue,
                    style: TextStyle(
                      fontSize: ManagerFontSizes.s14,
                      fontWeight: ManagerFontWeight.regular,
                      color: ManagerColors.subStringLlogin,
                    ),),
                  ),
                  SizedBox(height: ManagerHeight.h18,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(ManagerStrings.email,
                          style: TextStyle(
                            fontWeight: ManagerFontWeight.w600,
                            fontSize: ManagerFontSizes.s16,
                          ),),
                      ),
                    ],
                  ),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: TextField(
                        controller: controller.emailTextEditingController,
                        decoration: InputDecoration(
                          errorText: controller.emailError,
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(ManagerRadius.r10),
                            borderSide: BorderSide(
                              color: ManagerColors.red,
                              width: 2,
                            ),
                          ),
                          suffixIcon: Icon(Icons.email),
                          suffixIconColor: ManagerColors.color,
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(ManagerRadius.r10)),
                            borderSide: BorderSide(
                              color: ManagerColors.primaryColor,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(ManagerRadius.r10)),
                            borderSide: BorderSide(
                                color: ManagerColors.primaryColor,
                                width: ManagerWidth.w2),
                          ),
                          labelText: ManagerStrings.email,
                          labelStyle: TextStyle(
                            color: ManagerColors.bgColorTextFieldString,
                          ),
                          filled: true,
                          fillColor: ManagerColors.bgColorTextField,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(ManagerStrings.password,
                          style: TextStyle(
                            fontWeight: ManagerFontWeight.w600,
                            fontSize: ManagerFontSizes.s16,
                          ),),
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
                          errorText: controller.passwordError,
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(ManagerRadius.r10),
                            borderSide: BorderSide(
                              color: ManagerColors.red,
                              width: 2,
                            ),
                          ),
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
                            BorderRadius.all(Radius.circular(ManagerRadius.r10)),
                            borderSide: BorderSide(
                              color: ManagerColors.primaryColor,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(ManagerRadius.r10)),
                            borderSide: BorderSide(
                                color: ManagerColors.primaryColor,
                                width: ManagerWidth.w2),
                          ),
                          labelText: ManagerStrings.password,
                          labelStyle: TextStyle(
                            color: ManagerColors.bgColorTextFieldString,
                          ),
                          filled: true,
                          fillColor: ManagerColors.bgColorTextField,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: ManagerWidth.w218),
                    child: Text(
                      ManagerStrings.forgetPassword,
                      style: TextStyle(
                        fontSize: ManagerFontSizes.s16,
                        fontWeight: ManagerFontWeight.regular,
                      ),
                    ),
                  ),
                  const SizedBox(height: ManagerHeight.h18,),
                  BaseButton(onPressed: (){
                    controller.preformLogin(context);
                  },
                  title: ManagerStrings.login,
                    textStyle: const TextStyle(
                      fontWeight: ManagerFontWeight.bold,
                      fontSize: ManagerFontSizes.s18,
                    ),
                  ),
                  SizedBox(height: ManagerHeight.h18,),
                  Text('OR'),
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
                          decoration: const BoxDecoration(
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
                  const SizedBox(height: ManagerHeight.h18,),
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
                          decoration: const BoxDecoration(
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
                  SizedBox(height: ManagerHeight.h24,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(ManagerStrings.dontHaveAccount,
                      style: TextStyle(
                        fontWeight: ManagerFontWeight.regular,
                        fontSize: ManagerFontSizes.s16,
                      ),),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushReplacementNamed(context, Routes.registerView);
                        },
                        child: Text(ManagerStrings.signUp,
                        style: TextStyle(
                          fontWeight: ManagerFontWeight.regular,
                          fontSize: ManagerFontSizes.s16,
                          color: ManagerColors.primaryColor,
                        ),),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
