import 'package:flutter/material.dart';
import 'home.dart'; // Import to use MediaItem and potentially other shared components/styles
import 'paymentscreen.dart'; // Import for the payment screen

class RentableMovie extends MediaItem {
  final String rentalPrice;
  final String rentalValidity;

  // Make the constructor const
  const RentableMovie({
    required super.imagePath,
    required super.title,
     super.base64Image = 'all same for now',
    required super.imdb,
    required super.duration,
    required super.releaseYear,
    required super.description,
    required this.rentalPrice,
    required this.rentalValidity,
  });
}


class FilmOnRent extends StatelessWidget {
  const FilmOnRent({super.key});

  // --- Sample Data for Rentable Movies ---
  final List<RentableMovie> rentableMovies = const [
    // Mark each instance as const
    const RentableMovie(
      imagePath: 'assets/movies/matrix.jpg', // Using an image from home.dart assets
      title: 'The Matrix',
      imdb: '8.0',duration: '160 min',
      releaseYear: '2000',
      description: 'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.',
      rentalPrice: '\Rs.100',
      rentalValidity: '48 hours',
    ),
    const RentableMovie(
      imagePath: 'assets/movies/joker.jpg',
      title: 'Joker',
      imdb: '8.4',duration: '160 min',
      releaseYear: '2019',
      description: 'In Gotham City, mentally troubled comedian Arthur Fleck is disregarded and mistreated by society. He then embarks on a downward spiral of revolution and bloody crime. This path brings him face-to-face with his alter-ego: the Joker.',
      rentalPrice: '\Rs.100',
      rentalValidity: '72 hours',
    ),
    const RentableMovie(
      imagePath: 'assets/movies/animal.jpg',
      title: 'Animal',
      imdb: '6.7',duration: '160 min',
      releaseYear: '2023',
      description: 'A son\'s turbulent relationship with his father takes a violent turn when the father is attacked.',
      rentalPrice: '\Rs.100',
      rentalValidity: '24 hours',
    ),
    const RentableMovie(
      imagePath: 'assets/movies/blackpanther.jpg',
      title: 'Black Panther',
      imdb: '7.3',duration: '160 min',
      releaseYear: '2018',
      description: 'T\'Challa, heir to the hidden but advanced kingdom of Wakanda, must step forward to lead his people into a new future and must confront a challenger from his country\'s past.',
      rentalPrice: '\Rs.100',
      rentalValidity: '48 hours',
    ),
    const RentableMovie(
      imagePath: 'assets/movies/godfather.jpg',
      title: 'The Godfather',
      imdb: '9.2',duration: '160 min',
      releaseYear: '1972',
      description: 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.',
      rentalPrice: '\Rs.100',
      rentalValidity: '48 hours',
    ),
    const RentableMovie(
      imagePath: 'assets/movies/lailamajnu.jpg',
      title: 'Laila Majnu',
      imdb: '7.5', duration: '160 min',// Corrected from 10, assuming 10 is a placeholder
      releaseYear: '2018', // Assuming a more recent release than 2004 for a rental
      description: 'A modern-day retelling of the classic tragic love story of Laila and Majnu.',
      rentalPrice: '\Rs.200',
      rentalValidity: '48 hours',
    ),
    const RentableMovie(
      imagePath: 'assets/movies/titanic.jpg',
      title: 'Titanic',
      imdb: '8.4',duration: '160 min',
      releaseYear: '2002',
      description: 'The Titanic disaster is depicted in this epic romance and disaster film, focusing on the ill-fated voyage of the RMS Titanic.',
      rentalPrice: '\Rs.150',
      rentalValidity: '72 hours',
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Film on Rent',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black, // Consistent with your app's likely theme
        iconTheme: const IconThemeData(color: Colors.white), // For the back arrow
      ),
      body: rentableMovies.isEmpty
          ? const Center(
        child: Text(
          'No movies available for rent at the moment.',
          style: TextStyle(fontSize: 18, color: Colors.white70),
          textAlign: TextAlign.center,
        ),
      )
          : GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 items per row
          childAspectRatio: 0.5, // Adjust as needed to fit content
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemCount: rentableMovies.length,
        itemBuilder: (context, index) {
          final movie = rentableMovies[index];
          return _buildMovieRentalCard(context, movie);
        },
      ),
      backgroundColor: Colors.black, // Ensure consistent background
    );
  }

  Widget _buildMovieRentalCard(BuildContext context, RentableMovie movie) {
    return Card(
      clipBehavior: Clip.antiAlias, // Ensures content is clipped to card shape
      color: Colors.grey[900], // Darker card background
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.asset(
                    movie.imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: Colors.grey[700],
                      child: const Center(child: Icon(Icons.broken_image, size: 40, color: Colors.white70)),
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      movie.rentalPrice,
                      style: const TextStyle(
                        color: Colors.orangeAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    movie.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'IMDb: ${movie.imdb} • ${movie.releaseYear}',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Validity: ${movie.rentalValidity}',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                  const Spacer(), // Pushes the button to the bottom
                  SizedBox(
                    width: double.infinity, // Make button full width
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Implement rental logic (e.g., navigate to payment, show confirmation)
                        _showRentConfirmationDialog(context, movie);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange, // A vibrant color for the action
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                      ),
                      child: const Text(
                        'Rent Now',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showRentConfirmationDialog(BuildContext context, RentableMovie movie) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          backgroundColor: Colors.grey[700],
          title: Text(
            'Confirm Rental for ${movie.title}',
            style: const TextStyle(color: Colors.white),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Price: ${movie.rentalPrice}', style: const TextStyle(color: Colors.white70)),
              Text('Validity: ${movie.rentalValidity}', style: const TextStyle(color: Colors.white70)),
              const SizedBox(height: 10),
              Text(
                movie.description,
                style: const TextStyle(color: Colors.white70),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Dismiss the dialog
              },
              child: const Text('Cancel', style: TextStyle(color: Colors.white70)),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Dismiss the dialog
                // Navigate to the payment screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PaymentScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
              ),
              child: const Text('Rent'),
            ),
          ],
        );
      },
    );
  }
}