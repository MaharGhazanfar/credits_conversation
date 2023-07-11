// ignore_for_file: must_be_immutable

import 'package:credit_and_conversation/constants/constants.dart';
import 'package:credit_and_conversation/screens/screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiscoveryPage extends StatelessWidget {
  DiscoveryPage({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          SizedBox(
            width: mq.height * 0.085,
            child: Card(
              elevation: 10,
              shape: const StadiumBorder(),
              child: IconButton(
                  onPressed: () {
                    if (!_scaffoldKey.currentState!.isDrawerOpen) {
                      _scaffoldKey.currentState!.openDrawer();
                    }
                  },
                  icon: Icon(
                    Icons.menu,
                    color: goldenColor,
                    size: 25,
                  )),
            ),
          )
        ],
        title: Text(
          'Discovery',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      drawer: AppDrawer.appDrawer(context: context),
      body: SingleChildScrollView(
        child: SafeArea(
            child: SizedBox(
          width: mq.width,
          height: mq.height,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    'Popular Audio',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: goldenColor),
                  ),
                ),
                SizedBox(
                  height: mq.height * 0.15,
                  width: mq.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: mq.height * 0.15,
                        width: mq.width * 0.8,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              leading: CircleAvatar(
                                  backgroundColor: goldenColor,
                                  child: const Icon(
                                    Icons.music_note,
                                  )),
                              title: Text(
                                'Carr Audio',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(color: Colors.black),
                              ),
                              subtitle: Text('this a mind resting music',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: Colors.black54,
                                      )),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: mq.height * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    'Popular Courses',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: goldenColor),
                  ),
                ),
                SizedBox(
                  height: mq.height * 0.35,
                  width: mq.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: mq.width * 0.7,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AllCoursesPage(),
                                ));
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(
                                8.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Image.asset(AppImages.logo)),
                                  Expanded(
                                    child: Text(
                                      'Title of Course',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(color: Colors.black),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Description of Course',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(color: Colors.black54),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: mq.height * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    'Popular Video',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: goldenColor),
                  ),
                ),
                SizedBox(
                  height: mq.height * 0.15,
                  width: mq.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: mq.height * 0.15,
                        width: mq.width * 0.8,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              leading: CircleAvatar(
                                  backgroundColor: goldenColor,
                                  child: const Icon(
                                    CupertinoIcons.play_arrow_solid,
                                  )),
                              title: Text(
                                'Vimeo video',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(color: Colors.black),
                              ),
                              subtitle: Text('Credit and conversation',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: Colors.black54,
                                      )),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
