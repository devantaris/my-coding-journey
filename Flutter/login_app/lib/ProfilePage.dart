import 'package:flutter/material.dart';
import 'package:login_app/HomeScreen.dart';
import 'package:login_app/main.dart';
import 'package:login_app/my_bottom_nav_bar.dart';
import 'package:login_app/my_app_drawer.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      drawer: MyAppDrawer(currentPage: 'profile',),
      body: Center(
        child: Text('Profile Page',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 24, color: Colors.black54),
      ),
      ),
      bottomNavigationBar: const MyBottomNavBar(currentIndex: 1),
    );
  }
}