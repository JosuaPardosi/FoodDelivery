import 'package:pesan_makanan/home.dart';
import 'package:flutter/material.dart';
import 'package:pesan_makanan/location.dart';
import 'package:pesan_makanan/messege.dart';
import 'package:pesan_makanan/profile.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class Move extends StatefulWidget {
  const Move({Key? key}) : super(key: key);

  @override
  _MoveState createState() => _MoveState();
}

class _MoveState extends State<Move> {
  int moveBottom = 0;
  final List<Widget> move_page = [Home(), Location(), Messege(), Profile()];

  void movetapped(int index) {
    setState(() {
      moveBottom = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: move_page.elementAt(moveBottom),
      bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.map, title: 'Map'),
          TabItem(icon: Icons.message, title: "Message"),
          TabItem(icon: Icons.people, title: 'Profile')
        ],
        initialActiveIndex: 0,
        onTap: movetapped,
      ),
    );
  }
}
