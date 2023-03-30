import 'package:credit_and_conversation/screens/screens.dart';
import 'package:credit_and_conversation/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({Key? key}) : super(key: key);

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
          'My Profile',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
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
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const AccountSettingPage(),
              )),
              title: Text(
                'Keshia carr',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              subtitle: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: Text(
                      'Basic Package',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.white60),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SettingPage(),
                          ));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: goldenColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 6.0, right: 6.0, top: 2, bottom: 2),
                        child: Text(
                          'Become Premium',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Colors.black87),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              trailing: CircleAvatar(
                backgroundColor: goldenColor,
                radius: 15,
                child: Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: mq.width * 0.06,
                ),
              ),
            ),
            const Divider(
              color: Colors.white60,
              endIndent: 10,
              indent: 10,
              thickness: 2,
            ),
            Card(
              color: Colors.white,
              elevation: 5,
              borderOnForeground: true,
              shadowColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Keshia Carr',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(color: Colors.black),
                            ),
                            Text(
                              'Task 0/0',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(color: Colors.green),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: CircularPercentIndicator(
                        radius: mq.height * 0.08,
                        animateFromLastPercent: true,
                        arcBackgroundColor: Colors.black12,
                        rotateLinearGradient: false,
                        arcType: ArcType.FULL_REVERSED,
                        lineWidth: 10.0,
                        circularStrokeCap: CircularStrokeCap.round,
                        animation: true,
                        animationDuration: 700,
                        curve: Curves.decelerate,
                        percent: 0.5,
                        backgroundColor: Colors.white,
                        center: Text('NaN%',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(color: Colors.green)),
                        linearGradient: LinearGradient(
                          colors: [
                            goldenColor.withOpacity(0.1),
                            goldenColor,
                            Colors.green
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Card(
              color: Colors.white,
              elevation: 5,
              borderOnForeground: true,
              shadowColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Keshia Carr',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(color: Colors.black),
                            ),
                            Text(
                              'Assignment 0/0',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: CircularPercentIndicator(
                        radius: mq.height * 0.08,
                        animateFromLastPercent: true,
                        rotateLinearGradient: false,
                        arcBackgroundColor: Colors.black12,
                        arcType: ArcType.FULL_REVERSED,
                        lineWidth: 10.0,
                        circularStrokeCap: CircularStrokeCap.round,
                        animation: true,
                        animationDuration: 700,
                        curve: Curves.decelerate,
                        percent: 0.3,
                        backgroundColor: Colors.white,
                        center: Text('30%',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(color: Colors.red)),
                        linearGradient: LinearGradient(
                          colors: [
                            goldenColor.withOpacity(0.1),
                            goldenColor,
                            Colors.green
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
