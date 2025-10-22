import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class ImageClass {
  final String? imageUrl;  //using
  final File? image;          //using
  final bool? isLoading; //using
  final String name;
  final String price;  //using
  final String category;  //using
  final List<String> sizes;
  final bool isSizeOnS;
  final bool isSizeOnM;
  final bool isSizeOnL;
  final bool isSizeOnXS;
  final bool isSizeOnXL;
  final Timestamp? createdOn;  //using
  final String description;
  final bool uploadSuccess;   //using


  //My new fields below
  final String brand;
  final String model;
  final bool isBrandChanged;
  final String romItem;
  final String ramItem;
  final String condition;
  final String location;
  final bool brandSelection;


  // ✅ Constructor
  ImageClass({
    this.image,
    this.imageUrl,
    this.isLoading = false,
    this.name = '',
    this.price = '',
    this.category = '',
    this.sizes = const [],
    this.isSizeOnS = false,
    this.isSizeOnM = false,
    this.isSizeOnL = false,
    this.isSizeOnXS = false,
    this.isSizeOnXL = false,
    this.createdOn,
    this.description = "",
    this.uploadSuccess = false,

    //new fields
    this.brand="",
    this.model="",
    this.isBrandChanged=false,
    this.romItem="",
    this.ramItem="",
    this.condition="",
    this.location="",
    this.brandSelection=false
  });

  // ✅ copyWith method (for immutable updates)
  ImageClass copyWith({
    bool? uploadSuccess,
    Timestamp? createdOn,
    String? description,
    String? imageUrl,
    File? image,
    bool? isLoading,
    String? name,
    String? price,
    String? category,
    List<String>? sizes,
    bool? isSizeOnS,
    bool? isSizeOnM,
    bool? isSizeOnL,
    bool? isSizeOnXS,
    bool? isSizeOnXL,

    //  //new fields
    String? brand,
    String? model,
    bool? isBrandChanged,
    String? romItem,
    String? ramItem,
    String? condition,
    String? location,
    bool? brandSelection,
  }) {
    return ImageClass(
      uploadSuccess: uploadSuccess ?? this.uploadSuccess,
      description: description ?? this.description,
      createdOn: createdOn ?? this.createdOn,
      image: image ?? this.image,
      imageUrl: imageUrl ?? this.imageUrl,
      isLoading: isLoading ?? this.isLoading,
      name: name ?? this.name,
      price: price ?? this.price,
      category: category ?? this.category,
      sizes: sizes ?? this.sizes,
      isSizeOnS: isSizeOnS ?? this.isSizeOnS,
      isSizeOnM: isSizeOnM ?? this.isSizeOnM,
      isSizeOnL: isSizeOnL ?? this.isSizeOnL,
      isSizeOnXS: isSizeOnXS ?? this.isSizeOnXS,
      isSizeOnXL: isSizeOnXL ?? this.isSizeOnXL,
      //new fields
      brand: brand?? this.brand,
      model: model?? this.model,
        isBrandChanged: isBrandChanged?? this.isBrandChanged,
        romItem: romItem?? this.romItem,
      ramItem: ramItem?? this.ramItem,
      condition: condition?? this.condition,
      location: location?? this.location,
      brandSelection: brandSelection?? this.brandSelection,
    );
  }
}
