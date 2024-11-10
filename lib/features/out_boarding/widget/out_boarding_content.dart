import 'package:flutter/material.dart';
import 'package:shop_test/core/resources/manager_font_weight.dart';
import 'package:shop_test/core/resources/manager_height.dart';
import 'package:shop_test/core/resources/manager_strings.dart';
import 'package:shop_test/core/resources/manager_width.dart';

import '../../../core/resources/manager_colors.dart';
import '../../../core/resources/manager_font_sizes.dart';

class OutBoardingContent extends StatelessWidget {
  final String img;
  final String? title;
  final String? subtitle;

  const OutBoardingContent({
    super.key,
    this.img = '',
    this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          img,
          height: 300,
          width: 300,
        ),
        SizedBox(height: ManagerHeight.h58,),
        Text(
          title ??  ManagerStrings.easyProcess,
          style: TextStyle(
          fontSize: ManagerFontSizes.s34,
          color: ManagerColors.black,
        ),),
        SizedBox(height: ManagerHeight.h24,),
        Container(
          width: 300,
          child: Text(subtitle ?? ManagerStrings.subTitle1,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: ManagerFontSizes.s16,
            fontWeight: ManagerFontWeight.regular,
          ),),
        ),
      ],
    );
  }
}
