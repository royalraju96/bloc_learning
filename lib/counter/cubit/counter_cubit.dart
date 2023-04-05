import 'package:bloc_learning/counter/repository/counter_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterState(0, {}, []));
  final repo = CounterRepository();
  void increment() {
    int value = state.counterValue + 1;
    emit(CounterState(value, {}, []));
  }

  void decrement() {
    int value = state.counterValue - 1;
    emit(CounterState(value, {}, []));
  }

  void getDashboardData() async {
    final response = await repo.getCustomerData();

    emit(CounterState(0, response, []));
  }

  void login(String email, String password) async {
    try {
      final response = await repo.login(email, password);
      emit(CounterState(0, {}, response));
    } on Exception {
      emit(const CounterState(0, {}, []));
    }
  }
}
