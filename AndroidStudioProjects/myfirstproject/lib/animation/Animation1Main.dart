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

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  double _height=200;
  @override
  Widget build(BuildContext context) {
    final _counter=Provider.of<CounterModel>(context);
    final textSize=Provider.of<int>(context).toDouble();
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "MyAnimationPractice"
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            width: 300,
            height: 120,
            color: Colors.blue,
            child: TweenAnimationBuilder(
              duration: Duration(seconds: 1),
              tween: Tween(begin: 7.0,end: 10.0),
              builder: (context,value,child){
                final whole=value~/1;
                final decimal=value-whole;
                return Stack(
                  children: [
                    Positioned(
                        top: -100*decimal,//0->-100
                        child: Text("${whole}",style: TextStyle(fontSize: 100),)),
                    Positioned(
                        top: 100-decimal*100,//100->0
                        child: Text("${whole+1}",style: TextStyle(fontSize: 100),)),
                  ],
                );
              },
            ),
        ),
      ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          setState(() {
            _height+=200;
            if(_height>500){
              _height=200;
            }
          });
        },
      ),
    );
  }
}
