import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_test/core/resources/manager_assets.dart';
import 'package:shop_test/core/resources/manager_colors.dart';
import 'package:shop_test/features/splash/presentaion/controller/splash_controller.dart';

import '../../../../routes/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (controller) {
        return Scaffold(
          body: Container(
            color: ManagerColors.primaryColor,
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          ManagerAssets.splash
                      ),),
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
