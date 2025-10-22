import 'package:cloud_firestore/cloud_firestore.dart';

class Clothes {
  final String name;
  final int price;
  final String shortDescription;
  final String description;
  final List<String> availableSizes;
  final Timestamp createdAt;
  final Timestamp updatedAt;

  Clothes({
    required this.name,
    required this.price,
    required this.shortDescription,
    required this.description,
    required this.availableSizes,
    required this.createdAt,
    required this.updatedAt,
  });

  // ✅ Convert Dart object → Firestore document
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'shortDescription': shortDescription,
      'description': description,
      'availableSizes': availableSizes,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  // ✅ Convert Firestore document → Dart object
  factory Clothes.fromJson(Map<String, dynamic> json) {
    return Clothes(
      name: json['name'] ?? '',
      price: json['price'] ?? 0,
      shortDescription: json['shortDescription'] ?? '',
      description: json['description'] ?? '',
      availableSizes: List<String>.from(json['availableSizes'] ?? []),
      createdAt: json['createdAt'] ?? Timestamp.now(),
      updatedAt: json['updatedAt'] ?? Timestamp.now(),
    );
  }

  // ✅ Create a new instance by copying and modifying fields
  Clothes copyWith({
    String? name,
    int? price,
    String? shortDescription,
    String? description,
    List<String>? availableSizes,
    Timestamp? createdAt,
    Timestamp? updatedAt,
  }) {
    return Clothes(
      name: name ?? this.name,
      price: price ?? this.price,
      shortDescription: shortDescription ?? this.shortDescription,
      description: description ?? this.description,
      availableSizes: availableSizes ?? this.availableSizes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
