import 'package:credit_and_conversation/model_classes/model_signup_page.dart';
import 'package:credit_and_conversation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';

import '../authentication/authentication_service.dart';
import '../widgets/widgets.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  late TextEditingController _emailController;

  late final modelSignUpPage;

  @override
  void initState() {
    super.initState();
    modelSignUpPage = Provider.of<ModelSignUpPage>(context, listen: false);
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Forgot password',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.only(
                  top: mq.height * 0.05,
                  left: mq.width * 0.07,
                  right: mq.width * 0.07,
                ),
                child: Stack(alignment: AlignmentDirectional.center, children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                            'Enter your email address to receive link to reset password',
                            style: Theme.of(context).textTheme.titleSmall!),
                        SizedBox(height: mq.height * 0.07),
                        TextFormField(
                          controller: _emailController,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: mq.height * 0.01),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade400),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade400),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade400),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade400),
                              ),
                              constraints:
                                  BoxConstraints(maxHeight: mq.height * 0.07),
                              hintText: 'Email address',
                              hintStyle:
                                  Theme.of(context).textTheme.titleSmall!,
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: Theme.of(context).iconTheme.color,
                              )),
                        ),
                        SizedBox(height: mq.height * 0.07),
                        CustomGoldenButton(
                          buttonTitle: 'Reset Password',
                          onPressed: () async {
                            if (await InternetConnectionChecker()
                                .hasConnection) {
                              if (_emailController.text.isNotEmpty) {
                                if (_emailController.text.contains('@') &&
                                    _emailController.text.contains('.com')) {
                                  modelSignUpPage.isLoading = true;
                                  modelSignUpPage.opacity = 0.5;
                                  final status =
                                      await AuthenticationService.resetPWD(
                                          email: _emailController.text);
                                  modelSignUpPage.isLoading =
                                      !modelSignUpPage.isLoading;
                                  modelSignUpPage.opacity = 1.0;
                                  Fluttertoast.showToast(
                                      msg: status,
                                      backgroundColor: status ==
                                              'password reset link sent successfully'
                                          ? Colors.green
                                          : Colors.red);
                                  if (status ==
                                      'password reset link sent successfully') {
                                    Navigator.pop(context);
                                    // Navigator.pushAndRemoveUntil(
                                    //     context,
                                    //     PageTransition(
                                    //         type:
                                    //             PageTransitionType.rightToLeft,
                                    //         child: LoginPage()),
                                    //     (route) => false);
                                  }
                                } else {
                                  AuthenticationService.ShowCustomToast(
                                      msg: 'Invalid email provided');
                                }
                              } else {
                                AuthenticationService.ShowCustomToast(
                                    msg: 'Email is empty');
                              }
                            } else {
                              AuthenticationService.ShowCustomToast(
                                  msg: 'No internet connection');
                            }
                          },
                        )
                      ]),
                  Consumer<ModelSignUpPage>(
                      builder: (context, value, child) => value.isLoading
                          ? ShowProgressIndicator(
                              opacity: value.opacity,
                            )
                          : SizedBox()),
                ]))));
  }
}