import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gbk2utf8/gbk2utf8.dart';
import 'package:myfirstproject/ttf/bloc_dart.dart';

Future <void>main() async {
  final bloc=CounterBloc();
  print(bloc.state);
  bloc.add(CounterEvent.increment);
  await Future.delayed(Duration.zero);
  print("${bloc.state}"+"********");
  await bloc.close();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  // TODO: implement widget
  MyApp get widget => super.widget;
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
    String response="""
              "乱码原文11" 
              ‏⁧‫#وزارة_الموارد_البشرية_والتنمية_الاجتماعية‬⁩ تطلق مبادرة "تحسين العلاقة التعاقدية" لعاملي منشآت القطاع الخاص. #الغاء_نظام_الكفالة‬⁩ ‏وزارة ⁧‫؜#الموارد_البشرية‬⁩ تطلق رسميًا مبادرة "تحسين العلاقة التعاقدية" لعاملي منشآت القطاع الخاص. ‏النظام سيتيح للوافد حرية الانتقال من عمل لآخر عند انتهاء عقده دون موافقة صاحب العمل، وسيدخل النظام 
               بمناسبة فوزه في الانتخابات الرئاسية في الولايات المتحدة الأمريكية.
              """;
    String ccc='';
    // if(response.contains("⁧")){
    //  int index=response.indexOf("⁧");
    //  ccc=response.replaceRange(0,response.length,"****");
    // }
    // for(var test in response.characters){
    //   if(test=='\uf604'){
    //     int index=response.indexOf(test);
    //     print(index);
    //   }
    // }
    for (var char in response.split('')) {
      print(char);
      response.replaceAll('⁧', "2");
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Container(
              alignment: Alignment.topLeft,
              child: Text(response,
              maxLines: 100,
              style: TextStyle(fontSize:18,fontFamilyFallback:['myfont','doudi'] ),
          )
          ),
        ),
      ),
    );
  }
}
