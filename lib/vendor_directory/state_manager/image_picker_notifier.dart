import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshop/presentation/components/flutter_toast.dart';
import 'package:eshop/vendor_directory/model/image_class.dart';
import 'package:eshop/vendor_directory/services/image_picker_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/legacy.dart';

class PostAddNotifier extends StateNotifier<ImageClass> {
  ImagePickerService imagePickerService;

  PostAddNotifier(this.imagePickerService) : super(ImageClass());

  Future<void> pickImageFromGallery() async {
    final File? image = await imagePickerService.pickImageFromGallery();

    if (image == null) return;
    final compressedImage= await imagePickerService.compressImage(image.path);
    if (compressedImage==null) return;
    state = state.copyWith(image: compressedImage);
  }

  Future<void> uploadImageToDatabase() async {
    if (state.image == null) return;
    state = state.copyWith(isLoading: true);
    final fileName = DateTime.now().millisecondsSinceEpoch.toString();
    final ref = FirebaseStorage.instance.ref("images").child(fileName);

    final uploadTask = await ref.putFile(state.image!);

    final imageUrl = await uploadTask.ref.getDownloadURL();

    state = state.copyWith(imageUrl: imageUrl);
    state = state.copyWith(isLoading: false);
  }

  Future<void> pickImageFromCamera() async {
    final File? image = await imagePickerService.pickImageFromCamera();

    if (image == null) return;
    //compressImage
    final compressedImage= await imagePickerService.compressImage(image.path);
    if (compressedImage==null) return;
    state = state.copyWith(image: compressedImage);
  }



  void addSize(String newSize) {
    if (!state.sizes.contains(newSize)) {
      state = state.copyWith(sizes: [...state.sizes, newSize]);
    }
  }

  void removeSize(String sizeToRemove) {
    state = state.copyWith(
      sizes: state.sizes.where((s) => s != sizeToRemove).toList(),
    );
  }

  void toggleSize(String size) {
    if (state.sizes.contains(size)) {
      if (size == "S") {
        removeSize(size);
        state = state.copyWith(isSizeOnS: false);
      } else if (size == "M") {
        removeSize(size);
        state = state.copyWith(isSizeOnM: false);
      } else if (size == "L") {
        removeSize(size);
        state = state.copyWith(isSizeOnL: false);
      } else if (size == "XS") {
        removeSize(size);
        state = state.copyWith(isSizeOnXS: false);
      } else {
        removeSize(size);
        state = state.copyWith(isSizeOnXL: false);
      }
    } else {
      if (size == "S") {
        addSize(size);
        state = state.copyWith(isSizeOnS: true);
      } else if (size == "M") {
        addSize(size);
        state = state.copyWith(isSizeOnM: true);
      } else if (size == "L") {
        addSize(size);
        state = state.copyWith(isSizeOnL: true);
      } else if (size == "XS") {
        addSize(size);
        state = state.copyWith(isSizeOnXS: true);
      } else {
        addSize(size);
        state = state.copyWith(isSizeOnXL: true);
      }
    }
  }

  void setCategory(String category) {
    state = state.copyWith(category: category);
  }

  //function to set fields below
  //function to setBrand
  void setBrand (String brandName){
    state= state.copyWith(brand: brandName);
  }

  //function to setModel
  void setModel (String modelName){
    state= state.copyWith(model: modelName);
  }

  void setBrandChangeValue(bool isBrandChanged){
    state= state.copyWith(isBrandChanged: isBrandChanged);
  }

  void setRomItem(String romItem) {
    state = state.copyWith(romItem: romItem);
  }

  void setRamItem(String ramItem) {
    state = state.copyWith(ramItem: ramItem);
  }

  void setCondition(String condition) {
    state = state.copyWith(condition: condition);
  }

  void setLocation(String location) {
    state = state.copyWith(location: location);
  }
  void setBrandSelectedValue(bool value){
    state= state.copyWith(brandSelection: true);
  }


  Future<void> uploadItem(String name, String price, String description) async {
    state = state.copyWith(name: name);
    state = state.copyWith(price: price);
    state = state.copyWith(description: description);
    if (state.name.isNotEmpty &&
        state.price.isNotEmpty &&
        state.category.isNotEmpty &&
        state.description.isNotEmpty&&
        state.image!=null&&
        state.sizes.isNotEmpty) {
      try {
        state = state.copyWith(isLoading: true);
        final firestore = FirebaseFirestore.instance;
        final userId = FirebaseAuth.instance.currentUser!.uid;
        state.sizes.sort();
        await uploadImageToDatabase();
        Timestamp timestamp = Timestamp.fromDate(DateTime.now());
        state = state.copyWith(createdOn: timestamp);
       final docRef=  await firestore.collection("users").doc(userId).collection("clothes").add({
         "name": state.name,
         "description": state.description,
         "price": state.price,
         "category": state.category,
         "availableSizes": state.sizes,
         "image": state.imageUrl,
         "createdOn": state.createdOn,
       });

       if(docRef.id.isNotEmpty){
         state=state.copyWith(uploadSuccess: true);
         SecondToastHelper.success("Item Successfully uploaded");
       }



      } catch (e) {
        SecondToastHelper.error(e.toString());
      } finally {
        state = state.copyWith(isLoading: false);
      }
    } else {
      SecondToastHelper.error("All fields must be filled");
    }
  }
}

final postAddStateNotifier =
    StateNotifierProvider.autoDispose<PostAddNotifier, ImageClass>((ref) {
      return PostAddNotifier(ref.read(imageProvider));
    });
