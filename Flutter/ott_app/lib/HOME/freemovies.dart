import 'package:flutter/material.dart';
import 'home.dart'; // For MediaItem
import 'FullscreenFlipDialog.dart'; // For FlipCard

class FreeMoviesPage extends StatefulWidget {
  const FreeMoviesPage({super.key});

  @override
  State<FreeMoviesPage> createState() => _FreeMoviesPageState();
}

class _FreeMoviesPageState extends State<FreeMoviesPage> {
  final List<MediaItem> freeMovies = [
    MediaItem(
      imagePath: 'assets/movies/the100.jpg',
      base64Image: '',
      title: 'The 100',
      imdb: '7.6',
      duration: '160 min',
      releaseYear: '2014',
      description: 'Set 97 years after a nuclear war destroyed civilization...',
    ),
    MediaItem(
      imagePath: 'assets/movies/joker.jpg',
      base64Image: '',
      title: 'Joker',
      imdb: '8.4',
      duration: '160 min',
      releaseYear: '2019',
      description: 'In Gotham City, mentally troubled comedian Arthur Fleck...',
    ),
    MediaItem(
      imagePath: 'assets/movies/deewaar.jpg',
      base64Image: '',
      title: 'Deewaar',
      imdb: '8.0',
      duration: '160 min',
      releaseYear: '1975',
      description: 'Vijay struggles as a dockworker...',
    ),
    MediaItem(
      imagePath: 'assets/movies/matrix.jpg',
      base64Image: '',
      title: 'The Matrix',
      imdb: '8.0',
      duration: '160 min',
      releaseYear: '2000',
      description: 'In a dystopian future, a computer hacker learns...',
    ),
    MediaItem(
      imagePath: 'assets/movies/lailamajnu.jpg',
      base64Image: '',
      title: 'Laila Majnu',
      imdb: '10',
      duration: '160 min',
      releaseYear: '2004',
      description: 'Laila Majnu is a tragic love story...',
    ),
    MediaItem(
      imagePath: 'assets/movies/devdas.jpg',
      base64Image: '',
      title: 'DevDas',
      imdb: '7.5',
      duration: '160 min',
      releaseYear: '1998',
      description: 'Devdas is a tragic love story...',
    ),
  ];

  int _currentBanner = 0;

  void _showFlipDialog(MediaItem item) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(16),
        child: Center(
          child: FlipCard(
            item: item,
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.6,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Free Movies')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Banner Carousel
            SizedBox(
              height: 220,
              child: PageView.builder(
                itemCount: freeMovies.length,
                onPageChanged: (i) => setState(() => _currentBanner = i),
                itemBuilder: (context, i) {
                  final item = freeMovies[i];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            item.imagePath,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                            errorBuilder: (context, error, stackTrace) => Container(
                              color: Colors.grey,
                              child: const Center(child: Icon(Icons.broken_image, size: 40)),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: ElevatedButton(
                            onPressed: () => _showFlipDialog(item),
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(15),
                              backgroundColor: Colors.white54,
                            ),
                            child: const Icon(Icons.info_outline, color: Color(0xFFFF6F00)),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 10,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              item.title,
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            // Banner Dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                freeMovies.length,
                    (i) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentBanner == i ? Colors.orange : Colors.white54,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Grid of Free Movies
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: freeMovies.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, i) {
                  final item = freeMovies[i];
                  return GestureDetector(
                    onTap: () => _showFlipDialog(item),
                    child: FlipCard(
                      item: item,
                      width: double.infinity,
                      height: 240,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}