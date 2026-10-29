class MoviesItem {
  final int? id;
  final int CastId;
  final int MovieId;
  final String MovieName;
  final String MovieLength;
  final String Category;
  final String SubCategory;
  final String ImageVertical;
  final String ImageHorizontal;
  final String youtubelink;
  final String RealeaseDate;
  final int Price;
  final String Description;

  MoviesItem({
    this.id,
    required this.CastId,
    required this.MovieId,
    required this.MovieName,
    required this.MovieLength,
    required this.Category,
    required this.SubCategory,
    required this.ImageVertical,
    required this.ImageHorizontal,
    required this.youtubelink,
    required this.RealeaseDate,
    required this.Price,
    required this.Description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'CastId': CastId,
      'MovieId': MovieId,
      'MovieName': MovieName,
      'MovieLength': MovieLength,
      'Category': Category,
      'SubCategory': SubCategory,
      'ImageVertical': ImageVertical,
      'ImageHorizontal': ImageHorizontal,
      'youtubelink': youtubelink,
      'RealeaseDate': RealeaseDate,
      'Price': Price,
      'Description': Description,
    };
  }

  factory MoviesItem.fromMap(Map<String, dynamic> map) {
    return MoviesItem(
      id: map['id'],
      CastId: map['CastId'],
      MovieId: map['MovieId'],
      MovieName: map['MovieName'],
      MovieLength: map['MovieLength'],
      Category: map['Category'],
      SubCategory: map['SubCategory'],
      ImageVertical: map['ImageVertical'],
      ImageHorizontal: map['ImageHorizontal'],
      youtubelink: map['youtubelink'],
      RealeaseDate: map['RealeaseDate'],
      Price: map['Price'],
      Description: map['Description'],
    );
  }
}
