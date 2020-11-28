
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'alert_dialog.dart';

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
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: ShowAlertDialog(
            items: ['取消', '确认'],
            title: '提示',
            content: 'Are you sure to delete this comment？j',
            onTap: (index) {
              print('object$index');
            },
          ),
        ),
      ),
    );
  }
}
