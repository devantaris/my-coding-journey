import 'package:flutter/material.dart';
import 'bottom_navigation.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int _selectedIndex = 1;

  final List<Map<String, dynamic>> moods = [
    {'emoji': '😌', 'label': 'Chill'},
    {'emoji': '😭', 'label': 'Heartbreak'},
    {'emoji': '🎢', 'label': 'Thrilling'},
    {'emoji': '🧠', 'label': 'Mind-Bending'},
    {'emoji': '😂', 'label': 'Comedy'},
    {'emoji': '😱', 'label': 'Scary'},
    {'emoji': '💖', 'label': 'Romantic'},
    {'emoji': '🤩', 'label': 'Feel-Good'},
  ];

  final List<String> genres = [
    'Action', 'Drama', 'Comedy', 'Horror', 'Sci-Fi', 'Romance', 'Thriller', 'Documentary'
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onMoodTap(String mood) {
    // TODO: Navigate to results screen or show filtered movies
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Selected mood: $mood'), duration: const Duration(milliseconds: 1000)),
    );
  }

  void _onGenreTap(String genre) {
    //TODO: Navigate to results screen or show filtered movies
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Selected genre: $genre'), duration: const Duration(milliseconds: 1000)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'OTT',
          style: TextStyle(
            color: Color(0xFFFF6F00),
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Search movies, shows...',
                  hintStyle: const TextStyle(color: Colors.white54),
                  border: InputBorder.none,
                  prefixIcon: const Icon(Icons.search, color: Colors.white54),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.arrow_forward, color: Colors.white54),
                    onPressed: () {
                      // Add your search logic here
                    },
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
            // Start Browsing Section
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'Start Browsing',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _BrowsingCard(title: 'Trending Now', icon: Icons.trending_up),
                  _BrowsingCard(title: 'Most Watched', icon: Icons.visibility),
                  _BrowsingCard(title: 'New This Week', icon: Icons.fiber_new),
                ],
              ),
            ),
            // Discover by Mood Section
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Text(
                'Discover by Mood',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: moods.map((m) => MoodChip(
                emoji: m['emoji'],
                label: m['label'],
                onTap: () => _onMoodTap(m['label']),
              ))
                  .toList(),
            ),
            // Discover by Genre Section (optional)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Text(
                'Discover by Genre',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: genres
                  .map((g) => GenreChip(
                label: g,
                onTap: () => _onGenreTap(g),
              ))
                  .toList(),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        selectedIndex: _selectedIndex,
      ),
    );
  }
}

// Browsing Card Widget
class _BrowsingCard extends StatelessWidget {
  final String title;
  final IconData icon;
  const _BrowsingCard({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          // TODO: Handle browsing card tap
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.orangeAccent, size: 36),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// MoodChip Widget
class MoodChip extends StatelessWidget {
  final String emoji;
  final String label;
  final VoidCallback onTap;
  const MoodChip({required this.emoji, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(emoji, style: const TextStyle(fontSize: 20)),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

// GenreChip Widget
class GenreChip extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const GenreChip({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.grey[700],
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}