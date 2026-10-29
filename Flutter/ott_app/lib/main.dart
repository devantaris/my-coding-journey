import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'splash_screen.dart';
import 'models/user.dart';
import 'services/user_db_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final List<User> initialUsers = [
    User(username: 'itsdevanshkumar', fullname: 'Devansh Kumar', password: 'pass123'),
    User(username: 'bob', fullname: 'Bob Johnson', password: 'pass456'),
    User(username: 'carol', fullname: 'Carol Lee', password: 'pass789'),
    User(username: 'dave', fullname: 'Dave Brown', password: 'pass321'),
    User(username: 'eve', fullname: 'Eve White', password: 'pass654'),
  ];
  final userDbHelper = UserDbHelper();
  await userDbHelper.insertInitialUsers(initialUsers);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const Color cinematicCharcoal = Color(0xFF121212);
  static const Color vibrantOrange = Color(0xFFFF7A00);

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: vibrantOrange,
      brightness: Brightness.dark,
    ).copyWith(
      primary: vibrantOrange,
      background: cinematicCharcoal,
      surface: cinematicCharcoal,
    );

    return MaterialApp(
      title: 'OTT',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: cinematicCharcoal,
        colorScheme: colorScheme,
        appBarTheme: AppBarTheme(
          backgroundColor: cinematicCharcoal,
          foregroundColor: vibrantOrange,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: vibrantOrange,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black54,
        ),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}