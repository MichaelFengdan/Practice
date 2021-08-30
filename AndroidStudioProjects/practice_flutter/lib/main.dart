import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:practice_flutter/Person.dart';
import 'package:practice_flutter/http/core/hi_net.dart';
import 'package:practice_flutter/http/request/test_request.dart';
import 'package:practice_flutter/ioslate_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // build
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Center(
            child: PracticeMainPage()),
    );
  }
}

class PracticeMainPage extends StatefulWidget {

  @override
  _PracticeMainPageState createState() => _PracticeMainPageState();

  _loadIsolateDate() async{
    await Isolate.spawn(_backgroundWork, ReceivePort().sendPort);
  }

  _backgroundWork(SendPort sendPort){
    sendPort.send('BackgroundWork ->');
  }
}

class _PracticeMainPageState extends State<PracticeMainPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('学习',style: TextStyle(fontSize: 14),)),
      body: GestureDetector(
        onTap: (){
          print('就是他妈的点击了');
          _testRequest();
        },
        child: Center(
          child: Center(child: Container(
            width: 100,
            height: 100,
            color: Colors.red,
          )),
        ),
      ),
    );
  }

  void _testRequest() async{
    TestRequest request=TestRequest();
    request.add('aa', 'ddd').add('bb', '333');
    var result=await HiNet.getInstance().fire(request);
    print(result);
  }
}
