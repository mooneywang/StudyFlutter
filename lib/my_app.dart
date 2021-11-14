import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'pages/home_page.dart';
import 'pages/description_page.dart';
import 'pages/home_list_page.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'FlutterStudy',
        // 注册路由表
        routes: {
          "/description_page": (context) => const DescriptionPage(),
          "/home_list_page": (context) => const HomeListPage(),
        },
        home: const MyHomePage(title: 'Home'),
    );
  }

  Widget redBox = const DecoratedBox(decoration: BoxDecoration(color: Colors.red));
  Widget blueBox = const DecoratedBox(decoration: BoxDecoration(color: Colors.blue));
  Widget pinkBox = const DecoratedBox(decoration: BoxDecoration(color: Colors.pink));


  Widget titleSection = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          /*1*/
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*2*/
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: const Text(
                  'Oeschinen Lake Campground',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'Kandersteg, Switzerland',
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
        /*3*/
        Icon(
          Icons.star,
          color: Colors.red[500],
        ),
        const Text('41'),
      ],
    ),
  );
}