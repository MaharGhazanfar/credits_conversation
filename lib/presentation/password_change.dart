import 'package:credit_and_conversation/presentation/my_profile_page.dart';
import 'package:flutter/material.dart';

import '../custom_widgets/customTextField.dart';
import 'login_screen.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
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
          'Password Change',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                child: Text(
                  'Your new password must be different from the previous password',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              SizedBox(
                height: mq!.height * 0.05,
              ),
              const CustomTextField(
                hintText: 'Old Password',
                prefixIcon: Icons.lock_open_rounded,
                textInputType: TextInputType.emailAddress,
              ),
              const CustomTextField(
                hintText: 'New Password',
                prefixIcon: Icons.lock_open_rounded,
                textInputType: TextInputType.emailAddress,
              ),
              const CustomTextField(
                hintText: 'Confirm Password',
                prefixIcon: Icons.lock_open_rounded,
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: mq!.height * 0.05,
              ),
              CustomGoldenButton(
                buttonTitle: 'Change',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyProfilePage(),
                      ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
