import 'package:flutter/material.dart';
import '../bottom_navigation.dart';
import 'home.dart';
import 'filmonrent.dart';
import 'freemovies.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _currentMenuIndex = 0;

  final List<String> menuTitles = ['Home', 'Film on Rent','Free Movies','Music Videos','Talk Shows', 'Documentary'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'OTT',
          style: TextStyle(
            color: Color(0xFFFF6F00),
            fontWeight: FontWeight.bold,
            fontSize: 28,
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0x42874019),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 56,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(menuTitles.length, (index) {
                  return TextButton(
                    onPressed: () {
                      setState(() {
                        _currentMenuIndex = index;
                      });
                    },
                    child: Text(
                      menuTitles[index],
                      style: TextStyle(
                        color: _currentMenuIndex == index ? const Color(0xFFFF6F00) : Colors.white70,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          Expanded(
            child: _getMenuContent(_currentMenuIndex),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigation(
        selectedIndex: _selectedIndex,
      ),
    );
  }

  Widget _getMenuContent(int index) {
    switch (index) {
      case 0:
        return const Home();
      case 1:
        return const FilmOnRent();
      case 2:
        return const FreeMoviesPage();
      case 3:
        return Center(child: Text('Content for Page 4'));
      case 4:
        return Center(child: Text('Content for Page 5'));
      case 5:
        return Center(child: Text('Content for Page 6'));
      default:
        return Center(child: Text('Unknown Page'));
    }
  }
}