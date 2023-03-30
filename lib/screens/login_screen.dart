import 'package:credit_and_conversation/screens/screens.dart';
import 'package:credit_and_conversation/utils/utils.dart';
import 'package:credit_and_conversation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

late Size mq;

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
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
                const CustomTextField(
                  hintText: 'Enter your email here',
                  prefixIcon: Icons.mail,
                  textInputType: TextInputType.visiblePassword,
                ),
                SizedBox(
                  height: mq.height * 0.01,
                ),
                const CustomTextField(
                  hintText: 'Password',
                  prefixIcon: Icons.lock_open_rounded,
                  textInputType: TextInputType.emailAddress,
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
                          onPressed: () {},
                          child: const Text(
                            'Reset here',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          )),
                    ],
                  ),
                ),
                CustomGoldenButton(
                  buttonTitle: 'Login',
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const DiscoveryPage(),
                    ));
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
        ),
      ),
    );
  }
}
