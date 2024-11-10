import 'package:flutter/material.dart';
import 'package:shop_test/core/resources/manager_assets.dart';
import 'package:shop_test/core/resources/manager_colors.dart';
import 'package:shop_test/core/resources/manager_font_sizes.dart';
import 'package:shop_test/core/resources/manager_font_weight.dart';
import 'package:shop_test/core/resources/manager_height.dart';
import 'package:shop_test/core/resources/manager_strings.dart';
import 'package:shop_test/core/widgets/base_button.dart';
import 'package:shop_test/features/out_boarding/widget/out_boarding_content.dart';
import '../../../core/constants.dart';
import '../../../core/resources/manager_width.dart';
import '../../../routes/routes.dart';
import '../widget/progress_indicator.dart';

class OutBoardingScreen extends StatefulWidget {
   OutBoardingScreen({super.key});

  @override
  State<OutBoardingScreen> createState() => _OutBoardingScreenState();
}

class _OutBoardingScreenState extends State<OutBoardingScreen> {

  late PageController _pageController = PageController();

  int _currentPageIndex = 0;

  @override
  void initState() {
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Visibility(
          visible: isNotFirstPage(),
          child: IconButton(
            onPressed: (){
              _pageController.previousPage(
                  duration: Duration(
                    milliseconds: 300,
                  ),
                  curve: Curves.fastLinearToSlowEaseIn
              );
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
            ),
          ),
        ),
        actions: [
          Container(
            width: ManagerWidth.w100,
            height: ManagerHeight.h40,
            margin: EdgeInsetsDirectional.only(end: ManagerWidth.w2),
            child: Visibility(
              visible: isNotLastPage(),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ManagerColors.transparent,
                  elevation: 0,
                ),
                onPressed: (){
                  _pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn
                  );
                },
                child: Text(ManagerStrings.next,style: TextStyle(
                  fontSize: ManagerFontSizes.s16,
                  color: ManagerColors.black,
                ),),
              ),
              replacement: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: ManagerColors.transparent,
                ),
                onPressed: (){
                  Navigator.pushReplacementNamed(context, Routes.loginView);
                },
                child: Text(ManagerStrings.start,
                style: TextStyle(
                  fontSize: ManagerFontSizes.s16,
                  color: ManagerColors.black,
                ),),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: PageView(
              scrollDirection: Axis.horizontal,
              controller: _pageController,
              onPageChanged: (int value){
                setState(() {
                  _currentPageIndex = value;
                });
              },
              children: [
                OutBoardingContent(
                  img: ManagerAssets.outBoarding1,
                  title: ManagerStrings.easyProcess,
                  subtitle: ManagerStrings.subTitle1,
                ),
                OutBoardingContent(
                  img: ManagerAssets.outBoarding2,
                  title: ManagerStrings.expertPeople,
                  subtitle: ManagerStrings.subTitle2,
                ),
                OutBoardingContent(
                  img: ManagerAssets.outBoarding3,
                  title: ManagerStrings.allInOnePlace,
                  subtitle: ManagerStrings.subTitle3,
                ),
              ],
          ),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              progressIndicator(
                color: isFirstPage()
                    ? ManagerColors.progressIndicatorColor
                    : ManagerColors.color,
                width: isFirstPage() ? ManagerWidth.w20 : ManagerWidth.w8,
              ),
              progressIndicator(
                color: isSecondPage()
                    ? ManagerColors.progressIndicatorColor
                    : ManagerColors.color,
                width: isSecondPage() ? ManagerWidth.w20 : ManagerWidth.w8,
              ),
              progressIndicator(
                color: isThirdPage()
                    ? ManagerColors.progressIndicatorColor
                    : ManagerColors.color,
                width: isThirdPage() ? ManagerWidth.w20 : ManagerWidth.w8,
              ),
            ],
          ),
          SizedBox(height: 40,),
          Visibility(
              visible: isLastPage(),
            child: BaseButton(
              onPressed: (){
                Navigator.pushReplacementNamed(context, Routes.loginView);
              },
              title: ManagerStrings.start,
              textStyle: TextStyle(
                fontSize: ManagerFontSizes.s16,
                color: ManagerColors.white,
              ),
            ),
            replacement: BaseButton(
              onPressed: (){
                _pageController.animateToPage(
                    2,
                    duration: Duration(milliseconds: 100),
                    curve: Curves.fastLinearToSlowEaseIn
                );
              },
              title: ManagerStrings.skip,
            ),
          ),
          SizedBox(height: 70,),
        ],
      ),
    );
  }
  bool isNotFirstPage() {
    return _currentPageIndex != 0;
  }

  bool isFirstPage() {
    return _currentPageIndex == 0;
  }

  bool isSecondPage() {
    return _currentPageIndex == 1;
  }

  bool isThirdPage() {
    return _currentPageIndex == 2;
  }

  bool isLastPage() {
    return _currentPageIndex == 2;
  }
  bool isNotLastPage() {
    return _currentPageIndex != 2;
  }

}
