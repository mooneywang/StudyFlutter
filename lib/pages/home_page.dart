import 'package:flutter/material.dart';

import 'detail_page.dart';
import 'description_page.dart';

//StatefulWidget 有状态的组件
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //用于记录按钮点击的总次数
  int _counter = 0;

  String _resultFromDetailPage = 'null';

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _updateText(String value) {
    setState(() {
      _resultFromDetailPage = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                
                Navigator.pushNamed(context, '/home_list_page');

              },
              child: const Text('go to home list')
            ),
            OutlinedButton(onPressed: () {

              Navigator.pushNamed(context, '/description_page');

            },
            child: const Text('go to des(命名路由)')),
            ElevatedButton(
              onPressed: () async {
                var result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {

                    return const DetailPage();

                  }),
                );
                _updateText(result);
              },
              child: const Text('Json转Dart Model类')
            ),
            Text('DetailPage的返回值：$_resultFromDetailPage'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const DescriptionPage();
                    },
                    fullscreenDialog: true)
                );
              },
              child: const Text('文件读写'),
            ),
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}