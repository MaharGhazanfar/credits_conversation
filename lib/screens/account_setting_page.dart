import 'package:credit_and_conversation/widgets/custom_text_field_widget.dart';
import 'package:flutter/material.dart';

import '../utils/contants.dart';
import 'login_screen.dart';

class AccountSettingPage extends StatefulWidget {
  const AccountSettingPage({Key? key}) : super(key: key);

  @override
  State<AccountSettingPage> createState() => _AccountSettingPageState();
}

class _AccountSettingPageState extends State<AccountSettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // leading: IconButton(
        //   icon: const Icon(
        //     Icons.arrow_back_ios,
        //     size: 25,
        //   ),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
        title: Text(
          'Account Settings',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.edit))],
      ),
      body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: mq.width * 0.16,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                color: goldenColor,
                size: mq.width * 0.18,
              ),
            ),
            SizedBox(
              height: mq.height * 0.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomProfileField(
                  fieldTitle: 'First Name',
                  fieldValue: 'Keshia',
                  icon: Icons.person,
                  textWidth: mq.width * 0.28,
                  width: mq.width * 0.4,
                ),
                CustomProfileField(
                  fieldTitle: 'Last Name',
                  fieldValue: 'Carr',
                  icon: Icons.person,
                  textWidth: mq.width * 0.28,
                  width: mq.width * 0.4,
                )
              ],
            ),
            CustomProfileField(
              fieldTitle: 'Email',
              textWidth: mq.width * 0.77,
              fieldValue: 'mahargsdkj@gmail.com',
              icon: Icons.mail,
            ),
            const CustomProfileField(
              fieldTitle: 'Password',
              fieldValue: '********',
              icon: Icons.lock,
            ),
            const CustomProfileField(
              fieldTitle: 'Birth Date',
              fieldValue: '2023-02-15',
              icon: Icons.calendar_month,
            ),
            const CustomProfileField(
              fieldTitle: 'Gender',
              fieldValue: 'Male',
              icon: Icons.person,
            ),
            const CustomProfileField(
              fieldTitle: 'Phone Number',
              fieldValue: '+923324645721',
              icon: Icons.phone,
            )
          ],
        ),
      ))),
    );
  }
}
