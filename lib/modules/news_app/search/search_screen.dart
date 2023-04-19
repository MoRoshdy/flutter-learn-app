// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learn_app/layout/news%20app/cubit/cubit.dart';
import 'package:flutter_learn_app/layout/news%20app/cubit/states.dart';
import 'package:flutter_learn_app/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        List list = NewsCubit.get(context).search;

        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                  keyboardtype: TextInputType.text,
                  controller: searchController,
                  labeltext: 'Search',
                  prefix: Icons.search,
                  onChanged: (value) {
                    NewsCubit.get(context).getSearch(value);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'search must not be empty';
                    }
                    return null;
                  },
                ),
              ),
              Expanded(
                child: articleBuilder(
                  list,
                  context,
                  isSearch: true,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
