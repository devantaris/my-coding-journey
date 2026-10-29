import 'package:flutter/material.dart';
import 'Friends.dart';
import 'HOME/home_screen.dart';
import 'reels.dart';
import 'search.dart';
import 'profile.dart';
import 'login_page.dart';


class BottomNavigation extends StatefulWidget {
  final int selectedIndex;

  const BottomNavigation({
    super.key,
    required this.selectedIndex,
  });

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  void _navigateWithFade(BuildContext context, Widget page) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }

  void _onItemTapped(int index) {
    if (index == widget.selectedIndex) return;
    switch (index) {
      case 0:
        _navigateWithFade(context, const HomeScreen());
        break;
      case 1:
        _navigateWithFade(context, const SearchScreen());
        break;
      case 2:
        _navigateWithFade(context, const Reels());
        break;
      case 3:
        _navigateWithFade(context, const Friends());
      case 4:
        _navigateWithFade(context, Profile(user: widget.user));
        break;
    // Add more cases for other screens if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: const Color(0xFFFF7A00),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xFFFF7A00),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black54,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt),
              label: 'Reels',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Friends',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: widget.selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}