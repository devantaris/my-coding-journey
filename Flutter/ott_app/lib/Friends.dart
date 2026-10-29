import 'package:flutter/material.dart';
import 'bottom_navigation.dart';

class Friends extends StatefulWidget {
  const Friends({super.key});

  @override
  State<Friends> createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  int _selectedIndex = 3;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'OTT',
          style: TextStyle(
            color: Color(0xFFFF6F00), // Vibrant orange
            fontWeight: FontWeight.bold,
            fontSize: 28,),
        ),
      ),
      body: Center(
        child: Text(
          'Friends PAGE',
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        selectedIndex: _selectedIndex,
      ),
    );
  }
}