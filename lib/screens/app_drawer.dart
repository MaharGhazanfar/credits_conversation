import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:credit_and_conversation/authentication/authentication.dart';
import 'package:credit_and_conversation/models/models.dart';
import 'package:credit_and_conversation/screens/screens.dart';
import 'package:credit_and_conversation/utils/utils.dart';
import 'package:credit_and_conversation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AppDrawer {
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();
  static Map<String, dynamic>? doc;
  static Widget appDrawer({required BuildContext context}) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: mq.height * 0.03,
            ),
            InkWell(
              onTap: () {
                _scaffoldKey.currentState!.closeDrawer();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingPage(),
                    ));
              },
              child: StreamBuilder<DocumentSnapshot>(
                  stream: DBHandler.userCollection()
                      .doc(DBHandler.userUid)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      doc = snapshot.data!.data() as Map<String, dynamic>?;
                      return Card(
                        elevation: 5,
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                        ),
                        child: Padding(
                          padding:
                              const EdgeInsets.only(top: 16.0, bottom: 16.0),
                          child: SizedBox(
                            width: mq.width * 0.7,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: CircleAvatar(
                                    backgroundColor: goldenColor,
                                    radius: 22,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      backgroundImage: doc != null
                                          ? NetworkImage(
                                              doc![ModelSignUpPage.IMAGEPATH])
                                          : null,
                                      child: doc == null
                                          ? Icon(
                                              Icons.person,
                                              color: goldenColor,
                                              size: mq.width * 0.10,
                                            )
                                          : null,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        doc != null
                                            ? '${doc![ModelSignUpPage.FIRSTNAME]} ${doc![ModelSignUpPage.LASTNAME]}'
                                            : 'null',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: mq.height * 0.01,
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 4.0),
                                            child: Text(
                                              'Basic Package',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                      color: Colors.black54),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {},
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: goldenColor,
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 6.0,
                                                    right: 6.0,
                                                    top: 2,
                                                    bottom: 2),
                                                child: Text(
                                                  'Become Premium',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall!
                                                      .copyWith(
                                                          color: Colors.black87,
                                                          fontSize: 9),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          color: goldenColor,
                        ),
                      );
                    }
                  }),
            ),
            SizedBox(
              height: mq.height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Notification',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.black),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NotificationPage(),
                          ));
                    },
                    child: Text(
                      'See all',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Colors.black, fontWeight: FontWeight.normal),
                    ),
                  )
                ],
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: goldenColor,
                radius: 22,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: mq.width * 0.07,
                  ),
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
                'Has upgraded package : 3 days trial',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Colors.black, fontSize: 14),
              ),
              subtitle: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: Text(
                      'Check it out',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.black54),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: goldenColor,
                radius: 22,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: mq.width * 0.07,
                  ),
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
                'Has expired package : 3 days trial',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Colors.black, fontSize: 14),
              ),
              subtitle: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: Text(
                      'Check it out',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.black54),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: goldenColor,
                radius: 22,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: mq.width * 0.07,
                  ),
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
                'Has upgraded package : 3 days trial',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Colors.black, fontSize: 14),
              ),
              subtitle: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: Text(
                      'Check it out',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.black54),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 12.0),
              child: Text(
                'Community',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.black),
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            const CustomListile(
              title: 'Messages',
              leadingIcon: Icons.message,
              trailingIcon: Icon(Icons.arrow_forward_ios),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 12.0),
              child: Text(
                'Contact Us',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.black),
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            const CustomListile(
              title: 'dgndjnfk@gmail.com',
              leadingIcon: Icons.mail,
              trailingIcon: Icon(Icons.arrow_forward_ios),
            ),
            const CustomListile(
              title: 'www.facebbok.com',
              leadingIcon: Icons.facebook,
              trailingIcon: Icon(Icons.arrow_forward_ios),
            ),
            const CustomListile(
              title: '+2342353456',
              leadingIcon: Icons.phone,
              trailingIcon: Icon(Icons.arrow_forward_ios),
            ),
            const CustomListile(
              title: 'Instagram',
              leadingIcon: Icons.apple,
              trailingIcon: Icon(Icons.arrow_forward_ios),
            ),
            CustomListile(
              title: 'LogOut',
              onTap: () => AuthenticationService.signOut(),
              leadingIcon: Icons.logout_outlined,
              trailingIcon: Icon(Icons.arrow_forward_ios),
            )
          ],
        ),
      ),
    );
  }
}
