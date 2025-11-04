import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

class ImageClass {
  final String? imageUrl;
  final File? image;
  final bool? isLoading;
  final String price;
  final Timestamp? createdOn;
  final String description;
  final bool uploadSuccess;

  // New fields
  final String brand;
  final String model;
  final bool isBrandChanged;
  final String romItem;
  final String ramItem;
  final String condition;
  final String location;
  final bool brandSelection;
  final bool isYes;
  final bool isNo;
  final int docId;

  // User info
  final String? username;
  final String? email;
  final String? whatsappNumber;
  final String userId; // ✅ Added userId

  // ✅ Constructor
  ImageClass({
    this.image,
    this.imageUrl,
    this.isLoading = false,
    this.price = '',
    this.createdOn,
    this.description = "",
    this.uploadSuccess = false,
    this.brand = "",
    this.model = "",
    this.isBrandChanged = false,
    this.romItem = "",
    this.ramItem = "",
    this.condition = "",
    this.location = "",
    this.brandSelection = false,
    this.isYes = false,
    this.isNo = false,
    this.docId = 0,
    this.username,
    this.email,
    this.whatsappNumber,
    this.userId = "", // ✅ Default empty string
  });

  // ✅ copyWith method
  ImageClass copyWith({
    bool? uploadSuccess,
    Timestamp? createdOn,
    String? description,
    String? imageUrl,
    File? image,
    bool? isLoading,
    String? price,
    String? brand,
    String? model,
    bool? isBrandChanged,
    String? romItem,
    String? ramItem,
    String? condition,
    String? location,
    bool? brandSelection,
    bool? isYes,
    bool? isNo,
    int? docId,
    String? username,
    String? email,
    String? whatsappNumber,
    String? userId, // ✅ Added userId
  }) {
    return ImageClass(
      uploadSuccess: uploadSuccess ?? this.uploadSuccess,
      description: description ?? this.description,
      createdOn: createdOn ?? this.createdOn,
      image: image ?? this.image,
      imageUrl: imageUrl ?? this.imageUrl,
      isLoading: isLoading ?? this.isLoading,
      price: price ?? this.price,
      brand: brand ?? this.brand,
      model: model ?? this.model,
      isBrandChanged: isBrandChanged ?? this.isBrandChanged,
      romItem: romItem ?? this.romItem,
      ramItem: ramItem ?? this.ramItem,
      condition: condition ?? this.condition,
      location: location ?? this.location,
      brandSelection: brandSelection ?? this.brandSelection,
      isYes: isYes ?? this.isYes,
      isNo: isNo ?? this.isNo,
      docId: docId ?? this.docId,
      username: username ?? this.username,
      email: email ?? this.email,
      whatsappNumber: whatsappNumber ?? this.whatsappNumber,
      userId: userId ?? this.userId, // ✅ Include in copyWith
    );
  }

  // ✅ toJson — for saving to Firestore
  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'isLoading': isLoading,
      'price': price,
      'createdOn': createdOn,
      'description': description,
      'uploadSuccess': uploadSuccess,
      'brand': brand,
      'model': model,
      'isBrandChanged': isBrandChanged,
      'romItem': romItem,
      'ramItem': ramItem,
      'condition': condition,
      'location': location,
      'brandSelection': brandSelection,
      'isYes': isYes,
      'isNo': isNo,
      'docId': docId,
      'username': username ?? '',
      'email': email ?? '',
      'whatsappNumber': whatsappNumber ?? '',
      'userId': userId, // ✅ Added userId to Firestore JSON
    };
  }

  // ✅ fromJson — for reading from Firestore
  factory ImageClass.fromJson(Map<String, dynamic> json) {
    return ImageClass(
      imageUrl: json['imageUrl'] as String?,
      isLoading: json['isLoading'] as bool?,
      price: json['price'] as String? ?? '',
      createdOn: json['createdOn'] as Timestamp?,
      description: json['description'] as String? ?? '',
      uploadSuccess: json['uploadSuccess'] as bool? ?? false,
      brand: json['brand'] as String? ?? '',
      model: json['model'] as String? ?? '',
      isBrandChanged: json['isBrandChanged'] as bool? ?? false,
      romItem: json['romItem'] as String? ?? '',
      ramItem: json['ramItem'] as String? ?? '',
      condition: json['condition'] as String? ?? '',
      location: json['location'] as String? ?? '',
      brandSelection: json['brandSelection'] as bool? ?? false,
      isYes: json['isYes'] as bool? ?? false,
      isNo: json['isNo'] as bool? ?? false,
      docId: json['docId'] is int ? json['docId'] as int : 0,
      username: json['username'] as String?,
      email: json['email'] as String?,
      whatsappNumber: json['whatsappNumber'] as String?,
      userId: json['userId'] as String? ?? '', // ✅ Parse userId from Firestore
    );
  }
}
