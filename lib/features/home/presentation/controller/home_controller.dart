import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_test/core/storage/local/database/shared_preferences/app_settings_shared_preferences.dart';
import '../../../../routes/routes.dart';
import '../../data/data_source/home_api_controller.dart';
import '../model/home_model.dart';

class HomeController extends GetxController {
  AppSettingsSharedPreferences appSettingsSharedPreferences =
      AppSettingsSharedPreferences();
  HomeModel homeModel = HomeModel(data: [], success: true, status: 200);
  HomeApiController homeApiController = HomeApiController();
  PageController pageController = PageController();


  var currentPageIndex = 0.obs;
  var currentPage2Index = 0.obs;
  var isUnderwaySelected = false.obs;
  var numQuantity = 1.obs;
  var isFavorite = false.obs;
  var quantity = 1.obs;

  void onInit() {
    super.onInit();
    readHome();
  }

  Color getPageIndicatorColor(
      int pageIndex, Color activeColor, Color inactiveColor) {
    return currentPage2Index.value == pageIndex ? activeColor : inactiveColor;
  }

  // void incrementQuantity() {
  //   numQuantity.value++;
  // }
  //
  // void decrementQuantity() {
  //   if (numQuantity.value > 1) {
  //     numQuantity.value--;
  //   }
  // }

  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
  }

  void increaseQuantity() {
    quantity.value++;
    update();
  }

  void decreaseQuantity() {
    if (quantity.value > 1) {
      quantity.value--;
      update();
    }
  }


  void onPageChanged(int index) {
    currentPageIndex.value = index;
  }

  readHome() async {
    homeModel = await homeApiController.home(context: Get.context!);
    update();
  }

  String productPrice(String price, String unit) {
    return '\$ $price \\$unit'.toUpperCase();
  }

  productDetails(BuildContext context, int productId, String productImg,
      String productName, double productPrice) {
    homeModel.data.first.id = productId;
    homeModel.data.first.thumbnailImage = productImg;
    homeModel.data.first.name = productName;
    homeModel.data.first.basePrice = productPrice;
    Navigator.pushNamed(context, Routes.detailsView);
  }

  void onBottomNavItemTapped(int index, BuildContext context) {
    currentPage2Index.value = index;

    const List<String> routes = [
      Routes.homeView, // Index 0
      Routes.profileView, // Index 1
      Routes.settingView // Index 2
    ];
    if (index >= 0 && index < routes.length) {
      Navigator.pushNamed(context, routes[index]);
    }
  }
}
