
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myfirstproject/posts/app.dart';
import 'package:myfirstproject/ttf/bloc_dart.dart';

void main(){
  EquatableConfig.stringify=kDebugMode;
  Bloc.observer=SimpleBlocObserver();
  runApp(App());

}