import 'package:bloc_learning/login/components/login_field.dart';
import 'package:bloc_learning/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home.dart';

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
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.loginData.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Please enter valid email/password'),
              backgroundColor: Colors.red,
            ));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Login Success'),
                backgroundColor: Colors.green,
              ),
            );

            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const Home()),
                (route) => false);
          }
        },
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius:
                    const BorderRadius.only(topLeft: Radius.circular(100))),
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
                Column(
                  children: [
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
                          context
                              .read<LoginCubit>()
                              .login('HPMILKFED', 'HPMILKFED');
                        },
                        child: const Text('Login')),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
