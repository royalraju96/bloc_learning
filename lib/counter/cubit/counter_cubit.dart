import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterState(0, {}));
  void increment() {
    int value = state.counterValue + 1;
    emit(CounterState(value, {}));
  }

  void decrement() {
    int value = state.counterValue - 1;
    emit(CounterState(value, {}));
  }
}
