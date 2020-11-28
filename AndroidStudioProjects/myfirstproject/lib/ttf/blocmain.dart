import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myfirstproject/ttf/counter_dart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHome(),
      );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter')),
      body: Center(
        child: BlocProvider(
          create: (context){
            HYCounterBloc();
          },
          child: Builder(
            builder: (context) => RaisedButton(
              onPressed: () {
                final blocA = BlocProvider.of<HYCounterBloc>(context);
              },
            ),
          ),
        ),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: (){
                final bloac=BlocProvider.of<HYCounterBloc>(context,listen: true);
                print(bloac.state);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: Icon(Icons.remove),
              onPressed: (){

              },
            )
          )
        ],
      ),
    );
  }
}

class MyChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        final blocA = BlocProvider.of<HYCounterBloc>(context);
      },
    );
  }
}

class MyFloat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

