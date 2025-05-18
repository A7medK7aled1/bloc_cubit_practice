import 'dart:developer';

import 'package:bloc_cubit_practice/cubit/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => CounterCubit(),
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<CounterCubit, CounterState>(
                    builder: (context, state) {
                      log("bloc builder called 1");
                      return Text(state.count.toString());
                    },
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      log("bloc builder called 2");
                      context.read<CounterCubit>().increment();
                    },
                    child: const Icon(Icons.add),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      log("bloc builder called 3");
                      context.read<CounterCubit>().decrement();
                    },
                    child: const Icon(Icons.remove),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
