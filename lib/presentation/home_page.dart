import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to My App!',
              style: Theme.of(context).textTheme.headline1,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}
//Color goldenColor = Color.fromRGBO(255, 215, 0, 1); // (255, 215, 0) is the RGB values for golden color
//Color goldenColor = Color(0xFFFFD700); // 0xFFFFD700 is the hexadecimal value for golden color
//Color goldenColor = Colors.amber;
