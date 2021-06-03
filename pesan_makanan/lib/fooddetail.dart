import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pesan_makanan/colors.dart';
import 'package:pesan_makanan/style.dart';
import 'package:pesan_makanan/constant.dart';

class FoodDetail extends StatelessWidget {
  
  const FoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ConstrainedBox(
        constraints: BoxConstraints(minWidth: MediaQuery.of(context).size.width-40, minHeight: 56),
        child: ElevatedButton(
          onPressed: () => {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              PrimaryText(
                text: 'Place and Order',
                fontWeight: FontWeight.w700,fontsize: 18,
              ),
              Icon(Icons.chevron_right,color: AppColors.secondary)
            ],
            
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.lightBlueAccent,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),
            ),
        
          ),
        ),
      ),
      body: ListView(
        children: [
          customAppBarDetail(context),
          Padding(
            padding: EdgeInsets.only(left: 20.0, top: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PrimaryText(
                  text: 'Primavera Pizza',
                  fontsize: 30,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset('assets/dollar.svg',
                        color: AppColors.tertiary, width: 15),
                    PrimaryText(
                      text: '5.99',
                      fontsize: 30,
                      fontWeight: FontWeight.w600,
                      color: AppColors.tertiary,
                      height: 1,
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PrimaryText(
                            text: 'Size',
                            fontsize: 18,
                            color: AppColors.lightGray,
                            fontWeight: FontWeight.w500,
                          ),
                          PrimaryText(
                            text: 'Medium 14"',
                            fontsize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(height: 20),
                          PrimaryText(
                            text: 'Crust',
                            fontsize: 18,
                            color: AppColors.lightGray,
                            fontWeight: FontWeight.w500,
                          ),
                          PrimaryText(
                            text: 'thin crust',
                            fontsize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(height: 20),
                          PrimaryText(
                            text: 'Delivery in',
                            fontsize: 18,
                            color: AppColors.lightGray,
                            fontWeight: FontWeight.w500,
                          ),
                          PrimaryText(
                            text: '30 min',
                            fontsize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: [
                              BoxShadow(
                                  color: AppColors.lightGray, blurRadius: 20)
                            ]),
                        child: Image.asset(
                          'assets/pizza.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, top: 50),
            child: PrimaryText(
              text: 'Ingredients',
              fontWeight: FontWeight.w700,
              fontsize: 22,
            ),
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: ingredients.length,
                itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(left: index == 0 ? 20 : 0),
                      child: ingredientsfood(ingredients[index]['imagePath']),
                    )),
          ),
        ],
      ),
    );
  }

  Container ingredientsfood(String? imagePath) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      margin: EdgeInsets.only(right: 20, top: 15, bottom: 15),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(blurRadius: 10, color: AppColors.lighterGray)]),
      child: Image.asset(
        imagePath!,
        width: 90,
      ),
    );
  }

  Padding customAppBarDetail(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.lightGray),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.chevron_left_rounded),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.lightGray),
                borderRadius: BorderRadius.circular(10),
                color: Colors.lightBlueAccent),
            child: Icon(
              Icons.star,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
