import 'dart:io';

import 'package:credit_and_conversation/authentication/authentication.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class PickImage {
  static Future<String> uploadImage(File imageFile) async {
    var firebaseStorageRef = FirebaseStorage.instance.ref();
    // var random = Random();
    //
    // var upload =
    //     firebaseStorageRef.child('Profiles/${random.nextInt(900000) + 100000}');
    var upload = firebaseStorageRef.child('Profiles/${DBHandler.userUid}');
    await upload.putFile(imageFile);

    return upload.getDownloadURL();
  }

  static Future<File> pickImageFromMedia() async {
    File? image;

    final ImagePicker picker = ImagePicker();

    final XFile? photo = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 250,
        maxHeight: 250,
        imageQuality: 80);

    image = File(photo!.path);

    return image;
  }
}
