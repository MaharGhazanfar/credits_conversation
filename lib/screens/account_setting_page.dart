import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:credit_and_conversation/authentication/authentication.dart';
import 'package:credit_and_conversation/models/models.dart';
import 'package:credit_and_conversation/screens/screens.dart';
import 'package:credit_and_conversation/utils/utils.dart';
import 'package:credit_and_conversation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AccountSettingPage extends StatelessWidget {
  const AccountSettingPage({
    Key? key,
  }) : super(key: key);

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
        child: StreamBuilder<DocumentSnapshot>(
            stream:
                DBHandler.userCollection().doc(DBHandler.userUid).snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var doc = snapshot.data!.data() as Map<String, dynamic>?;
                return Column(
                  children: [
                    CircleAvatar(
                      radius: mq.width * 0.16,
                      backgroundColor: Colors.white,
                      backgroundImage:
                          NetworkImage(doc![ModelSignUpPage.IMAGEPATH]),
                      // child: Icon(
                      //   Icons.person,
                      //   color: goldenColor,
                      //   size: mq.width * 0.18,
                      // ),
                    ),
                    SizedBox(
                      height: mq.height * 0.04,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomProfileField(
                          fieldTitle: 'First Name',
                          fieldValue: '${doc[ModelSignUpPage.FIRSTNAME]}',
                          icon: Icons.person,
                          textWidth: mq.width * 0.28,
                          width: mq.width * 0.4,
                        ),
                        CustomProfileField(
                          fieldTitle: 'Last Name',
                          fieldValue: '${doc[ModelSignUpPage.LASTNAME]}',
                          icon: Icons.person,
                          textWidth: mq.width * 0.28,
                          width: mq.width * 0.4,
                        )
                      ],
                    ),
                    CustomProfileField(
                      fieldTitle: 'Email',
                      textWidth: mq.width * 0.77,
                      fieldValue: '${doc[ModelSignUpPage.EMAILADDRESS]}',
                      icon: Icons.mail,
                    ),
                    CustomProfileField(
                      fieldTitle: 'Password',
                      fieldValue: '${doc[ModelSignUpPage.PASSWORD]}',
                      icon: Icons.lock,
                    ),
                    CustomProfileField(
                      fieldTitle: 'Birth Date',
                      fieldValue: '${doc[ModelSignUpPage.DATEOFBIRTH]}',
                      icon: Icons.calendar_month,
                    ),
                    CustomProfileField(
                      fieldTitle: 'Gender',
                      fieldValue: '${doc[ModelSignUpPage.GENDER]}',
                      icon: Icons.person,
                    ),
                    CustomProfileField(
                      fieldTitle: 'Phone Number',
                      fieldValue: '${doc[ModelSignUpPage.PHONENUMBER]}',
                      icon: Icons.phone,
                    )
                  ],
                );
              } else {
                return Center(
                    child: CircularProgressIndicator(
                  color: goldenColor,
                ));
              }
            }),
      ))),
    );
  }
}
