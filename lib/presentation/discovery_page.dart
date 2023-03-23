import 'package:credit_and_conversation/utils/contants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class DiscoveryPage extends StatefulWidget {
  const DiscoveryPage({Key? key}) : super(key: key);

  @override
  State<DiscoveryPage> createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          SizedBox(
            width: mq!.height * 0.085,
            child: Card(
              elevation: 10,
              shape: const StadiumBorder(),
              child: IconButton(
                  onPressed: () {},
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
      body: SingleChildScrollView(
        child: SafeArea(
            child: SizedBox(
          width: mq!.width,
          height: mq!.height,
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
                  height: mq!.height * 0.15,
                  width: mq!.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: mq!.height * 0.15,
                        width: mq!.width * 0.8,
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
                  height: mq!.height * 0.05,
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
                  height: mq!.height * 0.35,
                  width: mq!.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: mq!.width * 0.7,
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
                                    padding: EdgeInsets.all(4.0),
                                    child: Expanded(
                                        child: Image.asset('assets/1.jpeg'))),
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
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: mq!.height * 0.05,
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
                  height: mq!.height * 0.15,
                  width: mq!.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: mq!.height * 0.15,
                        width: mq!.width * 0.8,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              leading: CircleAvatar(
                                  backgroundColor: goldenColor,
                                  child: Icon(
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
