import 'package:pesan_makanan/colors.dart';
import 'package:flutter/material.dart';

class PrimaryText extends StatelessWidget {

  final String text;
  final Color color;
  final double fontsize;
  final FontWeight fontWeight;
  final double height;

  const PrimaryText({
    this.text:'',
    this.fontWeight: FontWeight.w400,
    this.color: AppColors.secondary,
    this.fontsize: 20,
    this.height: 1.3,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(
      color: color,
      fontSize: fontsize,
      fontWeight: fontWeight,
      fontFamily: 'Poppins',
    ),);
  }
}