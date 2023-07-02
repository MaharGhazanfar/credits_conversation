import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DBHandler {
  static User? user = FirebaseAuth.instance.currentUser;
  static String userUid = user!.uid;

  static CollectionReference userCollection() {
    return FirebaseFirestore.instance.collection('Users');
  }
}
