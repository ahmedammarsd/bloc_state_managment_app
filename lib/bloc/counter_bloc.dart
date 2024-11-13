import 'package:bloc_state_management_app/bloc/counter_event.dart';
import 'package:bloc_state_management_app/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0)) {
    on<CounterIncrementPressed>((event, emit) {
      emit(CounterState(state.count + 1));
    });
    on<CounterDecrementPressed>((event, emit) {
      emit(CounterState(state.count - 1));
    });
    on<CounterToZero>(
      (event, emit) {
        emit(CounterState(0));
      },
    );
  }
}
