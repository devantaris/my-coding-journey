import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'movie_detail.dart';
import 'dart:convert';
import '../models/banner_item.dart';
import '../services/banner_db_helper.dart';
import '../models/movies.dart';
import '../services/movies_db_helper.dart';

// --- Models for Data (Good Practice) ---

class MediaItem {
  final String imagePath;
  final String base64Image;
  final String title;
  final String imdb;
  final String duration;
  final String releaseYear;
  final String description;

  const MediaItem({
    required this.imagePath,
    required this.base64Image,
    required this.title,
    required this.imdb,
    required this.duration,
    required this.releaseYear,
    required this.description,
  });
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentBanner = 0;
  int? _infoIndex;

  final List<BannerItem> initialBanners = [
    BannerItem(
      slider: 'The 100',
      DateTime: '2014-01-01 00:00:00',
      base64: 'iVBORw0KGgoAAAANSUhEUgAAAAoAAAAKCAYAAACNM+9AAAAFUlEQVQoU2NkYGD4z0AEYBxVSFUAAgwAAQYAAZkF4ZkAAAAASUVORK5CYII=',
    ),
    BannerItem(
      slider: 'Batman',
      DateTime: '2012-01-01 00:00:00',
      base64: 'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1sHAwCAAAAC0lEQVR42mP8/wIAAgMBApUAAAAASUVORK5CYII=',
    ),
    BannerItem(
      slider: 'Interstellar',
      DateTime: '2014-01-01 00:00:00',
      base64: 'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mP8/wIAAgMBApUAAAAASUVORK5CYII=',
    ),
    BannerItem(
      slider: 'Kalki',
      DateTime: '2024-01-01 00:00:00',
      base64: 'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mP8/wIAAgMBApUAAAAASUVORK5CYII=',
    ),
  ];

  late Future<List<BannerItem>> bannersFuture;

  // --- Hardcoded Movies Data (no images) ---
  final List<MoviesItem> initialMovies = [
    MoviesItem(
      CastId: 1,
      MovieId: 101,
      MovieName: 'The 100',
      MovieLength: '160 min',
      Category: 'Sci-Fi',
      SubCategory: 'Drama',
      ImageVertical: '',
      ImageHorizontal: '',
      youtubelink: 'https://youtube.com/watch?v=xyz',
      RealeaseDate: '2014-01-01',
      Price: 0,
      Description: 'Set 97 years after a nuclear war destroyed civilization...',
    ),
    MoviesItem(
      CastId: 2,
      MovieId: 102,
      MovieName: 'Joker',
      MovieLength: '160 min',
      Category: 'Crime',
      SubCategory: 'Drama',
      ImageVertical: '',
      ImageHorizontal: '',
      youtubelink: 'https://youtube.com/watch?v=abc',
      RealeaseDate: '2019-01-01',
      Price: 0,
      Description: 'In Gotham City, mentally troubled comedian Arthur Fleck...',
    ),
    MoviesItem(
      CastId: 3,
      MovieId: 103,
      MovieName: 'Deewaar',
      MovieLength: '160 min',
      Category: 'Action',
      SubCategory: 'Drama',
      ImageVertical: '',
      ImageHorizontal: '',
      youtubelink: 'https://youtube.com/watch?v=def',
      RealeaseDate: '1975-01-01',
      Price: 0,
      Description: 'Vijay struggles as a dockworker...',
    ),
    MoviesItem(
      CastId: 4,
      MovieId: 104,
      MovieName: 'The Matrix',
      MovieLength: '160 min',
      Category: 'Sci-Fi',
      SubCategory: 'Action',
      ImageVertical: '',
      ImageHorizontal: '',
      youtubelink: 'https://youtube.com/watch?v=ghi',
      RealeaseDate: '2000-01-01',
      Price: 0,
      Description: 'In a dystopian future, a computer hacker learns...',
    ),
    MoviesItem(
      CastId: 5,
      MovieId: 105,
      MovieName: 'Laila Majnu',
      MovieLength: '160 min',
      Category: 'Romance',
      SubCategory: 'Drama',
      ImageVertical: '',
      ImageHorizontal: '',
      youtubelink: 'https://youtube.com/watch?v=jkl',
      RealeaseDate: '2004-01-01',
      Price: 0,
      Description: 'Laila Majnu is a tragic love story...',
    ),
    MoviesItem(
      CastId: 6,
      MovieId: 106,
      MovieName: 'DevDas',
      MovieLength: '160 min',
      Category: 'Romance',
      SubCategory: 'Drama',
      ImageVertical: '',
      ImageHorizontal: '',
      youtubelink: 'https://youtube.com/watch?v=mno',
      RealeaseDate: '1998-01-01',
      Price: 0,
      Description: 'Devdas is a tragic love story...',
    ),
  ];

  // --- Data for Flippable Cards ---
  final List<MediaItem> continueWatchingItems = [
    MediaItem(
      imagePath: 'assets/poster/archer.jpg',
      base64Image: 'base64_string_here',
      title: 'Archer',
      imdb: '8.6',
      duration: '180 min',
      releaseYear: '2009',
      description: 'Covert black ops and espionage take a back seat to zany personalities and relationships between secret agents and drones.',
    ),
  ];

  final List<MediaItem> recommendationItems = [
    MediaItem(imagePath: 'assets/movies/animal.jpg', base64Image: 'base64_string_here', title: 'Animal', imdb: '6.7',duration: '160 min', releaseYear: '2023', description: 'A son\'s turbulent relationship with his father takes a violent turn when the father is attacked.'),
    MediaItem(imagePath: 'assets/movies/blackpanther.jpg', base64Image: 'base64_string_here', title: 'Black Panther', imdb: '7.3',duration: '160 min', releaseYear: '2018', description: 'T\'Challa, heir to the hidden but advanced kingdom of Wakanda, must step forward to lead his people into a new future and must confront a challenger from his country\'s past.'),
    MediaItem(imagePath: 'assets/movies/matrix.jpg', base64Image: 'base64_string_here', title: 'The Matrix', imdb: '8.0',duration: '160 min', releaseYear: '2000', description: 'In a dystopian future, a computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.'),
    MediaItem(imagePath: 'assets/movies/lailamajnu.jpg', base64Image: 'base64_string_here', title: 'Laila Majnu', imdb: '10',duration: '160 min', releaseYear: '2004', description: 'Laila Majnu is a tragic love story of two lovers who are separated by circumstances but are destined to be together.'),
    MediaItem(imagePath: 'assets/movies/devdas.jpg', base64Image: 'base64_string_here', title: 'DevDas', imdb: '7.5',duration: '160 min', releaseYear: '1998', description: 'Devdas is a tragic love story of a '),
    MediaItem(imagePath: 'assets/movies/the100.jpg', base64Image: 'base64_string_here', title: 'The 100', imdb: '8.4',duration: '160 min', releaseYear: '2012', description: 'Its the BEST series of all time.'),
  ];

  final List<MediaItem> top10Items = [
    MediaItem(imagePath: 'assets/movies/the100.jpg', base64Image: 'base64_string_here', title: 'The 100', imdb: '7.6',duration: '160 min', releaseYear: '2014', description: 'Set 97 years after a nuclear war destroyed civilization, when a spaceship housing humanity\'s lone survivors sends 100 juvenile delinquents back to Earth, hoping to repopulate the planet.'),
    MediaItem(imagePath: 'assets/movies/joker.jpg', base64Image: 'base64_string_here', title: 'Joker', imdb: '8.4',duration: '160 min', releaseYear: '2019', description: 'In Gotham City, mentally troubled comedian Arthur Fleck is disregarded and mistreated by society. He then embarks on a downward spiral of revolution and bloody crime. This path brings him face-to-face with his alter-ego: the Joker.'),
    MediaItem(imagePath: 'assets/movies/deewaar.jpg', base64Image: 'base64_string_here', title: 'Deewaar', imdb: '8.0',duration: '160 min', releaseYear: '1975', description: 'Vijay struggles as a dockworker and eventually becomes a leading figure of the underworld, while his younger brother Ravi is an educated, upright policeman. This divide causes problems in their relationship.'),
    MediaItem(imagePath: 'assets/movies/matrix.jpg', base64Image: 'base64_string_here', title: 'The Matrix', imdb: '8.0',duration: '160 min', releaseYear: '2000', description: 'In a dystopian future, a computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.'),
    MediaItem(imagePath: 'assets/movies/lailamajnu.jpg', base64Image: 'base64_string_here', title: 'Laila Majnu', imdb: '10',duration: '160 min', releaseYear: '2004', description: 'Laila Majnu is a tragic love story of two lovers who are separated by circumstances but are destined to be together.'),
    MediaItem(imagePath: 'assets/movies/devdas.jpg', base64Image: 'base64_string_here', title: 'DevDas', imdb: '7.5', releaseYear: '1998',duration: '160 min', description: 'Devdas is a tragic love story of a'),
    MediaItem(imagePath: 'assets/movies/godfather.jpg', base64Image: 'base64_string_here', title: 'The GodFather', imdb: '8.4',duration: '160 min', releaseYear: '1991', description: 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.'),
    MediaItem(imagePath: 'assets/movies/animal.jpg', base64Image: 'base64_string_here', title: 'Animal', imdb: '6.7',duration: '160 min', releaseYear: '2023', description: 'A son\'s turbulent relationship with his father takes a violent turn when the father is attacked.'),
    MediaItem(imagePath: 'assets/movies/blackpanther.jpg', base64Image: 'base64_string_here', title: 'Black Panther', imdb: '7.3',duration: '160 min', releaseYear: '2018', description: 'T\'Challa, heir to the hidden but advanced kingdom of Wakanda, must step forward to lead his people into a new future and must confront a challenger from his country\'s past.'),
    MediaItem(imagePath: 'assets/poster/archer.jpg', base64Image: 'base64_string_here', title: 'Archer', imdb: '8.6',duration: '160 min', releaseYear: '2009', description: 'Covert black ops and espionage take a back seat to zany personalities and relationships between secret agents and drones.'),
  ];

  @override
  void initState() {
    super.initState();
    final dbHelper = BannerDBHelper();
    dbHelper.insertInitialBanners(initialBanners);
    bannersFuture = dbHelper.getBanners();

    // Insert hardcoded movies into local database
    final moviesDbHelper = MoviesDbHelper();
    moviesDbHelper.insertmovies(initialMovies);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // --- Banner Section (Dynamic from SQLite) ---
          SizedBox(
            height: 200,
            child: FutureBuilder<List<BannerItem>>(
              future: bannersFuture,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                final banners = snapshot.data!;
                return PageView.builder(
                  itemCount: banners.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentBanner = index;
                      _infoIndex = null;
                    });
                  },
                  itemBuilder: (context, index) {
                    final banner = banners[index];
                    final bytes = base64Decode(banner.base64);
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.memory(
                              base64Decode(banner.base64),
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
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(15),
                                backgroundColor: Colors.white54,
                              ),
                              child: const Icon(Icons.play_arrow, color: Color(0xFFFF6F00)),
                            ),
                          ),
                          Positioned(
                            top: 1,
                            left: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                                  onPressed: () {
                                    setState(() {
                                      _infoIndex = _infoIndex == index ? null : index;
                                    });
                                  },
                                ),
                                if (_infoIndex == index)
                                  Container(
                                    margin: const EdgeInsets.only(top: 2),
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.black87,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'ID: ${banner.id}',
                                          style: const TextStyle(color: Colors.white, fontSize: 12),
                                        ),
                                        Text(
                                          'Name: ${banner.slider}',
                                          style: const TextStyle(color: Colors.white, fontSize: 12),
                                        ),
                                        Text(
                                          'Date & Time: ${banner.DateTime}',
                                          style: const TextStyle(color: Colors.white, fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              initialBanners.length,
                  (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentBanner == index ? Colors.orange : Colors.white54,
                  ),
                );
              },
            ),
          ),

          // --- Continue Watching ---
          const SizedBox(height: 16),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text('Continue watching', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: continueWatchingItems.length,
              itemBuilder: (context, index) {
                final item = continueWatchingItems[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Hero(
                    tag: 'continue_${item.title}_$index',
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: const Duration(milliseconds: 600),
                            pageBuilder: (_, __, ___) => MovieDetailScreen(
                              movie: item,
                              heroTag: 'continue_${item.title}_$index',
                            ),
                          ),
                        );
                      },
                      child: _buildPosterFront(item.imagePath, width: 100, height: 150),
                    ),
                  ),
                );
              },
            ),
          ),

          // --- Recommendation ---
          const SizedBox(height: 16),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text('Recommendation', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: recommendationItems.length,
              itemBuilder: (context, index) {
                final item = recommendationItems[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Hero(
                    tag: 'recommendation_${item.title}_$index',
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: const Duration(milliseconds: 600),
                            pageBuilder: (_, __, ___) => MovieDetailScreen(
                              movie: item,
                              heroTag: 'recommendation_${item.title}_$index',
                            ),
                          ),
                        );
                      },
                      child: _buildPosterFront(item.imagePath, width: 100, height: 150),
                    ),
                  ),
                );
              },
            ),
          ),

          // --- Top 10 Today ---
          const SizedBox(height: 16),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text('Top 10 today', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ),
          SizedBox(
            height: 250,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final double totalHorizontalPadding = 16 + 16 + 8 * 2;
                return PageView.builder(
                  itemCount: (top10Items.length / 3).ceil(),
                  controller: PageController(viewportFraction: 1.0),
                  itemBuilder: (context, pageIndex) {
                    final start = pageIndex * 3;
                    final end = (start + 3).clamp(0, top10Items.length);
                    final int postersOnPage = end - start;
                    final double availableWidth = constraints.maxWidth - totalHorizontalPadding;
                    final double posterBaseWidth = availableWidth / 3 - (8 * 2 / 3);

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(postersOnPage, (i) {
                        final itemIndex = start + i;
                        if (itemIndex >= top10Items.length) return const SizedBox.shrink();

                        final item = top10Items[itemIndex];
                        final isTop1 = itemIndex == 0;
                        final double sizeFactor = isTop1 ? 1.15 : 1.0;
                        final double cardWidth = posterBaseWidth * sizeFactor;
                        final double cardHeight = 160 * sizeFactor;

                        Widget posterCard = Hero(
                          tag: 'top10_${item.title}_$itemIndex',
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  transitionDuration: const Duration(milliseconds: 600),
                                  pageBuilder: (_, __, ___) => MovieDetailScreen(
                                    movie: item,
                                    heroTag: 'top10_${item.title}_$itemIndex',
                                  ),
                                ),
                              );
                            },
                            child: _buildPosterFront(
                              item.imagePath,
                              width: cardWidth,
                              height: cardHeight,
                              isTop1: isTop1,
                              rank: itemIndex + 1,
                            ),
                          ),
                        );

                        if (isTop1) {
                          posterCard = _AnimatedGlow(child: posterCard);
                        }

                        return Padding(
                          padding: EdgeInsets.only(
                            left: i == 0 ? 8 : 4,
                            right: i == (postersOnPage - 1) ? 8 : 4,
                          ),
                          child: SizedBox(
                            width: cardWidth,
                            child: posterCard,
                          ),
                        );
                      }),
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // Helper to build the front of the card (Poster)
  Widget _buildPosterFront(String imagePath, {required double width, required double height, bool isTop1 = false, int? rank}) {
    Widget imageWidget = ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
        width: width,
        height: height,
        errorBuilder: (context, error, stackTrace) => Container(
          color: Colors.grey[700],
          width: width,
          height: height,
          child: const Center(child: Icon(Icons.broken_image, size: 30, color: Colors.white70)),
        ),
      ),
    );

    if (rank != null) {
      return Stack(
        children: [
          imageWidget,
          Positioned(
            top: isTop1 ? 6 : 4,
            left: isTop1 ? 6 : 4,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: isTop1 ? 8 : 6, vertical: isTop1 ? 4 : 2),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.8),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                '#$rank',
                style: TextStyle(
                  color: isTop1 ? Colors.orangeAccent : Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: isTop1 ? 16 : 12,
                  shadows: isTop1
                      ? [const Shadow(blurRadius: 6, color: Colors.orangeAccent, offset: Offset(0, 0))]
                      : [],
                ),
              ),
            ),
          ),
        ],
      );
    }

    return imageWidget;
  }
}

// --- AnimatedGlow Widget ---
class _AnimatedGlow extends StatefulWidget {
  final Widget child;
  const _AnimatedGlow({required this.child});

  @override
  State<_AnimatedGlow> createState() => _AnimatedGlowState();
}

class _AnimatedGlowState extends State<_AnimatedGlow> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final glow = 16 + 8 * math.sin(_controller.value * 2 * math.pi);
        return Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            boxShadow: [
              BoxShadow(
                color: Colors.orange.withOpacity(0.5),
                blurRadius: glow,
                spreadRadius: 2,
              ),
            ],
            borderRadius: BorderRadius.circular(18),
          ),
          child: widget.child,
        );
      },
    );
  }
}