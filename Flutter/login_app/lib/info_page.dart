import 'package:flutter/material.dart';
import 'package:login_app/HomeScreen.dart';
import 'package:login_app/main.dart';
import 'package:login_app/my_bottom_nav_bar.dart';
import 'package:login_app/my_app_drawer.dart';

class infoPage extends StatelessWidget {
  const infoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Info'),
      ),
      drawer: MyAppDrawer(),
      body: Center(
        child: Text(
          'Info Page',
          style: TextStyle(fontSize: 24, color: Colors.black54),
          textAlign: TextAlign.center,
        ),
      ),
      bottomNavigationBar: const MyBottomNavBar(currentIndex: 4),
    );
  }
}