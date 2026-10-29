import 'package:flutter/material.dart';
import 'package:ott_app/login_page.dart';
import 'package:ott_app/models/user.dart';
import 'bottom_navigation.dart';

class Profile extends StatefulWidget {
  final User user;
  const Profile({required this.user, super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _selectedIndex = 4;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final String avatarPath = 'assets/profile/avatar.jpg';
  final String plan = 'Premium Plan';
  final int ratedCount = 12;
  final int commentedCount = 5;

  final List<Map<String, dynamic>> continueWatchingList = [
    {'poster': 'assets/poster/inception.png', 'title': 'Inception', 'progress': 0.7},
    {'poster': 'assets/poster/strangerthings.png', 'title': 'Stranger Things', 'progress': 0.4},
    {'poster': 'assets/poster/interstellar.jpg', 'title': 'Interstellar', 'progress': 0.9},
  ];

  final List<Map<String, dynamic>> topGenres = [
    {'name': 'Thriller', 'count': 18},
    {'name': 'Sci-Fi', 'count': 15},
    {'name': 'Drama', 'count': 12},
    {'name': 'Comedy', 'count': 9},
    {'name': 'Action', 'count': 7},
  ];

  final List<Map<String, dynamic>> rentals = [
    {'poster': 'assets/poster/inception.png', 'title': 'Inception', 'status': 'Active', 'expiresIn': '2 days', 'progress': 0.5},
    {'poster': 'assets/poster/thewitcher.jpg', 'title': 'The Witcher', 'status': 'Expired', 'expiresIn': null, 'progress': 1.0},
    {'poster': 'assets/poster/parasite.jpg', 'title': 'Parasite', 'status': 'Active', 'expiresIn': '12 hours', 'progress': 0.8},
    {'poster': 'assets/poster/moneyheist.jpg', 'title': 'Money Heist', 'status': 'Active', 'expiresIn': '1 day', 'progress': 0.3},
    {'poster': 'assets/poster/joker.jpg', 'title': 'Joker', 'status': 'Expired', 'expiresIn': null, 'progress': 1.0},
  ];

  final List<Map<String, dynamic>> watchList = [
    {'poster': 'assets/poster/thewitcher.jpg', 'title': 'The Witcher', 'type': 'Web Series'},
    {'poster': 'assets/poster/parasite.jpg', 'title': 'Parasite', 'type': 'Movie'},
    {'poster': 'assets/poster/moneyheist.jpg', 'title': 'Money Heist', 'type': 'Web Series'},
    {'poster': 'assets/poster/joker.jpg', 'title': 'Joker', 'type': 'Movie'},
    {'poster': 'assets/poster/dark.jpg', 'title': 'Dark', 'type': 'Web Series'},
  ];

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
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.orange),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => SimpleDialog(
                  title: const Text('Account Options'),
                  children: [
                    SimpleDialogOption(
                      child: const Text('Switch Account'),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => LoginPage(
                              onLogin: (user) {},
                            ),
                          ),
                        );
                      },
                    ),
                    SimpleDialogOption(
                      child: const Text('Logout'),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => LoginPage(
                              onLogin: (user) {},
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0, top: 16.0, bottom: 16.0, right: 12.0),
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 48,
                            backgroundImage: AssetImage(avatarPath),
                          ),
                          Positioned(
                            top: 60,
                            left: 60,
                            child: Container(
                              constraints: BoxConstraints(maxWidth: 30, maxHeight: 30),
                              decoration: BoxDecoration(
                                color: Colors.grey[900],
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                icon: Icon(Icons.settings, color: Colors.white70, size: 15),
                                constraints: BoxConstraints(maxWidth: 40, maxHeight: 40),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 24.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.user.fullname,
                              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            SizedBox(height: 6),
                            Text(
                              widget.user.username,
                              style: TextStyle(fontSize: 16, color: Colors.white70),
                            ),
                            SizedBox(height: 6),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    plan,
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                                  ),
                                ),
                                SizedBox(width: 10),
                                TextButton(
                                  onPressed: () {},
                                  child: Text('Manage', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Text(
                              'You have rated $ratedCount movies and commented on $commentedCount movies.',
                              style: TextStyle(color: Colors.white54, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Continue Watching',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: continueWatchingList.length,
                  itemBuilder: (context, index) {
                    final movie = continueWatchingList[index];
                    return Container(
                      width: 280,
                      margin: EdgeInsets.only(left: index == 0 ? 16 : 8, right: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  movie['poster'],
                                  height: 180,
                                  width: 280,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 130, left: 230),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.play_circle, color: Colors.orange, size: 36),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          LinearProgressIndicator(
                            value: movie['progress'],
                            backgroundColor: Colors.grey[800],
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                          ),
                          SizedBox(height: 4),
                          Text(
                            movie['title'],
                            style: TextStyle(color: Colors.white, fontSize: 14),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Top Genres',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Table(
                  border: TableBorder.all(color: Colors.white24),
                  columnWidths: {
                    0: FixedColumnWidth(50),
                    1: FlexColumnWidth(),
                    2: FixedColumnWidth(80),
                  },
                  children: [
                    TableRow(
                      decoration: BoxDecoration(color: Colors.grey[900]),
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Text('Rank', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Text('Genre', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Text('Watched', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    ...topGenres.asMap().entries.map((entry) {
                      int idx = entry.key;
                      var genre = entry.value;
                      return TableRow(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Text('${idx + 1}', style: TextStyle(color: Colors.white)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(genre['name'], style: TextStyle(color: Colors.white)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Text('${genre['count']}', style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      );
                    }).toList(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'My Rentals',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
              Container(
                height: 210,
                margin: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[850],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Scrollbar(
                  child: ListView.builder(
                    itemCount: rentals.length,
                    itemBuilder: (context, index) {
                      final rental = rentals[index];
                      return ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            rental['poster'],
                            width: 50,
                            height: 70,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(rental['title'], style: TextStyle(color: Colors.white)),
                        subtitle: Text(
                          rental['status'] == 'Active'
                              ? 'Expires in ${rental['expiresIn']}'
                              : 'Expired',
                          style: TextStyle(color: rental['status'] == 'Active' ? Colors.green : Colors.red),
                        ),
                        trailing: rental['status'] == 'Active'
                            ? Icon(Icons.play_arrow, color: Colors.orange)
                            : TextButton(
                          onPressed: () {},
                          child: Text('Rent Again', style: TextStyle(color: Colors.orange)),
                        ),
                        onTap: () {},
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'My WatchList',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
              Container(
                height: 210,
                margin: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[850],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Scrollbar(
                  child: ListView.builder(
                    itemCount: watchList.length,
                    itemBuilder: (context, index) {
                      final item = watchList[index];
                      return ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            item['poster'],
                            width: 50,
                            height: 70,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(item['title'], style: TextStyle(color: Colors.white)),
                        subtitle: Text(item['type'], style: TextStyle(color: Colors.white54)),
                        trailing: Icon(Icons.arrow_forward_ios, color: Colors.white24, size: 18),
                        onTap: () {},
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        selectedIndex: _selectedIndex,
        user: widget.user,
      ),
    );
  }
}