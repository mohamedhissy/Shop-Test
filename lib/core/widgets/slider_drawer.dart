import 'package:flutter/material.dart';
import 'package:shop_test/core/resources/manager_colors.dart';

import '../../routes/routes.dart';
class SliderDrawer extends StatefulWidget {
  const SliderDrawer({super.key});

  @override
  State<SliderDrawer> createState() => _SliderDrawerState();
}

class _SliderDrawerState extends State<SliderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ManagerColors.primaryColor,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: AlignmentDirectional.center,
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  color: ManagerColors.white,
                  borderRadius: BorderRadius.circular(590)
              ),
              child: IconButton(
                iconSize: 50,
                color: ManagerColors.primaryColor,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.homeView);
                },
                icon: Icon(
                  Icons.home,
                ),
              ),
            ),
            SizedBox(height: 60,),
            Container(
              alignment: AlignmentDirectional.center,
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  color: ManagerColors.white,
                  borderRadius: BorderRadius.circular(590)
              ),
              child: IconButton(
                iconSize: 50,
                color: ManagerColors.primaryColor,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.profileView);
                },
                icon: Icon(
                  Icons.person,
                ),
              ),
            ),
            SizedBox(height: 60,),
            Container(
              alignment: AlignmentDirectional.center,
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  color: ManagerColors.white,
                  borderRadius: BorderRadius.circular(590)
              ),
              child: IconButton(
                iconSize: 50,
                color: ManagerColors.primaryColor,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.settingView);
                },
                icon: Icon(
                  Icons.settings,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
