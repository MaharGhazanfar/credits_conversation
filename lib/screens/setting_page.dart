import 'package:credit_and_conversation/screens/screens.dart';
import 'package:credit_and_conversation/utils/utils.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
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
                      builder: (context) => const AccountSettingPage(),
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
                      builder: (context) => const ChangePassword(),
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
              title: Text(
                'Delete Account',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              trailing: Icon(
                Icons.delete_outline,
                size: mq.width * 0.07,
                color: goldenColor,
              ),
            )
          ],
        ),
      )),
    );
  }
}
