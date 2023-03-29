import 'package:credit_and_conversation/custom_widgets/customTextField.dart';
import 'package:credit_and_conversation/presentation/course_details.dart';
import 'package:credit_and_conversation/utils/contants.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class AllCoursesPage extends StatefulWidget {
  const AllCoursesPage({Key? key}) : super(key: key);

  @override
  State<AllCoursesPage> createState() => _AllCoursesPageState();
}

class _AllCoursesPageState extends State<AllCoursesPage> {
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
          'Courses',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          width: mq.width,
          height: mq.height,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    'Top courses in stock trading',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: goldenColor),
                  ),
                ),
                Expanded(
                  flex: 11,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CourseDetail(),
                              ));
                        },
                        child: const ImageTitleCard(
                            title: 'Stock Trading', imagePath: 'assets/2.jpeg'),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
