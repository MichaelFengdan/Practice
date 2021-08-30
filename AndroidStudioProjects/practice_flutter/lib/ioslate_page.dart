
import 'dart:isolate';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IsolatePage extends StatefulWidget {
  const IsolatePage({Key key}) : super(key: key);

  @override
  _IsolatePageState createState() => _IsolatePageState();
}

class _IsolatePageState extends State<IsolatePage> {

  var content ='计算中';

  static Future<dynamic> calculation(int num)async{
    final response=new ReceivePort();
    //开始创建isolate
    Isolate isolate=await Isolate.spawn(createIsolate, response.sendPort);
    ///获取sendPort发来的消息
    final sendPort=await response.first as SendPort;
    ///接受消息的ReceivePort
    final answer=ReceivePort();
    ///发送数据
    sendPort.send([num,answer.sendPort]);
    ///获取数据
    return answer.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        child: Text('计算'),
        onPressed: (){
            calculation(10000).then((value){
              setState(() {
                content="总和$value";
                print("计算接口是：$value");
              });
            });
        },
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                  width: double.infinity,
                  height: 400,
                  //前面章节中的自定义View
                  child:CircularProgressIndicator(
                    strokeWidth: 3,
                    //背景颜色
                    backgroundColor: Colors.red,
                  ),
                  ),
              Text(
                content,
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
        ),
      ),
      
    );
  }
//计算0到num数值的总和
  static int sum(int num){
    int count=0;
    while(num>0){
      count+=num;
      num--;
    }
    return count;
  }
  static void createIsolate(SendPort initialReplyTo) {
    final port=ReceivePort();
    ///把当前的消息管道发回去
    initialReplyTo.send(port.sendPort);
    port.listen((message) {
      ///获取数据并解析，准备做耗时操作
      final num=message[0] as int;
      final send=message[1] as SendPort;
      send.send(sum(num));
    });
  }
}
