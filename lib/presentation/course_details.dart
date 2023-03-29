import 'package:credit_and_conversation/custom_widgets/customTextField.dart';
import 'package:credit_and_conversation/utils/contants.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class CourseDetail extends StatefulWidget {
  const CourseDetail({Key? key}) : super(key: key);

  @override
  State<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            SizedBox(
                width: mq.width,
                height: mq.height,
                child: Column(
                  children: [
                    Expanded(
                        flex: 2,
                        child: SizedBox(
                          width: mq.width,
                          //color: goldenColor,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Stock basics',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(color: goldenColor),
                                ),
                                const Text(
                                    'In this course, you will learn about the core concept of stock market. '
                                    'Once you have grasp the concepts and '
                                    'understand what makes the stock market thick,'
                                    'You will become smarter, more informed and heavy investor',
                                    textAlign: TextAlign.start),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                    width: 1,
                                                    color: goldenColor)),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0, right: 8.0),
                                              child: Text('Topics',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall!
                                                      .copyWith(
                                                          color: goldenColor)),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  border: Border.all(
                                                      width: 1,
                                                      color: goldenColor)),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0, right: 8.0),
                                                child: Text('Readings',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleSmall!
                                                        .copyWith(
                                                            color:
                                                                goldenColor)),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                    width: 1,
                                                    color: goldenColor)),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0, right: 8.0),
                                              child: Text('Questions',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall!
                                                      .copyWith(
                                                          color: goldenColor)),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                    width: 1,
                                                    color: goldenColor)),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0, right: 8.0),
                                              child: Text('Activities',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall!
                                                      .copyWith(
                                                          color: goldenColor)),
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
                        )),
                    Expanded(
                        flex: 3,
                        child: Container(
                          width: mq.width,
                          color: Colors.white,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 80.0, bottom: 10),
                                child: CustomGoldenButton(
                                  width: mq.width * 0.8,
                                  buttonTitle: 'ENROLL NOW',
                                  onPressed: () {},
                                ),
                              ),
                              SizedBox(
                                width: mq.width,
                                height: mq.height * 0.361,
                                child: Card(
                                  elevation: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ListView(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 12.0),
                                          child: Text('What will i learn?',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge!
                                                  .copyWith(
                                                      color: Colors.black54)),
                                        ),
                                        const CustomListile(
                                          title: 'Introduction',
                                        ),
                                        const CustomListile(
                                          title: 'What are Stocks?',
                                        ),
                                        const CustomListile(
                                          title: 'Different types of stocks',
                                        ),
                                        const CustomListile(
                                          title: 'How Stocks Trade',
                                        ),
                                        const CustomListile(
                                          title:
                                              'Trading stocks and other types',
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ))
                  ],
                )),
            Positioned(
              top: mq.height * 0.28,
              //bottom: mq!.height * 0.3,
              left: mq.width * 0.2,
              //right: mq!.height * 0.1,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      height: mq.height * 0.2,
                      width: mq.width * 0.6,
                      'assets/2.jpeg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
