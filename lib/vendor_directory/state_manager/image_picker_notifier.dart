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
    final compressedImage = await imagePickerService.compressImage(image.path);
    if (compressedImage == null) return;
    state = state.copyWith(image: compressedImage);
  }

  Future<void> uploadImageToDatabase() async {
    if (state.image == null) return;

    final fileName = DateTime.now().millisecondsSinceEpoch.toString();
    final ref = FirebaseStorage.instance.ref("images").child(fileName);

    final uploadTask = await ref.putFile(state.image!);

    final imageUrl = await uploadTask.ref.getDownloadURL();

    state = state.copyWith(imageUrl: imageUrl);

  }

  Future<void> pickImageFromCamera() async {
    final File? image = await imagePickerService.pickImageFromCamera();

    if (image == null) return;
    //compressImage
    final compressedImage = await imagePickerService.compressImage(image.path);
    if (compressedImage == null) return;
    state = state.copyWith(image: compressedImage);
  }

  //method to switch yes or no swaps
  void yesToggleSwapOption() {
    state = state.copyWith(isYes: !state.isYes);
    state = state.copyWith(isNo: false);
  }

  //method to switch yes or no swaps
  void noToggleSwapOption() {
    state = state.copyWith(isNo: !state.isNo);
    state = state.copyWith(isYes: false);
  }

  //function to set fields below
  //function to setBrand
  void setBrand(String brandName) {
    state = state.copyWith(brand: brandName);
  }

  //function to setModel
  void setModel(String modelName) {
    state = state.copyWith(model: modelName);
  }

  void setBrandChangeValue(bool isBrandChanged) {
    state = state.copyWith(isBrandChanged: isBrandChanged);
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

  void setBrandSelectedValue(bool value) {
    state = state.copyWith(brandSelection: true);
  }
  //function to convert string price to int
  int parsePriceString(String input) {
    input = input.trim();
    String cleaned = input.replaceAll('#', '').replaceAll(',', '').trim();
    // Try to parse as integer
    return int.tryParse(cleaned) ?? 0;
  }


  Future<void> uploadItem(String price, String description) async {
    final int priceInInt =parsePriceString(price);
    state = state.copyWith(price: price);
    state = state.copyWith(description: description);
    if (state.price.isNotEmpty &&
        state.description.isNotEmpty &&
        state.image != null &&
        state.brand.isNotEmpty &&
        state.model.isNotEmpty &&
        state.ramItem.isNotEmpty &&
        state.romItem.isNotEmpty &&
        state.condition.isNotEmpty &&
        state.location.isNotEmpty &&
        (state.isYes == true || state.isNo == true)) {
      try {
        state = state.copyWith(isLoading: true);
        final firestore = FirebaseFirestore.instance;
        final userId = FirebaseAuth.instance.currentUser!.uid;

        await uploadImageToDatabase();
        Timestamp timestamp = Timestamp.fromDate(DateTime.now());
        state = state.copyWith(createdOn: timestamp);

        final docIdAsInt = DateTime.now().millisecondsSinceEpoch;
        final docId =docIdAsInt.toString();
        state=state.copyWith(docId: docIdAsInt);
        //add for the general market
        final marketRef = await firestore.collection("market").doc(docId).set({
          "description": state.description,
          "price": state.price,
          "brand": state.brand,
          "model": state.model,
          "ram": state.ramItem,
          "rom": state.romItem,
          "condition": state.condition,
          "location": state.location,
          "imageUrl": state.imageUrl,
          "createdOn": state.createdOn,
          "isYes": state.isYes,
          "isNo": state.isNo,
          "docId": docIdAsInt,
          "intPrice": priceInInt,
        });
        //add for each individual user
        final docRef = await firestore
            .collection("users")
            .doc(userId)
            .collection("phones")
            .doc(docId)
            .set({
              "description": state.description,
              "price": state.price,
              "brand": state.brand,
              "model": state.model,
              "ram": state.ramItem,
              "rom": state.romItem,
              "condition": state.condition,
              "location": state.location,
              "imageUrl": state.imageUrl,
              "createdOn": state.createdOn,
              "isYes": state.isYes,
              "isNo": state.isNo,
          "docId": docIdAsInt,
          "intPrice": priceInInt,
            });

        if (true) {
          state = state.copyWith(uploadSuccess: true);
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
