import 'package:flutter/material.dart';
import '../services/user_db_helper.dart';
import '../models/user.dart';
import 'Profile.dart';

class LoginPage extends StatefulWidget {
  final Function(User) onLogin;
  const LoginPage({required this.onLogin, super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _fullnameController = TextEditingController();
  bool _isSignup = false;
  String? _error;

  void _login() async {
    final db = UserDbHelper();
    final user = await db.getUser(_usernameController.text, _passwordController.text);
    if (user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => Profile(user: user),
        ),
      );
    } else {
      setState(() => _error = 'Invalid credentials');
    }
  }

  void _signup() async {
    final db = UserDbHelper();
    final user = User(
      username: _usernameController.text,
      fullname: _fullnameController.text,
      password: _passwordController.text,
    );
    await db.addUser(user);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => Profile(user: user),
      ),
    );
  }

  void _showUsersDialog() async {
    final db = UserDbHelper();
    final users = await db.getAllUsers();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Saved Users'),
        content: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('ID')),
                  DataColumn(label: Text('Username')),
                  DataColumn(label: Text('Full Name')),
                  DataColumn(label: Text('Password')),
                ],
                rows: users.map((user) => DataRow(cells: [
                  DataCell(Text(user.id?.toString() ?? '')),
                  DataCell(Text(user.username)),
                  DataCell(Text(user.fullname)),
                  DataCell(Text(user.password)),
                ])).toList(),
              ),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(_isSignup ? 'Sign Up' : 'Login', style: const TextStyle(fontSize: 24, color: Colors.orange)),
              const SizedBox(height: 24),
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: 'Username', filled: true, fillColor: Colors.white10),
                style: const TextStyle(color: Colors.white),
              ),
              if (_isSignup)
                TextField(
                  controller: _fullnameController,
                  decoration: const InputDecoration(labelText: 'Full Name', filled: true, fillColor: Colors.white10),
                  style: const TextStyle(color: Colors.white),
                ),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password', filled: true, fillColor: Colors.white10),
                style: const TextStyle(color: Colors.white),
                obscureText: true,
              ),
              if (_error != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(_error!, style: const TextStyle(color: Colors.red)),
                ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                onPressed: _isSignup ? _signup : _login,
                child: Text(_isSignup ? 'Sign Up' : 'Login'),
              ),
              TextButton(
                onPressed: () => setState(() => _isSignup = !_isSignup),
                child: Text(_isSignup ? 'Already have an account? Login' : 'No account? Sign Up', style: const TextStyle(color: Colors.orange)),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white10),
                onPressed: _showUsersDialog,
                child: const Text('Show Saved Users', style: TextStyle(color: Colors.orange)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}