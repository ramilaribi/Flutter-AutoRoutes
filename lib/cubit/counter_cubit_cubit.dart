import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_cubit_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterValue: 0 , wasIncremented: false));
  //You access the current state using state, which holds the latest emitted state of the Cubit.
  //You use the emit method to update the Cubit's state. This will notify any listeners (e.g., UI widgets) about the state change.
  void increment() => emit(CounterState(counterValue: state.counterValue + 1, wasIncremented: true)  );
  void decrement() => emit(CounterState(counterValue: state.counterValue - 1, wasIncremented: false)  );
}
 