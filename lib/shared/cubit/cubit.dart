// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learn_app/modules/todo_app/archived%20tasks/archived_tasks.dart';
import 'package:flutter_learn_app/modules/todo_app/done%20tasks/done_tasks.dart';
import 'package:flutter_learn_app/modules/todo_app/tasks/tasks_screen.dart';
import 'package:flutter_learn_app/shared/cubit/states.dart';
import 'package:flutter_learn_app/shared/network/local/cache_helper.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
    TasksScreen(),
    DoneTasks(),
    ArchivedTasks(),
  ];
  List<String> titles = [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
  ];
  int currentindex = 0;

  void changeIndex(int index)
  {
    currentindex = index ;
    emit(AppChangeBottomNavBarState());
  }

  Database? database;
  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archivedTasks = [];

  void createDatabase() {
    openDatabase('todo.db', version: 1,
        onCreate: (database, version) {
          print('database created');
          database
              .execute(
              'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)')
              .then((value) {
            print('table created');
          }).catchError((error) {
            print('Error when create table ${error.toString()}');
          });
        }, onOpen: (database) {
          getDataFromDatabase(database);

          print('database opened');
        }).then((value)
    {
      database = value;
      emit(AppCreateDatabaseState());
    });
  }

  void insertToDatabase({
    required String title,
    required String date,
    required String time,
  })  async {
     await database!.transaction((txn) {
      txn.rawInsert(
          'INSERT INTO tasks (title, date, time, status) VALUES ("$title", "$date", "$time", "new")')
          .then((value)
      {
        print('$value inserted successfully');
        emit(AppInsertToDatabaseState());

        getDataFromDatabase(database);

      }).catchError((error)
      {
        print('Error when inserting new row ${error.toString()}');
      });

      return Future(() {});
    });
  }

  void getDataFromDatabase(database)  {
    emit(AppGetDatabaseLoadingState());
    database!.rawQuery('SELECT * FROM tasks').then((value)
    {
      newTasks = [];
      doneTasks = [];
      archivedTasks = [];

      value.forEach((element) {
        if(element['status'] == 'new') {
          newTasks.add(element);
        } else if(element['status'] == 'done') {
          doneTasks.add(element);
        } else {
          archivedTasks.add(element);
        }
      });

      emit(AppGetFromDatabaseState());
    });
  }

  void updateData({
  required String status,
    required int id,
}) async
  {
    database!.rawUpdate(
      'UPDATE tasks SET status = ? WHERE id = ?',
      [status, id],
    ).then((value) {
      getDataFromDatabase(database);
      emit(AppUpdateDatabaseState());

    });
  }

  void deleteData({
    required int id,
  }) async
  {
    database!.rawDelete(
      'DELETE FROM tasks WHERE id = ?',
      [id],
    ).then((value) {
      getDataFromDatabase(database);
      emit(AppDeleteFromDatabaseState());

    });
  }

  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;

  void changeBottomSheet({
  required bool isShown,
    required IconData icon,
})
  {
    isBottomSheetShown = isShown;
    fabIcon = icon;

    emit(AppChangeBottomSheetState());
  }

  bool isDark = false;

  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(AppChangeModeState());
    } else {
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeModeState());
      });
    }
  }


}