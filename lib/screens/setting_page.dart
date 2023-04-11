import 'package:credit_and_conversation/authentication/authentication_service.dart';
import 'package:credit_and_conversation/authentication/dbHandler.dart';
import 'package:credit_and_conversation/screens/screens.dart';
import 'package:credit_and_conversation/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({
    Key? key,
  }) : super(key: key);

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
          'Settings',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundColor: goldenColor,
                child: Icon(
                  Icons.person,
                  size: mq.width * 0.07,
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AccountSettingPage(),
                    ));
              },
              title: Text(
                'Account Setting',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                size: mq.width * 0.07,
                color: Colors.white,
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: goldenColor,
                child: Icon(
                  Icons.notifications,
                  size: mq.width * 0.07,
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotificationPage(),
                    ));
              },
              title: Text(
                'Notification Setting',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                size: mq.width * 0.07,
                color: Colors.white,
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: goldenColor,
                child: Icon(
                  Icons.lock,
                  size: mq.width * 0.07,
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangePassword(),
                    ));
              },
              title: Text(
                'Password Setting',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                size: mq.width * 0.07,
                color: Colors.white,
              ),
            ),
            const Divider(
              color: Colors.white60,
              endIndent: 10,
              indent: 10,
              thickness: 2,
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: goldenColor,
                child: Icon(
                  Icons.person_outline,
                  size: mq.width * 0.07,
                ),
              ),
              onTap: () async {
                if (DBHandler.user!.providerData[0].providerId ==
                    'facebook.com') {
                  await FacebookAuth.instance.logOut();

                  await FirebaseAuth.instance.signOut().whenComplete(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ));
                  }).onError((error, stackTrace) =>
                      AuthenticationService.ShowCustomToast(
                          msg: 'Something went wrong'));
                } else {
                  await FirebaseAuth.instance.signOut().whenComplete(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ));
                  }).onError((error, stackTrace) =>
                      AuthenticationService.ShowCustomToast(
                          msg: 'Something went wrong'));
                }
              },
              title: Text(
                'Logout',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              trailing: Icon(
                Icons.logout,
                size: mq.width * 0.07,
                color: goldenColor,
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: goldenColor,
                child: Icon(
                  Icons.person_outline,
                  size: mq.width * 0.07,
                ),
              ),
              title: Text(
                'Delete Account',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              trailing: Icon(
                Icons.delete_outline,
                size: mq.width * 0.07,
                color: goldenColor,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
