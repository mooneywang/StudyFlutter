import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:studyflutter/model/user.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  
  @override
  State<StatefulWidget> createState() {
    return _DetailPageState();
  }
}

class _DetailPageState extends State<DetailPage> {

  @override
  void initState() {
    super.initState();
    // 将json string转化成List对象
    String jsonStr1 = '[{"name":"Jack"},{"name":"Rose"}]';
    List items = json.decode(jsonStr1);
    print(items[0]['name']);
    print(items[1]['name']);

    // 将json string转化成Map对象
    String jsonStr2 = '{"name":"Jack","age":"18"}';
    Map map = json.decode(jsonStr2);
    print(map['name']);
    print(map['age']);

    String userJsonStr = '{"name": "John Smith","email": "john@example.com"}';
    Map<String, dynamic> userJson = json.decode(userJsonStr);
    User user = User.fromJson(userJson);
    print('user\'s name is ${user.name}');
    print('user\'s email is ${user.email}');

    String userToJson = json.encode(user);
    print(userToJson);
  }

  

  //一个JSON格式的用户列表字符串
// String jsonStr='[{"name":"Jack"},{"name":"Rose"}]';`
// //将JSON字符串转为Dart对象(此处是List)
// List items=json.decode(jsonStr);
// //输出第一个用户的姓名
// print(items[0]["name"]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Json转Dart Model类'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: [
              OutlinedButton(
                onPressed: () {

                  Navigator.pop(context, 'hello');

                }, 
                child: const Text('back'))
            ],
          ),
        ),),
    );
  }

}