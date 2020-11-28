import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myfirstproject/providertest/CouterModel.dart';
import 'package:provider/provider.dart';

void main() {
  final counter=CounterModel();
  final textSize=48;
  runApp(Provider<int>.value(
      value: textSize,
      child: ChangeNotifierProvider<CounterModel>.value(value: counter,child: MyApp())));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FirstScreen(),
      );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _counter=Provider.of<CounterModel>(context);
    final textSize=Provider.of<int>(context);
    return Scaffold(
      appBar: AppBar(
        title: ,
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Center(child: Text("Hello world")),
        ),
      ),
    );
  }
}
