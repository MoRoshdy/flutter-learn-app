// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learn_app/shared/components/components.dart';
import 'package:flutter_learn_app/shared/cubit/cubit.dart';
import 'package:flutter_learn_app/shared/cubit/states.dart';

class ArchivedTasks extends StatefulWidget {


  @override
  _ArchivedTasksState createState() => _ArchivedTasksState();
}

class _ArchivedTasksState extends State<ArchivedTasks> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var tasks = AppCubit.get(context).archivedTasks;

        return tasks.isEmpty ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.menu,
                size: 100.0,
                color: Colors.grey,
              ),
              Text(
                'No Tasks Yet, please add some tasks',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ) : ListView.separated(
            itemBuilder: (context, index) => buildTaskItem(tasks[index], context),
            separatorBuilder: (context, index) => Divider(
              thickness: 5.0,
              color: Colors.grey[300],
            ),
            itemCount: tasks.length);
      },
    );
  }
}
