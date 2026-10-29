# login_app

A new Flutter project.

## Getting Started

this is body of the login app before editing

Center(
child: Container(
width: 250,
height: 350,
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
crossAxisAlignment: CrossAxisAlignment.center,
children: [
Text(
'WELCOME TO THE LOGIN APP',
style: TextStyle(
fontSize: 20,
fontWeight: FontWeight.bold,
color: Colors.purpleAccent,
),
),
TextField(
decoration: InputDecoration(
labelText: 'Username',
border: OutlineInputBorder(),
),
),
SizedBox(height: 10),
TextField(
decoration: InputDecoration(
labelText: 'Password',
border: OutlineInputBorder(),
),
obscureText: true,
),
CheckboxListTile(
title: Text('Remember Me'),
value: _rememberMe,
onChanged: (bool? value) {
setState(() {
_rememberMe = value ?? false;
});
},
controlAffinity: ListTileControlAffinity.leading,
contentPadding: EdgeInsets.zero,
),
ElevatedButton(
child: Text("LOGIN", style: TextStyle(fontSize: 20)),
onPressed: () {
print("Login button pressed");
},
),
ElevatedButton(
child: Text("REGISTER", style: TextStyle(fontSize: 20)),
onPressed: () {
print("Register button pressed");
},
),
],
),
),
),
bottomNavigationBar: BottomNavigationBar(
currentIndex: _selectedIndex,
onTap: _onNavBarTapped,
type: BottomNavigationBarType.fixed,
items:  [
BottomNavigationBarItem(
icon: Icon(Icons.home),
label: 'Home',
),
BottomNavigationBarItem(
icon: Icon(Icons.person),
label: 'Profile',
),
BottomNavigationBarItem(
icon: Icon(Icons.settings),
label: 'Settings',
),
BottomNavigationBarItem(
icon: Icon(Icons.info),
label: 'About',
),
BottomNavigationBarItem(
icon: Icon(Icons.help),
label: 'Help',
),
],
),
