import 'dart:convert';

class SavedAd {
  final String imageUrl;
  final String location;
  final String model;
  final String price;
  final String whatsappNumber;
  final String brand;
  final String username;
  final String condition;
  final String ram;
  final String swappable;
  final String rom;
  final String docId;
  final String userId;
  final String description;

  SavedAd({
    required this.imageUrl,
    required this.location,
    required this.model,
    required this.price,
    required this.whatsappNumber,
    required this.brand,
    required this.username,
    required this.condition,
    required this.ram,
    required this.swappable,
    required this.rom,
    required this.docId,
    required this.userId,
    required this.description,
  });

  /// Convert to Map
  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'location': location,
      'model': model,
      'price': price,
      'whatsappNumber': whatsappNumber,
      'brand': brand,
      'username': username,
      'condition': condition,
      'ram': ram,
      'swappable': swappable,
      'rom': rom,
      'docId': docId,
      'userId': userId,
      'description': description,
    };
  }

  /// Convert from Map
  factory SavedAd.fromMap(Map<String, dynamic> map) {
    return SavedAd(
      imageUrl: map['imageUrl'] ?? '',
      location: map['location'] ?? '',
      model: map['model'] ?? '',
      price: map['price'] ?? '',
      whatsappNumber: map['whatsappNumber'] ?? '',
      brand: map['brand'] ?? '',
      username: map['username'] ?? '',
      condition: map['condition'] ?? '',
      ram: map['ram'] ?? '',
      swappable: map['swappable'] ?? '',
      rom: map['rom'] ?? '',
      docId: map['docId'] ?? '',
      userId: map['userId'] ?? '',
      description: map['description'] ?? '',
    );
  }

  /// Encode to JSON string
  String toJson() => json.encode(toMap());

  /// Decode from JSON string
  factory SavedAd.fromJson(String source) =>
      SavedAd.fromMap(json.decode(source));
}
