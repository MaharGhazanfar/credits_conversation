import 'dart:io';

import 'package:credit_and_conversation/authentication/authentication.dart';
import 'package:credit_and_conversation/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class AuthenticationService {
  static Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login(
      permissions: ['public_profile', 'email', 'user_birthday'],
    );

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  static Future<String> signInWithEmail(
      {required String password, required String email}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return 'Login Successful';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user';
      }
    }
    return 'SomeThing Went Wrong';
  }

  static Future<String> SignUpWithEmailPas(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return 'Account created';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
    } catch (e) {
      print(e);
      return 'SomeThing went wrong';
    }
    return 'Please try again later';
  }

  static Future<String> resetPWD({required String email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return 'password reset link sent successfully';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'user-not-found';
      } else {
        return 'Something went wrong';
      }
    }
  }

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

  static ShowCustomToast({required String msg, double? fontSize = 16}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: goldenColor,
        textColor: Colors.white,
        fontSize: fontSize);
  }
}
