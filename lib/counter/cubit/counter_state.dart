part of 'counter_cubit.dart';

class CounterState {
  const CounterState(this.counterValue, this.dashboardData, this.loginData);
  final int counterValue;
  final Map<String, dynamic> dashboardData;
  final List loginData;
}
