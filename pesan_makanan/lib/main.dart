import 'package:pesan_makanan/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Food Delivery",
      theme: ThemeData(primaryColor: Colors.blue),
      home: Home(),
    );
  }
}