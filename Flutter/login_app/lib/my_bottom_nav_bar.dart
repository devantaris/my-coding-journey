import 'package:flutter/material.dart';
// Import necessary pages that your bottom nav will navigate to.
// Make sure these paths are correct in your project.
import 'package:login_app/HomeScreen.dart';
import 'package:login_app/ProfilePage.dart';
import 'package:login_app/favorite.dart';
import 'package:login_app/info_page.dart';
import 'package:login_app/main.dart';
import 'package:login_app/settings.dart'; // Assuming LoginPage is in main.dart
import 'package:login_app/info_page.dart';

class MyBottomNavBar extends StatelessWidget {
  final int currentIndex;

  const MyBottomNavBar({
    Key? key,
    required this.currentIndex, // Pass the current index to highlight the button
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      // Optional: Add a notch if you have a FloatingActionButton
      // shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround, // Distributes space evenly
        children: [
          // Home Button
          Expanded( // Use Expanded to give each button equal space
            child: IconButton(
              icon: Icon(
                Icons.home,
                // Highlight the icon if it's the current tab
                color: currentIndex == 0 ? Colors.blue : Colors.grey,
              ),
              onPressed: () {
                // If already on Home, do nothing or show a message.
                // Otherwise, navigate to HomeScreen.
                // Using pushReplacement to prevent building up navigation stack.
                if (currentIndex != 0) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                }
              },
            ),
          ),

          // Profile Button
          Expanded(
            child: IconButton(
              icon: Icon(
                Icons.person_rounded,
                color: currentIndex == 1 ? Colors.blue : Colors.grey,
              ),
              onPressed: () {
                if (currentIndex != 1) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const ProfilePage()),
                  );
                }
              },
            ),
          ),

          // Assuming a "Logout" or "Settings" button
          Expanded(
            child: IconButton(
              icon: Icon(
                Icons.settings, // Changed to settings for clarity, adjust as needed
                color: currentIndex == 2 ? Colors.blue : Colors.grey, // Assuming this is index 2
              ),
              onPressed: () {
                if (currentIndex!=2){
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const SettingsPage()),
                  );
                }

              },
            ),
          ),
          Expanded(
            child: IconButton(
              icon: Icon(
                Icons.favorite,
                color: currentIndex == 3 ? Colors.blue : Colors.grey,
              ),
              onPressed: () {
                if (currentIndex != 3) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const favoritePage()),
                  );
                }
              },
            ),
          ),

          // Example for a fifth button (e.g., Messages)
          Expanded(
            child: IconButton(
              icon: Icon(
                Icons.info,
                color: currentIndex == 4 ? Colors.blue : Colors.grey,
              ),
              onPressed: () {
                if (currentIndex!=4){
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const infoPage()),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
