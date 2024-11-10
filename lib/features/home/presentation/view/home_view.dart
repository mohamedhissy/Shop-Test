import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_test/core/resources/manager_assets.dart';
import 'package:shop_test/core/resources/manager_colors.dart';
import 'package:shop_test/core/resources/manager_font_sizes.dart';
import 'package:shop_test/core/resources/manager_font_weight.dart';
import 'package:shop_test/core/resources/manager_height.dart';
import 'package:shop_test/core/resources/manager_raduis.dart';
import 'package:shop_test/core/resources/manager_strings.dart';
import 'package:shop_test/core/resources/manager_width.dart';
import 'package:shop_test/core/storage/local/database/shared_preferences/app_settings_shared_preferences.dart';
import 'package:shop_test/features/home/presentation/controller/home_controller.dart';
import 'package:shop_test/features/settings/presentation/controller/theme_controller.dart';
import 'package:shop_test/routes/routes.dart';
import 'package:slide_drawer/slide_drawer.dart';
import '../../../../core/widgets/slider_drawer.dart';
import '../../../out_boarding/widget/progress_indicator.dart';
import '../../../settings/presentation/controller/locale_notifier_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SlideDrawer(
      drawer: SliderDrawer(),
      child: GetBuilder<HomeController>(builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            leading: Builder(builder: (context) {
              return IconButton(
                  onPressed: () {
                    SlideDrawer.of(context)?.toggle();
                  },
                  icon: Icon(Icons.menu));
            }),
            title: Container(
              margin: EdgeInsets.symmetric(horizontal: 70),
              child: Row(
                children: [
                  GetBuilder<ThemeController>(builder: (themeController) {
                    return Container(
                      width: ManagerWidth.w28,
                      height: ManagerHeight.h28,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(themeController.isDarkMode.value
                              ? ManagerAssets.home5
                              : ManagerAssets.home1),
                        ),
                      ),
                    );
                  }),
                  SizedBox(
                    width: ManagerWidth.w8,
                  ),
                  Text(
                    ManagerStrings.appName,
                    style: TextStyle(
                      fontWeight: ManagerFontWeight.bold,
                      fontSize: ManagerFontSizes.s26,
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: Container(
            margin: EdgeInsets.symmetric(
                horizontal: ManagerWidth.w20, vertical: ManagerHeight.h12),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      ManagerStrings.goodMorning,
                      style: TextStyle(
                        fontSize: ManagerFontSizes.s14,
                        fontWeight: ManagerFontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      width: ManagerWidth.w2,
                    ),
                    Text(
                      controller.appSettingsSharedPreferences.userName,
                      style: TextStyle(
                        fontSize: ManagerFontSizes.s14,
                        fontWeight: ManagerFontWeight.w400,
                        color: ManagerColors.magedHome,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: ManagerHeight.h12,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      ManagerStrings.findYourHomeServiceNeedAHelpingHandToday,
                      style: TextStyle(
                        fontWeight: ManagerFontWeight.bold,
                        fontSize: ManagerFontSizes.s24,
                      ),
                    ),
                  ],
                ),
                // Container(
                //   // margin: EdgeInsets.only(right: ManagerWidth.w40),
                //   child: Text(
                //     'Find your home service Need a helping hand today?',
                //     style: TextStyle(
                //       fontWeight: ManagerFontWeight.bold,
                //       fontSize: ManagerFontSizes.s24,
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: ManagerHeight.h28,
                ),
                Container(
                  width: ManagerWidth.w380,
                  height: ManagerHeight.h64,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(ManagerRadius.r8),
                    color: ManagerColors.homeColor1,
                  ),
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: ManagerWidth.w17,
                                vertical: ManagerHeight.h8),
                            child: CircleAvatar(
                              backgroundColor: ManagerColors.white,
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      ManagerAssets.home2,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: ManagerHeight.h14),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ManagerStrings.yourLocation,
                                  style: TextStyle(
                                    fontSize: ManagerFontSizes.s10,
                                    fontWeight: ManagerFontWeight.regular,
                                    color: ManagerColors.color,
                                  ),
                                ),
                                Text(
                                  ManagerStrings
                                      .jiddahAlexanderLanguageSchoolALS,
                                  style: TextStyle(
                                    fontWeight: ManagerFontWeight.bold,
                                    fontSize: ManagerFontSizes.s12,
                                    color: ManagerColors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 160,
                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    controller: controller.pageController,
                    onPageChanged: (int index) {
                      controller.onPageChanged(
                          index); // Update the current page index
                    },
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: ManagerWidth.w380,
                            height: ManagerHeight.h160,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  ManagerAssets.home3,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: ManagerWidth.w20,
                                vertical: ManagerHeight.h25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: ManagerWidth.w80,
                                  height: ManagerHeight.h50,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        ManagerAssets.home4,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 150,
                                  child: Text(
                                    ManagerStrings.allYouNeedInOnePlace,
                                    style: TextStyle(
                                      fontWeight: ManagerFontWeight.bold,
                                      fontSize: ManagerFontSizes.s20,
                                      color: ManagerColors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            width: ManagerWidth.w380,
                            height: ManagerHeight.h160,

                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  ManagerAssets.home3,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: ManagerWidth.w20,
                                vertical: ManagerHeight.h25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: ManagerWidth.w80,
                                  height: ManagerHeight.h50,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        ManagerAssets.home4,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 150,
                                  child: Text(
                                    ManagerStrings.allYouNeedInOnePlace,
                                    style: TextStyle(
                                      fontWeight: ManagerFontWeight.bold,
                                      fontSize: ManagerFontSizes.s20,
                                      color: ManagerColors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            width: ManagerWidth.w380,
                            height: ManagerHeight.h160,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  ManagerAssets.home3,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: ManagerWidth.w20,
                                vertical: ManagerHeight.h25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: ManagerWidth.w80,
                                  height: ManagerHeight.h50,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        ManagerAssets.home4,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 150,
                                  child: Text(
                                    ManagerStrings.allYouNeedInOnePlace,
                                    style: TextStyle(
                                      fontWeight: ManagerFontWeight.bold,
                                      fontSize: ManagerFontSizes.s20,
                                      color: ManagerColors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(() => progressIndicator(
                            color: controller.currentPageIndex.value == 0
                                ? ManagerColors.primaryColor
                                : ManagerColors.color,
                          )),
                      Obx(() => progressIndicator(
                            color: controller.currentPageIndex.value == 1
                                ? ManagerColors.primaryColor
                                : ManagerColors.color,
                          )),
                      Obx(() => progressIndicator(
                            color: controller.currentPageIndex.value == 2
                                ? ManagerColors.primaryColor
                                : ManagerColors.color,
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: ManagerHeight.h12,
                ),
                Container(
                  child: Row(
                    children: [
                      Text(
                        ManagerStrings.ourServices,
                        style: TextStyle(
                          fontSize: ManagerFontSizes.s18,
                          fontWeight: ManagerFontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Text(
                        ManagerStrings.seeALL,
                        style: TextStyle(
                          fontSize: ManagerFontSizes.s12,
                          fontWeight: ManagerFontWeight.bold,
                          color: ManagerColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: ManagerHeight.h8,
                ),
                Expanded(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 6,
                        crossAxisSpacing: 6,
                      ),
                      itemCount: controller.homeModel.data.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            controller.productDetails(
                                context,
                                controller.homeModel.data[index].id,
                                controller.homeModel.data[index].thumbnailImage,
                                controller.homeModel.data[index].name,
                                controller.homeModel.data[index].basePrice);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 200,
                                height: 120,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      controller
                                          .homeModel.data[index].thumbnailImage,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Text(
                                controller.homeModel.data[index].name,
                                style: TextStyle(
                                    fontWeight: ManagerFontWeight.bold),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                controller.productPrice(
                                    controller.homeModel.data[index].basePrice
                                        .toString(),
                                    controller.homeModel.data[index].unit),
                                style: TextStyle(
                                    fontWeight: ManagerFontWeight.bold),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ],
            ),
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
      }),
    );
  }
}
