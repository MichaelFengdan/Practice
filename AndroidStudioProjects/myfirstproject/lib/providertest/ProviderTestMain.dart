import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myfirstproject/providertest/CouterModel.dart';
import 'package:myfirstproject/providertest/secondPage.dart';
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
    final textSize=Provider.of<int>(context).toDouble();
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "FirstPage"
        ),
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Center(
              child: Text('Value:${_counter.count}',style: TextStyle(fontSize: textSize))),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SecondScreen())),
      ),
    );
  }
}
