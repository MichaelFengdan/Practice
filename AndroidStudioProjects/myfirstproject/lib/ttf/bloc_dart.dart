
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum CounterEvent{
  increment
}

class CounterBloc extends Bloc<CounterEvent,int>{
  CounterBloc() : super(0);

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.increment:
        yield state + 1;
        break;
    }
  }

  @override
  void onEvent(CounterEvent event) {
    print("CounterBloc 触发了onEvent方法${event}");
    super.onEvent(event);
  }

  @override
  void onChange(Change<int> change) {
    print("CounterBloc 触发了onChange方法${change}");
    super.onChange(change);
  }

  @override
  void onTransition(Transition<CounterEvent, int> transition) {
    print("CounterBloc 触发了onTransition方法${transition}");
    super.onTransition(transition);
  }
}

class SimpleBlocObserver extends BlocObserver{
  @override
  void onEvent(Bloc bloc, Object event) {
    print('SimpleBlocObserver onEvent  ${bloc.runtimeType} $event');
    super.onEvent(bloc, event);
  }

  @override
  void onChange(Cubit cubit, Change change) {
    print('SimpleBlocObserver  onChange ${cubit.runtimeType} $change');
    super.onChange(cubit, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print('SimpleBlocObserver onTransition ${bloc.runtimeType} $transition');
    super.onTransition(bloc, transition);
  }
}