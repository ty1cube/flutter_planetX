import 'package:flutter/material.dart';
import 'package:planetx_flutter/src/ui/home.dart';


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weight on Planet X',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: Home(),
    );
  }
}
