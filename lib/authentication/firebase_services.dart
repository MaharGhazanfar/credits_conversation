import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

  static Future<String> signOut() async {
    final String providerID =
        FirebaseAuth.instance.currentUser!.providerData.first.providerId;
    // log('providerID = $providerID');
    switch (providerID) {
      case 'google.com':
        log('case google.com');
        try {
          await GoogleSignIn().disconnect().then((value) async {
            await FirebaseAuth.instance.signOut().asStream();
          });
          return 'Success';
        } catch (e) {
          return 'Could not log out';
        }
      case 'facebook.com':
        log('case facebook.com');
        try {
          await FacebookAuth.instance.logOut().then((value) async {
            FirebaseAuth.instance.signOut().asStream();
          });
          return 'Success';
        } catch (e) {
          return 'Could not log out';
        }
      default:
        log('case password or apple');
        try {
          await FirebaseAuth.instance.signOut().asStream();
          return 'Success';
        } catch (e) {
          return 'Could not log out';
        }
    }
  }
}
