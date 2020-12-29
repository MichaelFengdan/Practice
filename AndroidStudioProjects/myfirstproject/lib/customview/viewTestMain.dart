import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();//确定初始化
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.landscapeLeft,DeviceOrientation.landscapeRight
    ]
  );
  SystemChrome.setEnabledSystemUIOverlays([]);//设置全屏展示
  runApp(Paper());
}


class Paper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text('Hello World'),
      ),
    );
  }
}

class PaperPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    drawStrokeJoin(canvas);
  }

  void drawStrokeJoin(Canvas canvas){
    //创建画笔
    Paint paint=Paint();
    //创建路径
    Path path=Path();
    //设置画笔属性
    paint
      ..style=PaintingStyle.stroke
      ..color=Colors.blue
      ..strokeWidth=20;
    path.moveTo(50, 50);
    path.lineTo(50, 150);
    path.relativeLineTo(100, -50);
    path.relativeLineTo(0, 100);
    canvas.drawPath(path, paint..strokeJoin=StrokeJoin.bevel);
    //准备绘制第二个
    path.reset();
    path.moveTo(50+150.0, 50);
    path.lineTo(50+150.0, 150);
    path.relativeLineTo(100, -50);
    path.relativeLineTo(0, 100);
    canvas.drawPath(path, paint..strokeJoin=StrokeJoin.miter);


  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate)=>false;

}


