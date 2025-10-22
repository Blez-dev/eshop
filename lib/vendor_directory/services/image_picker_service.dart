import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class ImagePickerService {
  ImagePicker picker = ImagePicker();
  File? file;

  Future<File?> pickImageFromGallery() async {
    //pick image
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    //check if image is picked or not
    if (pickedImage == null) return null;

    file = File(pickedImage.path);
    return file;
  }


  Future<File?> pickImageFromCamera() async {
    //pick image
    final pickedImage = await picker.pickImage(source: ImageSource.camera);

    //check if image is picked or not
    if (pickedImage == null) return null;

    file = File(pickedImage.path);
    return file;

  }

  Future<File?> compressImage(String path) async {
    final dir = await getTemporaryDirectory();
    final targetPath = join(
      dir.path,
      'compressed_${DateTime.now().millisecondsSinceEpoch}.jpg',
    );

    final compressedFile = await FlutterImageCompress.compressAndGetFile(
      path,
      targetPath,
      quality: 60,
    );

    if (compressedFile == null) return null;

    final file = File(compressedFile.path);
    return file;
  }




}
final imageProvider = Provider((ref){
  return ImagePickerService();
});
