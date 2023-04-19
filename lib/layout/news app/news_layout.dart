import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learn_app/layout/news%20app/cubit/cubit.dart';
import 'package:flutter_learn_app/layout/news%20app/cubit/states.dart';
import 'package:flutter_learn_app/modules/news_app/search/search_screen.dart';
import 'package:flutter_learn_app/shared/components/components.dart';
import 'package:flutter_learn_app/shared/cubit/cubit.dart';


// ignore: use_key_in_widget_constructors
class NewsBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        NewsCubit cubit = NewsCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'News App',
            ),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.search,
                ),
                onPressed: ()
                {
                  navigateTo(context, SearchScreen(),);
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.brightness_4_outlined,
                ),
                onPressed: ()
                {
                  AppCubit.get(context).changeAppMode();
                },
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomNav(index);
            },
            items: cubit.items,
          ),
        );
      },
    );
  }
}
