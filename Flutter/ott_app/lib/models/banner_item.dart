class BannerItem {
  final int? id;
  final String slider;
  final String DateTime;
  final String base64;

  BannerItem({
    this.id,
    required this.slider,
    required this.DateTime,
    required this.base64,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'slider': slider,
      'DateTime': DateTime,
      'base64': base64,
    };
  }

  factory BannerItem.fromMap(Map<String, dynamic> map) {
    return BannerItem(
      id: map['id'],
      slider: map['slider'],
      DateTime: map['DateTime'],
      base64: map['base64'],
    );
  }
}
