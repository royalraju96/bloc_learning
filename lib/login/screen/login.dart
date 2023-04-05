import 'package:bloc_learning/counter/cubit/counter_cubit.dart';
import 'package:bloc_learning/login/components/login_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<CounterCubit, CounterState>(
        listener: (context, state) {
          if (state.loginData.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Please enter valid email/password'),
              backgroundColor: Colors.red,
            ));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Login Success'),
              backgroundColor: Colors.green,
            ));
          }
        },
        child: SafeArea(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              LoginField(
                controller: email,
                label: 'Email*',
              ),
              const SizedBox(height: 20),
              LoginField(
                controller: pass,
                label: 'Password*',
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<CounterCubit>().login(email.text, pass.text);
                  },
                  child: const Text('Login'))
            ],
          ),
        ),
      ),
    );
  }
}
