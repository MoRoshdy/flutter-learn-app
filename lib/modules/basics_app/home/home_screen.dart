// ignore_for_file: use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';

class DifferentWidgets extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
        ),
        title: const Text('Flutter App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notification_important),
            onPressed: () {
              print('Clicked');
            },
          ),
          IconButton(
              onPressed: () => print('clicked'), icon: const Text('back')),
          const Icon(Icons.search),
        ],
        backgroundColor: Colors.grey,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 200.0,
                    height: 100.0,
                    color: Colors.red,
                    child: const Text(
                      'First text',
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  Container(
                    width: 200.0,
                    height: 100.0,
                    color: Colors.green,
                    child: const Text(
                      'Second text',
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  Container(
                    width: 200.0,
                    height: 100.0,
                    color: Colors.blue,
                    child: const Text(
                      'Third text',
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  Container(
                    width: 200.0,
                    height: 100.0,
                    color: Colors.yellow,
                    child: const Text(
                      'Fourth text',
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(20.0)),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    const Image(
                      image: NetworkImage(
                          'https://cars.usnews.com/images/article/202012/128775/1_2021_bugatti_chiron_super_sport.jpg'),
                      height: 500.0,
                      width: 500.0,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      color: Colors.black.withOpacity(0.6),
                      width: 500.0,
                      child: const Text(
                        'Car',
                        style: TextStyle(fontSize: 30.0, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 100.0,
                    color: Colors.red,
                    child: const Text(
                      'First text',
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 100.0,
                    color: Colors.green,
                    child: const Text(
                      'Second text',
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 100.0,
                    color: Colors.blue,
                    child: const Text(
                      'Third text',
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 100.0,
                    color: Colors.yellow,
                    child: const Text(
                      'Fourth text',
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      // body: const SafeArea(       // if there is no appBar
      //     child: Text('safe area', style: TextStyle(
      //       fontSize: 20.0,
      //       color: Colors.red,
      //     ),
      //     ),
      // ),
    );
  }
}
