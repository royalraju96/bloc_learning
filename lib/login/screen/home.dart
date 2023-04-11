import 'package:bloc_learning/counter/cubit/counter_cubit.dart';
import 'package:bloc_learning/counter/screens/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: BlocConsumer<CounterCubit, CounterState>(
          listener: (context, state) {
            if (state.counterValue < 0) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Value cant be in negative')));
            }
          },
          buildWhen: (previous, current) => current.counterValue >= 0,
          builder: (context, state) {
            return Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        context.read<CounterCubit>().increment();
                      },
                      icon: const Icon(Icons.add)),
                  Text(
                    state.counterValue.toString(),
                    style: const TextStyle(fontSize: 30),
                  ),
                  IconButton(
                      onPressed: () {
                        context.read<CounterCubit>().decrement();
                      },
                      icon: const Icon(Icons.remove)),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => BlocProvider<CounterCubit>.value(
                                value: context.read<CounterCubit>(),
                                child: const MyHomePage(title: 'Counter'),
                              ),
                            ));
                      },
                      child: const Text('Go Next'))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
