import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screen/home_page.dart';

void main() {
  runApp(const RandomUser());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class RandomUser extends StatelessWidget {
  const RandomUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Pick Your Friend'),
    );
  }
}

