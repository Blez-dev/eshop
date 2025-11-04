class SavedAdPhones {
  final String buyerId;
  final String docId;
  final String description;
  final String price;
  final String brand;
  final String model;
  final String ram;
  final String rom;
  final String condition;
  final String location;
  final String imageUrl;
  final String swappable;
  final String email;
  final String username;
  final String whatsappNumber;
  final String vendorId;

  SavedAdPhones({
    required this.buyerId,
    required this.docId,
    required this.description,
    required this.price,
    required this.brand,
    required this.model,
    required this.ram,
    required this.rom,
    required this.condition,
    required this.location,
    required this.imageUrl,
    required this.swappable,
    required this.email,
    required this.username,
    required this.whatsappNumber,
    required this.vendorId,
  });

  /// Factory constructor to create a SavedAd from Firestore JSON
  factory SavedAdPhones.fromJson(Map<String, dynamic> json) {
    return SavedAdPhones(
      buyerId: json['buyerId'] ?? '',
      docId: json['docId'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] ?? '',
      brand: json['brand'] ?? '',
      model: json['model'] ?? '',
      ram: json['ram'] ?? '',
      rom: json['rom'] ?? '',
      condition: json['condition'] ?? '',
      location: json['location'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      swappable: json['swappable'] ?? '',
      email: json['email'] ?? '',
      username: json['username'] ?? '',
      whatsappNumber: json['whatsappNumber'] ?? '',
      vendorId: json['vendorId'] ?? '',
    );
  }

  /// Converts SavedAd to a JSON Map (for saving to Firestore)
  Map<String, dynamic> toJson() {
    return {
      'buyerId': buyerId,
      'docId': docId,
      'description': description,
      'price': price,
      'brand': brand,
      'model': model,
      'ram': ram,
      'rom': rom,
      'condition': condition,
      'location': location,
      'imageUrl': imageUrl,
      'swappable': swappable,
      'email': email,
      'username': username,
      'whatsappNumber': whatsappNumber,
      'vendorId': vendorId,
    };
  }
}
