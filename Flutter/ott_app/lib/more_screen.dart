import 'package:flutter/material.dart';
import 'main.dart';
import 'bottom_navigation.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  int _selectedIndex = 3;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<String> menuTitles = [
    'Settings',
    'About',
    'Help',
    'Feedback',
    'Terms of Service',
    'Privacy Policy'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'OTT',
          style: TextStyle(
            color: Color(0xFFFF6F00), // Vibrant orange
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: menuTitles.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              menuTitles[index],
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              // Handle menu item tap
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${menuTitles[index]} tapped'), duration: const Duration(microseconds: 2000)),
              );
            },
          );
        },

      ),
      bottomNavigationBar: BottomNavigation(
        selectedIndex: _selectedIndex,
      ),
    );
  }
}