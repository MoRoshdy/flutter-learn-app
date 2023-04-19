// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learn_app/layout/news%20app/cubit/cubit.dart';
import 'package:flutter_learn_app/layout/news%20app/cubit/states.dart';
import 'package:flutter_learn_app/shared/components/components.dart';

class ScienceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        List list = NewsCubit.get(context).science;
        return articleBuilder(list, context);
      },
    );
  }
}
