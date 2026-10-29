import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:login_app/ProfilePage.dart';
import 'main.dart';
import 'my_bottom_nav_bar.dart';
import 'my_app_drawer.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Future<List<dynamic>> fetchUsers() async {
    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/users'),
        headers: {'Accept': 'application/json'},
      );

      print('API Response Status: ${response.statusCode}');
      print('API Response Body: ${response.body}');

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('API Error: $e');
      throw Exception('Network error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users')),
      drawer: MyAppDrawer(currentPage: 'home'),
      body: FutureBuilder<List<dynamic>>(
        future: fetchUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text(
              'Error: ${snapshot.error}',
              style: const TextStyle(color: Colors.red),
            ));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No users found'));
          }

          final users = snapshot.data!;
          users.sort((a, b) => a['name'].compareTo(b['name']));
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://i.pravatar.cc/150?img=${user['id']}',
                  ),
                ),
                title: Text(user['name']),
                subtitle: Text('${user['email']} •  ${user['website'] }'),
                onTap: (){},
              );
            },
          );
        },
      ),
      bottomNavigationBar: const MyBottomNavBar(currentIndex: 0),
    );
  }
}
