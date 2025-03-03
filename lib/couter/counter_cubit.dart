import 'package:bloc/bloc.dart';

import 'counter_state.dart';

class CounterCubit extends Cubit<CounterStat>{
  CounterCubit():super(CounterStat(a: 0, b: 0, c: 0));

increment({required String nameInstant}){
 switch(nameInstant){
   case 'a':emit(CounterStat(a:state.a+1,b: state.b,c: state.c ));break;
   case 'b':emit(CounterStat(a:state.a,b: state.b+1,c: state.c ));break;
   case 'c':emit(CounterStat(a:state.a,b: state.b,c: state.c+1 ));break;
 }
}


  decrement({required String nameInstant}){
    switch(nameInstant){
      case 'a':emit(CounterStat(a:state.a-1,b: state.b,c: state.c ));break;
      case 'b':emit(CounterStat(a:state.a,b: state.b-1,c: state.c ));break;
      case 'c':emit(CounterStat(a:state.a,b: state.b,c: state.c-1 ));break;
    }
  }
}

