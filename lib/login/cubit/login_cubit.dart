import 'package:bloc_learning/login/repository/login_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState([]));

  final repo = LoginRepository();
  void login(String email, String password) async {
    try {
      final response = await repo.login(email, password);
      emit(LoginState(response));
    } on Exception {
      emit(const LoginState([]));
    }
  }
}
