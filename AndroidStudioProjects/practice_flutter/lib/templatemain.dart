import 'package:flutter/material.dart';
import 'package:practice_flutter/Person.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // build
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PracticeMainPage()
    );
  }
}

class PracticeMainPage extends StatefulWidget {


  @override
  _PracticeMainPageState createState() => _PracticeMainPageState();
}

class _PracticeMainPageState extends State<PracticeMainPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('学习',style: TextStyle(fontSize: 14),)),
      body: Center(
        child: Center(child: Container(
          width: 100,
          height: 100,
          color: Colors.red,
        )),
      ),
    );
  }
}
