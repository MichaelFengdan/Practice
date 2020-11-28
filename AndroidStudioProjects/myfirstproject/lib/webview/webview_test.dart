import 'dart:async';

import 'package:flutter/material.dart';

import 'browser.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomde(),
      );
  }
}

class MyHomde extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Browser(
      url: "https://juejin.im/post/6844903908087693319",
      title: "cccccc",
    );
  }
}
