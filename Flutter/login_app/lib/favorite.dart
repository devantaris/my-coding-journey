import 'package:flutter/material.dart';
import 'package:login_app/HomeScreen.dart';
import 'package:login_app/main.dart';
import 'package:login_app/my_bottom_nav_bar.dart';
import 'package:login_app/my_app_drawer.dart';

class favoritePage extends StatelessWidget {
  const favoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      drawer: MyAppDrawer(currentPage: 'favorites'),
      body: Center(
        child: Text(
          'Favorites Page',
          style: TextStyle(fontSize: 24, color: Colors.black54),
          textAlign: TextAlign.center,
        ),
      ),
      bottomNavigationBar: const MyBottomNavBar(currentIndex: 3),
    );
  }
}