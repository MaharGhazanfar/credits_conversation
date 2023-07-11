import 'package:credit_and_conversation/authentication/authentication.dart';
import 'package:credit_and_conversation/constants/constants.dart';
import 'package:credit_and_conversation/models/models.dart';
import 'package:credit_and_conversation/screens/screens.dart';
import 'package:credit_and_conversation/utils/utils.dart';
import 'package:credit_and_conversation/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({
    Key? key,
  }) : super(key: key);

  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmNewPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var modelSignUpPage = Provider.of<ModelSignUpPage>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 25,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Update Password',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                        child: Text(
                          'Your new password must be different from the previous password',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      SizedBox(
                        height: mq.height * 0.05,
                      ),
                      Consumer<ModelSignUpPage>(
                        builder: (context, value, child) => CustomTextField(
                          hintText: 'Current Password',
                          prefixIcon: Icons.lock_open_rounded,
                          textInputType: TextInputType.visiblePassword,
                          controller: _currentPasswordController,
                          obscureText: value.isObscure,
                          validator: (value) {
                            if (value!.isNotEmpty) {
                              return null;
                            } else {
                              return 'Required';
                            }
                          },
                          suffix: InkWell(
                            onTapDown: (details) => value.isObscure = false,
                            onTapUp: (details) => value.isObscure = true,
                            radius: 5,
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
                          hintText: 'New Password',
                          prefixIcon: Icons.lock_open_rounded,
                          textInputType: TextInputType.visiblePassword,
                          controller: _newPasswordController,
                          obscureText: value.isObscure,
                          validator: (value) {
                            if (value!.isNotEmpty) {
                              if (value.length > 6) {
                                return null;
                              } else {
                                return 'Password must be greater than 6 characters';
                              }
                            } else {
                              return 'Required';
                            }
                          },
                          suffix: InkWell(
                            onTapDown: (details) => value.isObscure = false,
                            onTapUp: (details) => value.isObscure = true,
                            radius: 5,
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
                          hintText: 'Confirm New Password',
                          prefixIcon: Icons.lock_open_rounded,
                          textInputType: TextInputType.visiblePassword,
                          controller: _confirmNewPasswordController,
                          obscureText: value.isObscure,
                          validator: (value) {
                            if (value!.isNotEmpty) {
                              if (value == _newPasswordController.text) {
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
                            radius: 5,
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
                      SizedBox(
                        height: mq.height * 0.05,
                      ),
                      CustomGoldenButton(
                        buttonTitle: 'Update',
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            modelSignUpPage.isLoading = true;
                            modelSignUpPage.opacity = 0.5;

                            try {
                              User? user = FirebaseAuth.instance.currentUser;

                              AuthCredential credential =
                                  EmailAuthProvider.credential(
                                email: user!.email!,
                                password: _currentPasswordController.text,
                              );
                              await user
                                  .reauthenticateWithCredential(credential);
                              await user
                                  .updatePassword(_newPasswordController.text);

                              await DBHandler.userCollection()
                                  .doc(user.uid)
                                  .update({
                                ModelSignUpPage.PASSWORD:
                                    _newPasswordController.text
                              });

                              modelSignUpPage.isLoading = false;
                              modelSignUpPage.opacity = 1.0;
                              AppToast.ShowCustomToast(
                                  msg: 'Password updated successfully');

                              Navigator.of(context).pop();
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'wrong-password') {
                                modelSignUpPage.isLoading = false;
                                modelSignUpPage.opacity = 1.0;
                                AppToast.ShowCustomToast(
                                    msg: 'The current password is incorrect');
                              } else {
                                modelSignUpPage.isLoading = false;
                                modelSignUpPage.opacity = 1.0;
                                AppToast.ShowCustomToast(
                                    msg:
                                        'An error occurred. Please try again later.');
                              }
                            }
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
