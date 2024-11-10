import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_test/core/resources/manager_colors.dart';
import 'package:shop_test/core/resources/manager_font_sizes.dart';
import 'package:shop_test/core/resources/manager_font_weight.dart';
import 'package:shop_test/core/resources/manager_height.dart';
import 'package:shop_test/core/resources/manager_raduis.dart';
import 'package:shop_test/core/resources/manager_strings.dart';
import 'package:shop_test/features/home/presentation/controller/home_controller.dart';
import 'package:readmore/readmore.dart';

class DetailsView extends StatefulWidget {
  @override
  _DetailsViewState createState() => _DetailsViewState();
}

int checkEnter = 0;

class _DetailsViewState extends State<DetailsView> {
  bool isUnderwaySelected = true;

  // void toggleSelection() {
  //   setState(() {
  //     isUnderwaySelected = !isUnderwaySelected;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ManagerStrings.history),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: GetBuilder<HomeController>(
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller.toggleFavorite();
                              setState(() {
                                isUnderwaySelected = true;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: Text(
                                ManagerStrings.details,
                                style: TextStyle(
                                  color: isUnderwaySelected ? Colors.black : Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          if (isUnderwaySelected)
                            Container(
                              margin: EdgeInsets.only(top: 2),
                              height: 5,
                              width: 20,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(ManagerRadius.r8),
                              ),
                            ),
                        ],
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isUnderwaySelected = false;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: Text(
                                ManagerStrings.previous,
                                style: TextStyle(
                                  color: isUnderwaySelected ? Colors.grey : Colors.black,
                                ),
                              ),
                            ),
                          ),
                          if (!isUnderwaySelected)
                            Container(
                              margin: EdgeInsets.only(top: 2),
                              height: 5,
                              width: 20,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(ManagerRadius.r8),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20), // Add spacing between buttons and containers
                  if (isUnderwaySelected)
                  // Display a single blue container when "Hint" is selected
                    Column(
                      children: [
                        Container(
                          height: 300,
                          width: 400,
                          // alignment: Alignment.center,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(controller.homeModel.data.first.thumbnailImage),
                              fit: BoxFit.cover,
                            )
                          ),
                        ),
                        SizedBox(height: ManagerHeight.h14,),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Text(
                               ManagerStrings.nameProduct,
                                style: TextStyle(
                                  fontSize: ManagerFontSizes.s20,
                                ),
                              ),
                              Text(
                                controller.homeModel.data.first.name,
                                style: TextStyle(
                                  fontSize: ManagerFontSizes.s20,
                                  fontWeight: ManagerFontWeight.bold,
                                  color: ManagerColors.primaryColor,
                                ),
                                maxLines: 10,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: ManagerHeight.h18,),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Text(
                               ManagerStrings.priceProduct,
                                style: TextStyle(
                                  fontSize: ManagerFontSizes.s20,
                                ),
                              ),
                              Text(
                             '\$ ${controller.homeModel.data.first.basePrice.toString()}',
                                style: TextStyle(
                                  fontSize: ManagerFontSizes.s20,
                                  fontWeight: ManagerFontWeight.bold,
                                  color: ManagerColors.primaryColor,
                                ),
                              ),
                              SizedBox(width: 4,),
                              Text(
                                controller.homeModel.data.first.unit,
                                style: TextStyle(
                                  fontSize: ManagerFontSizes.s20,
                                  fontWeight: ManagerFontWeight.bold,
                                  color: ManagerColors.primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: ManagerHeight.h18,),
                        Row(
                          children: [
                            Icon(Icons.star,color: ManagerColors.iconStar,),
                            Icon(Icons.star,color: ManagerColors.iconStar,),
                            Icon(Icons.star,color: ManagerColors.iconStar,),
                            Icon(Icons.star,color: ManagerColors.iconStar,),
                            Icon(Icons.star,color: ManagerColors.iconStar,),
                          ],
                        ),
                        SizedBox(height: ManagerHeight.h18,),
                        Row(
                          children: [
                            Text(ManagerStrings.numberOfProduct,style: TextStyle(
                              fontSize: ManagerFontSizes.s20
                            ),),
                            Spacer(),
                            Container(
                              width: 120,
                              height: 26,
                              decoration: BoxDecoration(
                                color: ManagerColors.color,
                                borderRadius: BorderRadius.circular(ManagerRadius.r16),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    controller.increaseQuantity();
                                  },
                                  icon: Icon(Icons.add_circle_outline,
                                  size: 18,),
                                  color: ManagerColors.iconDetails,
                                ),
                                  Text(controller.quantity.value.toString(),style: TextStyle(
                                    color: ManagerColors.iconDetails,
                                    fontWeight: ManagerFontWeight.bold,
                                    fontSize: ManagerFontSizes.s16,
                                  ),),
                                  IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      controller.decreaseQuantity();
                                    },
                                    icon: Icon(Icons.remove_circle_outline,
                                    size:18,),
                                    color: ManagerColors.iconDetails,
                                  ),
                              ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: ManagerHeight.h18,),
                        ReadMoreText(
                          ManagerStrings.mainAxisAlignmentMainAxisAlignmentMainAxisAlignmentMainAxisAlignmentMainAxisAlignmentMainAxisAlignmentMainAxisAlignmentMainAxisAlignmentMainAxisAlignmentMainAxisAlignmentMainAxisAlignmentMainAxisAlignmentMainAxisAlignmentMainAxisAlignment,

                          trimCollapsedText: ManagerStrings.readMore,
                          trimExpandedText: ManagerStrings.readLess,
                          trimLength: 100,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    )
                  else
                  // Display two green containers when "Previous" is selected
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          color: Colors.green,
                          alignment: Alignment.center,
                          child: Text(
                            'Green Container 1',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(width: 10),
                        // Spacing between the two green containers
                        Container(
                          height: 100,
                          width: 100,
                          color: Colors.green,
                          alignment: Alignment.center,
                          child: Text(
                            'Green Container 2',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}