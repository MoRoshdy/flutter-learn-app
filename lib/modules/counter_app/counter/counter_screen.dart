// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

class CounterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterStates>(
        listener: (context, state)
        {
          // if(state is CounterMinusState) print('Minus State ${state.counter}');
          // if(state is CounterPlusState) print('Plus State ${state.counter}');
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Counter',
              ),
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      CounterCubit.get(context).minis();
                    },
                    child: const Text(
                      '-',
                      style: TextStyle(
                        fontSize: 40.0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    '${CounterCubit.get(context).counter}',
                    style: const TextStyle(
                      fontSize: 30.0,
                    ),
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  TextButton(
                    onPressed: () {
                      CounterCubit.get(context).plus();
                    },
                    child: const Text(
                      '+',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

