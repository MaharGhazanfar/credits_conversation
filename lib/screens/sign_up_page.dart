import 'dart:developer';

import 'package:badges/badges.dart' as badges;
import 'package:credit_and_conversation/authentication/authentication.dart';
import 'package:credit_and_conversation/models/models.dart';
import 'package:credit_and_conversation/screens/screens.dart';
import 'package:credit_and_conversation/utils/utils.dart';
import 'package:credit_and_conversation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  DateTime selectedDate = DateTime.now();
  final FocusNode _focusNode = FocusNode();

  final List<String> options = ['Male', 'Female', 'Other'];

  late final modelSignUpPage;
  String? phoneNumber;

  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController dateController;
  late TextEditingController genderController;
  final globalKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    modelSignUpPage = Provider.of<ModelSignUpPage>(context, listen: false);
    emailController = TextEditingController();
    passwordController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    dateController = TextEditingController();
    confirmPasswordController = TextEditingController();
    genderController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    dateController.dispose();

    genderController.dispose();
    super.dispose();
  }

  Future<void> _showDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1970, 8),
        lastDate: DateTime(2101));
    if (picked != null) {
      log(DateFormat("yyyy-MM-dd").format(picked));
      dateController.text = DateFormat("yyyy-MM-dd").format(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Form(
                  key: globalKey,
                  child: Column(
                    children: [
                      badges.Badge(
                        badgeContent: Icon(
                          Icons.camera_alt,
                          size: mq.width * 0.05,
                        ),
                        position:
                            badges.BadgePosition.bottomEnd(bottom: 5, end: 10),
                        showBadge: true,
                        stackFit: StackFit.passthrough,
                        onTap: () async {
                          var status = await Permission.storage.request();
                          if (status.isGranted) {
                            modelSignUpPage.image = await AuthenticationService
                                .pickImageFromMedia();
                            setState(() {
                              if (modelSignUpPage.image != null) {
                                return null;
                              } else {
                                AuthenticationService.ShowCustomToast(
                                    msg: 'No Image selected');
                              }
                            });
                          }
                        },
                        child: Consumer<ModelSignUpPage>(
                          builder: (context, value, child) => CircleAvatar(
                              radius: mq.width * 0.18,
                              backgroundColor: Colors.white,
                              backgroundImage: value.image != null
                                  ? FileImage(value.image!)
                                  : null,
                              child: value.image == null
                                  ? Icon(
                                      Icons.person,
                                      color: goldenColor,
                                      size: mq.width * 0.18,
                                    )
                                  : null),
                        ),
                      ),
                      CustomTextField(
                        hintText: 'First Name',
                        controller: firstNameController,
                        prefixIcon: Icons.person,
                        textInputType: TextInputType.text,
                        validator: (value) {
                          if (value!.isNotEmpty) {
                            return null;
                          } else {
                            return 'required';
                          }
                        },
                      ),
                      CustomTextField(
                        hintText: 'Last Name',
                        controller: lastNameController,
                        textInputType: TextInputType.text,
                        validator: (value) {
                          if (value!.isNotEmpty) {
                            return null;
                          } else {
                            return 'required';
                          }
                        },
                        prefixIcon: Icons.person,
                      ),
                      CustomTextField(
                        hintText: 'Enter email address ',
                        controller: emailController,
                        textInputType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isNotEmpty) {
                            if (value.contains('@') && value.contains('.com')) {
                              return null;
                            } else {
                              return 'InValid gmail';
                            }
                          } else {
                            return 'required';
                          }
                        },
                        prefixIcon: Icons.mail,
                      ),
                      Consumer<ModelSignUpPage>(
                        builder: (context, value, child) => CustomTextField(
                          hintText: 'Create password',
                          prefixIcon: Icons.lock,
                          textInputType: TextInputType.visiblePassword,
                          controller: passwordController,
                          obscureText: value.isObscure,
                          validator: (value) {
                            if (value!.isNotEmpty) {
                              return null;
                            } else {
                              return 'required';
                            }
                          },
                          suffix: InkWell(
                            onTapDown: (details) => value.isObscure = false,
                            onTapUp: (details) => value.isObscure = true,
                            child: Icon(
                              color: goldenColor,
                              value.isObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              //color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Consumer<ModelSignUpPage>(
                        builder: (context, value, child) => CustomTextField(
                          hintText: 'Confirm password',
                          prefixIcon: Icons.lock,
                          textInputType: TextInputType.visiblePassword,
                          controller: confirmPasswordController,
                          obscureText: value.isObscure,
                          validator: (value) {
                            if (value!.isNotEmpty) {
                              if (value.toString() ==
                                  passwordController.text.toString()) {
                                return null;
                              } else {
                                return 'Password not matched';
                              }
                            } else {
                              return 'Required';
                            }
                          },
                          suffix: InkWell(
                            onTapDown: (details) => value.isObscure = false,
                            onTapUp: (details) => value.isObscure = true,
                            child: Icon(
                              color: goldenColor,
                              value.isObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              //color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      CustomTextField(
                        hintText: '${selectedDate.toLocal()}'.split(' ')[0],
                        focusNode: _focusNode,
                        controller: dateController,
                        validator: (value) {
                          if (value!.isNotEmpty) {
                            return null;
                          } else {
                            return 'required';
                          }
                        },
                        prefixIcon: Icons.calendar_month_sharp,
                        onTap: () async {
                          _focusNode.unfocus();
                          _showDatePicker(context);
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Consumer<ModelSignUpPage>(
                          builder: (context, value, child) =>
                              DropdownButtonFormField<String>(
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              constraints: const BoxConstraints(maxHeight: 60),
                              prefixIcon: const Icon(Icons.person),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Select your gender',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            value: value.gender,
                            borderRadius: BorderRadius.circular(10),
                            elevation: 5,
                            validator: (value) {
                              if (value!.isNotEmpty) {
                                return null;
                              } else {
                                return 'required';
                              }
                            },
                            onChanged: (String? newValue) {
                              value.gender = newValue!;
                            },
                            items: options
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: const TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IntlPhoneField(
                          dropdownIconPosition: IconPosition.trailing,
                          flagsButtonPadding:
                              const EdgeInsets.only(left: 5, top: 5),
                          flagsButtonMargin: const EdgeInsets.only(
                            left: 5,
                          ),
                          decoration: InputDecoration(
                            prefixStyle: const TextStyle(
                              color: Colors.black54,
                              fontSize: 18,
                              //    fontWeight: FontWeight.bold
                            ),
                            errorStyle: const TextStyle(
                                color: Colors.red,
                                leadingDistribution:
                                    TextLeadingDistribution.even),
                            hintText: 'Phone Number',
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onChanged: (phone) {
                            print(phone.completeNumber);
                            phoneNumber = phone.completeNumber;
                          },
                          style: const TextStyle(
                              fontSize: 18, color: Colors.black54),
                          // onCountryChanged: (country) {
                          //   log('Country changed to: ${country.name}///${country.dialCode}');
                          //   //countryCode = country.dialCode;
                          // },
                          validator: (value) {
                            if (value!.toString().isNotEmpty) {
                              return null;
                            } else {
                              return 'required';
                            }
                          },
                          autovalidateMode: AutovalidateMode.disabled,
                          dropdownTextStyle: const TextStyle(
                              color: Colors.black54, fontSize: 18),
                          pickerDialogStyle: PickerDialogStyle(
                              countryNameStyle: const TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.normal),
                              countryCodeStyle:
                                  const TextStyle(color: Colors.black54)),
                        ),
                      ),
                      CustomGoldenButton(
                        buttonTitle: 'Create Account',
                        onPressed: () async {
                          if (modelSignUpPage.image != null) {
                            if (globalKey.currentState!.validate()) {
                              if (modelSignUpPage.gender != null) {
                                modelSignUpPage.isLoading = true;
                                modelSignUpPage.opacity = 0.5;

                                var status = await AuthenticationService
                                    .SignUpWithEmailPas(
                                        password: passwordController.text,
                                        email: emailController.text);

                                if (status == 'Account created') {
                                  var imgPath =
                                      await AuthenticationService.uploadImage(
                                          modelSignUpPage.image);
                                  var createdUser = ModelSignUpPage(
                                      firstName: firstNameController.text,
                                      lastName: lastNameController.text,
                                      emailAddress: emailController.text,
                                      password: passwordController.text,
                                      phoneNumber: phoneNumber,
                                      dateOfBirth: dateController.text,
                                      imagePath: imgPath,
                                      gender: modelSignUpPage.gender);

                                  DBHandler.userCollection()
                                      .doc('${DBHandler.userUid}')
                                      .set(createdUser.toMap());

                                  modelSignUpPage.isLoading = false;
                                  modelSignUpPage.opacity = 1.0;

                                  modelSignUpPage.image = null;

                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DiscoveryPage()),
                                      (Route<dynamic> route) => false);
                                } else {
                                  modelSignUpPage.isLoading = false;
                                  modelSignUpPage.opacity = 1.0;

                                  AuthenticationService.ShowCustomToast(
                                      msg: status);
                                }
                              } else {
                                AuthenticationService.ShowCustomToast(
                                    msg: 'Please select your gender');
                              }
                            }
                          } else {
                            AuthenticationService.ShowCustomToast(
                                msg: 'Please pick image');
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Consumer<ModelSignUpPage>(
                    builder: (context, value, child) => value.isLoading
                        ? ShowProgressIndicator(
                            opacity: value.opacity,
                          )
                        : SizedBox())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
