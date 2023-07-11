import 'dart:developer';

import 'package:credit_and_conversation/authentication/authentication.dart';
import 'package:credit_and_conversation/constants/constants.dart';
import 'package:credit_and_conversation/models/models.dart';
import 'package:credit_and_conversation/screens/screens.dart';
import 'package:credit_and_conversation/utils/utils.dart';
import 'package:credit_and_conversation/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final globalKey = GlobalKey<FormState>();
  late final modelSignUpPage;

  @override
  void initState() {
    super.initState();
    modelSignUpPage = Provider.of<ModelSignUpPage>(context, listen: false);
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Stack(
              children: [
                Form(
                  key: globalKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: mq.height * 0.05),
                        height: mq.height * 0.25,
                        width: mq.width * 0.8,
                        alignment: Alignment.center,
                        child: Image.asset(AppImages.logo),
                      ),
                      SizedBox(
                        height: mq.height * 0.03,
                      ),
                      CustomTextField(
                        hintText: 'Enter your email here',
                        prefixIcon: Icons.mail,
                        controller: emailController,
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
                        textInputType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: mq.height * 0.01,
                      ),
                      Consumer<ModelSignUpPage>(
                        builder: (context, value, child) => CustomTextField(
                          hintText: 'Password',
                          prefixIcon: Icons.lock_open_rounded,
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
                            onTap: () {
                              value.isObscure = !value.isObscure;
                            },
                            radius: 5,
                            child: Icon(
                              color: goldenColor,
                              value.isObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: mq.height * 0.02, bottom: mq.height * 0.02),
                        child: Row(
                          children: [
                            const Text(
                              'Forget your password? ',
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ForgotPassword(),
                                      ));
                                },
                                child: const Text(
                                  'Reset here',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                )),
                          ],
                        ),
                      ),
                      CustomGoldenButton(
                        buttonTitle: 'Login',
                        onPressed: () async {
                          if (globalKey.currentState!.validate()) {
                            modelSignUpPage.isLoading = true;
                            modelSignUpPage.opacity = 0.5;
                            final String authStatus =
                                await AuthenticationService.signInWithEmail(
                              password: passwordController.text,
                              email: emailController.text,
                            );

                            modelSignUpPage.isLoading = false;
                            modelSignUpPage.opacity = 1.0;

                            if (authStatus == 'Login Successful') {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => DiscoveryPage()),
                                  (Route<dynamic> route) => false);
                            } else {
                              AppToast.ShowCustomToast(
                                msg: authStatus,
                              );
                            }
                          }
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: mq.height * 0.03, bottom: mq.height * 0.03),
                        child: const Text('or continue with'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  backgroundColor: Colors.white),
                              onPressed: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Icon(
                                  Icons.document_scanner,
                                  color: goldenColor,
                                ),
                              )),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  backgroundColor: Colors.white),
                              onPressed: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Icon(
                                  Icons.apple,
                                  color: goldenColor,
                                ),
                              )),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  backgroundColor: Colors.white),
                              onPressed: () async {
                                UserCredential user =
                                    await AuthenticationService
                                        .signInWithFacebook();

                                modelSignUpPage.isLoading = true;
                                modelSignUpPage.opacity = 0.5;

                                var createdUser = ModelSignUpPage(
                                    firstName: user.additionalUserInfo!
                                        .profile!['first_name'],
                                    lastName: user.additionalUserInfo!
                                        .profile!['last_name'],
                                    emailAddress: user
                                        .additionalUserInfo!.profile!['email'],
                                    password: "Can't be accessed",
                                    phoneNumber: user.user!.phoneNumber,
                                    dateOfBirth: user.additionalUserInfo!
                                        .profile!['birthday'],
                                    imagePath: user.additionalUserInfo!
                                        .profile!['picture']['data']['url'],
                                    gender: 'Not provided');

                                await DBHandler.userCollection()
                                    .doc('${DBHandler.userUid}')
                                    .set(createdUser.toMap());

                                modelSignUpPage.isLoading = false;
                                modelSignUpPage.opacity = 1.0;

                                if (user.credential!.providerId ==
                                    'facebook.com') {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DiscoveryPage()),
                                      (Route<dynamic> route) => false);
                                } else {
                                  AppToast.ShowCustomToast(
                                      msg: 'Something went wrong');
                                }

                                log('${user.additionalUserInfo!.profile}///////////');
                                log('${user.additionalUserInfo!.profile!['picture']['data']['url']}///////////');
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Icon(
                                  Icons.facebook,
                                  color: goldenColor,
                                ),
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have account? ",
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const SignUpPage(),
                                    ));
                              },
                              child: const Text(
                                'Sign up',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              )),
                        ],
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
