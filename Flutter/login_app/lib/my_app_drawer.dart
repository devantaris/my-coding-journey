import 'package:flutter/material.dart';

// Import all pages that your drawer might navigate to
import 'package:login_app/HomeScreen.dart';
import 'package:login_app/ProfilePage.dart';
import 'package:login_app/favorite.dart';
import 'package:login_app/info_page.dart';
import 'package:login_app/main.dart';
import 'package:login_app/settings.dart'; // Assuming LoginPage is here

class MyAppDrawer extends StatelessWidget {
  // Optional: A parameter to highlight the current selected page in the drawer
  final String currentPage;

  const MyAppDrawer({
    Key? key,
    this.currentPage = '', // Default to empty string if not provided
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero, // Important for full height
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 40, color: Colors.deepPurple),
                ),
                SizedBox(height: 10),
                Text(
                  'User Name',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                Text(
                  'user.email@example.com',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            selected: currentPage == 'home', // Highlight if current page is 'home'
            onTap: () {
              // Close the drawer first
              Navigator.pop(context);
              // Navigate only if not already on the Home screen
              if (currentPage != 'home') {
                // Use pushReplacement to avoid building up a stack of Home screens
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            selected: currentPage == 'profile', // Highlight if current page is 'profile'
            onTap: () {
              Navigator.pop(context);
              if (currentPage != 'profile') {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            selected: currentPage == 'settings',
            onTap: () {
              Navigator.pop(context);
              if (currentPage != 'settings') {
              Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const SettingsPage()));
              }
            },
          ),
          ListTile(
            leading : const Icon(Icons.favorite),
            title: const Text('Favorites'),
            selected: currentPage == 'favorites', // Highlight if current page is 'favorites'
            onTap: () {
              Navigator.pop(context);
              if (currentPage != 'favorites') {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const favoritePage()), // Replace with your FavoritesPage
                );
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const infoPage()), // Replace with your AboutPage
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              Navigator.pop(context);
              // Navigate to Login page and clear all routes from the stack
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage(title: 'LOGIN PAGE')),
                    (route) => false, // This condition removes all previous routes
              );
            },
          ),
        ],
      ),
    );
  }
}
