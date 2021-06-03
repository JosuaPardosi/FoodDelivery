import 'package:pesan_makanan/colors.dart';
import 'package:pesan_makanan/constant.dart';
import 'package:pesan_makanan/fooddetail.dart';
import 'package:pesan_makanan/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedCateogryCard = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 10, top: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PrimaryText(text: 'Food Delivery', fontsize: 20),
                ],
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.search,
                  color: AppColors.secondary,
                  size: 25,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.lighterGray),
                        ),
                        hintText: 'Search...',
                        hintStyle: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            color: AppColors.lightGray,
                            fontSize: 18)),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: PrimaryText(
                        text: 'Categories',
                        fontWeight: FontWeight.w800,
                        fontsize: 22),
                  ),
                  SizedBox(
                    height: 240,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: foodCategoryList.length,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(left: index == 0 ? 25 : 0),
                        child: foodCateogryCard(
                            foodCategoryList[index]['imagePath'],
                            foodCategoryList[index]['name'],
                            index),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, top: 10),
                    child: PrimaryText(
                        text: 'Popular',
                        fontWeight: FontWeight.w800,
                        fontsize: 22),
                  ),
                  Column(
                      children: List.generate(
                          popularFoodList.length,
                          (index) => popularFood(
                              context,
                              popularFoodList[index]['imagePath'],
                              popularFoodList[index]['name'],
                              popularFoodList[index]['weight'],
                              popularFoodList[index]['star'])))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget popularFood(BuildContext context, String? imagePath, String? name,
      String? weight, String? star) {
    return GestureDetector(
      onTap: () => (Navigator.push(
          context, MaterialPageRoute(builder: (context) => FoodDetail()))),
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 25),
        decoration: BoxDecoration(
            color: AppColors.white,
            boxShadow: [
              BoxShadow(color: AppColors.lighterGray, blurRadius: 10),
            ],
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, top: 25),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.lightBlueAccent,
                          size: 20,
                        ),
                        SizedBox(width: 10),
                        PrimaryText(
                          text: 'top of the week',
                          fontsize: 15,
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2.3,
                    padding: EdgeInsets.only(left: 20.0, top: 10),
                    child: PrimaryText(
                      text: name!,
                      fontWeight: FontWeight.w800,
                      fontsize: 22,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, bottom: 20),
                    child: PrimaryText(
                      text: weight!,
                      fontWeight: FontWeight.w800,
                      fontsize: 12,
                      color: AppColors.lightGray,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 45.0, vertical: 18),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20)),
                          color: Colors.lightBlueAccent,
                        ),
                        child: Icon(
                          Icons.add,
                          size: 20,
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 12,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          PrimaryText(
                            text: star!,
                            fontWeight: FontWeight.w700,
                            fontsize: 16,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              transform: Matrix4.translationValues(15, 0, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(color: AppColors.lightGray, blurRadius: 20),
                ],
              ),
              child: Image.asset(
                imagePath!,
                width: MediaQuery.of(context).size.width / 2.9,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget foodCateogryCard(String? imagePath, String? name, int index) {
    return GestureDetector(
      onTap: () => {
        setState(() => {print(index), selectedCateogryCard = index})
      },
      child: Container(
        margin: EdgeInsets.only(right: 25, top: 20, bottom: 20),
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: selectedCateogryCard == index
              ? Colors.lightBlueAccent
              : AppColors.white,
          boxShadow: [BoxShadow(color: AppColors.lighterGray, blurRadius: 10)],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              imagePath!,
              width: 45,
            ),
            PrimaryText(
              text: name!,
              fontsize: 20,
              fontWeight: FontWeight.w700,
            ),
            RawMaterialButton(
              onPressed: null,
              fillColor: selectedCateogryCard == index
                  ? AppColors.white
                  : AppColors.tertiary,
              shape: CircleBorder(),
              child: Icon(Icons.chevron_right,
                  color: selectedCateogryCard == index
                      ? AppColors.secondary
                      : AppColors.white,
                  size: 20),
            ),
          ],
        ),
      ),
    );
  }
}
