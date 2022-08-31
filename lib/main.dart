import 'package:flutter/material.dart';

import 'main_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainRoute(),
      debugShowCheckedModeBanner: false,
    );
  }
}
