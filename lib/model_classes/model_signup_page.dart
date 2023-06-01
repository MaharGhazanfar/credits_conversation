import 'dart:io';

import 'package:flutter/cupertino.dart';

class ModelSignUpPage extends ChangeNotifier {
  String? _imagePath;
  String? firstName;
  String? lastName;
  String? emailAddress;
  String? password;
  String? dateOfBirth;
  String? _gender;
  String? phoneNumber;
  File? _image;

  ModelSignUpPage({
    this.firstName,
    this.lastName,
    this.emailAddress,
    this.password,
    this.dateOfBirth,
    this.phoneNumber,
    String? imagePath,
    String? gender,
  })  : _imagePath = imagePath,
        _gender = gender;

  bool _isObscure = true;
  double _opacity = 1;
  bool _isLoading = false;

  File? get image => _image;

  set image(File? value) {
    _image = value;
    notifyListeners();
  }

  String get imagePath => _imagePath!;

  set imagePath(String value) {
    _imagePath = value;
    notifyListeners();
  }

  String? get gender => _gender;

  set gender(String? value) {
    _gender = value;
    notifyListeners();
  }

  bool get isObscure => _isObscure;

  set isObscure(bool value) {
    _isObscure = value;
    notifyListeners();
  }

  double get opacity => _opacity;

  set opacity(double value) {
    _opacity = value;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  static String IMAGEPATH = 'Image Path';
  static String FIRSTNAME = 'First Name';
  static String LASTNAME = 'Last Name';
  static String EMAILADDRESS = 'Email';
  static String PASSWORD = 'Password';
  static String DATEOFBIRTH = 'Date of Birth';
  static String GENDER = 'Gender';
  static String PHONENUMBER = 'Phone Number';

  Map<String, dynamic> toMap() {
    return {
      IMAGEPATH: imagePath,
      FIRSTNAME: firstName,
      LASTNAME: lastName,
      EMAILADDRESS: emailAddress,
      PASSWORD: password,
      DATEOFBIRTH: dateOfBirth,
      GENDER: gender,
      PHONENUMBER: phoneNumber,
    };
  }
}
