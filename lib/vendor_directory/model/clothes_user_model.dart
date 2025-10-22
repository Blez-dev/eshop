import 'package:cloud_firestore/cloud_firestore.dart';

class ClothesUserModel {
  final String? name;
  final String? price;
  final String? image;
  final String? description;
  final Timestamp? createdOn;
  final String? category;
  final List<String> availableSizes;

  ClothesUserModel({
    this.name,
    this.price,
    this.image,
    this.description,
    this.createdOn,
    this.category,
    this.availableSizes = const [],
  });

  /// ✅ Copy with method
  ClothesUserModel copyWith({
    String? name,
    String? price,
    String? image,
    String? description,
    Timestamp? createdOn,
    String? category,
    List<String>? availableSizes,
  }) {
    return ClothesUserModel(
      name: name ?? this.name,
      price: price ?? this.price,
      image: image?? this.image,
      description: description ?? this.description,
      createdOn: createdOn ?? this.createdOn,
      category: category ?? this.category,
      availableSizes: availableSizes ?? this.availableSizes,
    );
  }

  /// ✅ Convert to JSON for Firestore
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'image': image,
      'description': description,
      'createdOn': createdOn,
      'category': category,
      'availableSizes': availableSizes,
    };
  }

  /// ✅ Create model from Firestore JSON
  factory ClothesUserModel.fromJson(Map<String, dynamic> json) {
    return ClothesUserModel(
      name: json['name'] as String?,
      price: json['price'] as String?,
      image: json['image'] as String?,
      description: json['description'] as String?,
      createdOn: json['createdOn'] as Timestamp?,
      category: json['category'] as String?,
      availableSizes: json['availableSizes'] != null
          ? List<String>.from(json['availableSizes'])
          : [],
    );
  }
}
