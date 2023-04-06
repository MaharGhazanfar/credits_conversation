import 'package:credit_and_conversation/screens/screens.dart';
import 'package:credit_and_conversation/utils/utils.dart';
import 'package:credit_and_conversation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../authentication/authentication_service.dart';
import '../model_classes/model_signup_page.dart';

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
                          child: Image.asset('assets/1.jpeg')),
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
                      Padding(
                        padding: EdgeInsets.only(
                            top: mq.height * 0.02, bottom: mq.height * 0.02),
                        child: Row(
                          children: [
                            const Text(
                              'Forget your password ? ',
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

                            var status =
                                await AuthenticationService.signInWithEmail(
                                    password: passwordController.text,
                                    email: emailController.text);

                            modelSignUpPage.isLoading = false;
                            modelSignUpPage.opacity = 1.0;

                            if (status == 'Login Successful') {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => DiscoveryPage()),
                                  (Route<dynamic> route) => false);
                            } else {
                              AuthenticationService.ShowCustomToast(
                                  msg: status);
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
                              onPressed: () {},
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

  // void resetDialogue() {
  //   TextEditingController _emailController = TextEditingController();
  //   showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       backgroundColor: Colors.black54,
  //       title: Text('Reset Password'),
  //       content: Stack(
  //         children: [
  //           Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
  //             Text('Enter your email address to receive link to reset password',
  //                 style: Theme.of(context).textTheme.titleMedium!),
  //             SizedBox(height: mq.height * 0.05),
  //             TextFormField(
  //               controller: _emailController,
  //               textAlignVertical: TextAlignVertical.center,
  //               decoration: InputDecoration(
  //                   contentPadding:
  //                       EdgeInsets.symmetric(vertical: mq.height * 0.01),
  //                   border: OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(5),
  //                     borderSide: BorderSide(color: Colors.grey.shade400),
  //                   ),
  //                   enabledBorder: OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(5),
  //                     borderSide: BorderSide(color: Colors.grey.shade400),
  //                   ),
  //                   focusedBorder: OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(5),
  //                     borderSide: BorderSide(color: Colors.grey.shade400),
  //                   ),
  //                   errorBorder: OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(5),
  //                     borderSide: BorderSide(color: Colors.grey.shade400),
  //                   ),
  //                   constraints: BoxConstraints(maxHeight: mq.height * 0.07),
  //                   hintText: 'Email address',
  //                   hintStyle: Theme.of(context).textTheme.titleSmall!,
  //                   prefixIcon: Icon(
  //                     Icons.email_outlined,
  //                     color: Theme.of(context).iconTheme.color,
  //                   )),
  //             ),
  //             SizedBox(height: mq.height * 0.03),
  //           ]),
  //           Consumer<ModelSignUpPage>(
  //               builder: (context, value, child) => value.isLoading
  //                   ? ShowProgressIndicator(
  //                       opacity: value.opacity,
  //                     )
  //                   : SizedBox()),
  //         ],
  //       ),
  //       actions: [
  //         CustomGoldenButton(
  //           onPressed: () => Navigator.of(context).pop(),
  //           buttonTitle: 'Cancel',
  //         ),
  //         CustomGoldenButton(
  //           buttonTitle: 'Reset',
  //           onPressed: () async {
  //             if (await InternetConnectionChecker().hasConnection) {
  //               if (_emailController.text.isNotEmpty) {
  //                 if (_emailController.text.contains('@') &&
  //                     _emailController.text.contains('.com')) {
  //                   modelSignUpPage.isLoading = true;
  //                   modelSignUpPage.opacity = 0.5;
  //                   final status = await AuthenticationService.resetPWD(
  //                       email: _emailController.text);
  //                   modelSignUpPage.isLoading = !modelSignUpPage.isLoading;
  //                   modelSignUpPage.opacity = 1.0;
  //                   Fluttertoast.showToast(
  //                       msg: status,
  //                       backgroundColor:
  //                           status == 'password reset link sent successfully'
  //                               ? Colors.green
  //                               : Colors.red);
  //                   if (status == 'password reset link sent successfully') {
  //                     Navigator.pop(context);
  //                     // Navigator.pushAndRemoveUntil(
  //                     //     context,
  //                     //     PageTransition(
  //                     //         type:
  //                     //             PageTransitionType.rightToLeft,
  //                     //         child: LoginPage()),
  //                     //     (route) => false);
  //                   }
  //                 } else {
  //                   AuthenticationService.ShowCustomToast(
  //                       msg: 'Invalid email provided');
  //                 }
  //               } else {
  //                 AuthenticationService.ShowCustomToast(msg: 'Email is empty');
  //               }
  //             } else {
  //               AuthenticationService.ShowCustomToast(
  //                   msg: 'No internet connection');
  //             }
  //           },
  //         )
  //       ],
  //     ),
  //   );
  // }
}
