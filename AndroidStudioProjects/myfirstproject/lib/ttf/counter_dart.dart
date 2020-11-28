
import 'package:flutter_bloc/flutter_bloc.dart';

enum HYCounterEvent{
  increment,decrement
}

class HYCounterBloc extends Bloc<HYCounterEvent,int>{
  HYCounterBloc():super(0){
    print("初始化参数");
  }

  @override
  Stream<int> mapEventToState(HYCounterEvent event) async* {
    switch(event){
      case HYCounterEvent.increment:
        yield state+1;
        break;
      case HYCounterEvent.decrement:
        yield state-1;
        break;
    }
  }

}