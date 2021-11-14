import 'package:flutter/material.dart';

class DescriptionPage extends StatefulWidget {
  const DescriptionPage({Key? key}) : super(key: key);


  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {

  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _saveAction() {

    print(_userNameController.text);
    print(_passwordController.text);

  }

  // 创建文件目录
Future<File> get _localFile async {
  final directory = await getApplicationDocumentsDirectory();
  final path = directory.path;
  return File('$path/content.txt');
}
// 将字符串写入文件
Future<File> writeContent(String content) async {
  final file = await _localFile;
  return file.writeAsString(content);
}
// 从文件读出字符串
Future<String> readContent() async {
  try {
    final file = await _localFile;
    String contents = await file.readAsString();
    return contents;
  } catch (e) {
    return "";
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('文件读写'),
        backgroundColor: Colors.cyan,
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: _userNameController,
            decoration: const InputDecoration(
              labelText: "用户名",
              hintText: "用户名或邮箱",
              prefixIcon: Icon(Icons.person),
            ),
          ),
          TextField(
            controller: _passwordController,
            decoration: const InputDecoration(
              labelText: "密码",
              hintText:  "请输入密码",
              prefixIcon: Icon(Icons.lock),
            ),
            obscureText: true,
          ),
          ElevatedButton(
            onPressed: () {

              _saveAction();

            },
             child: const Text('记住用户名密码'),
          ),
        ],
      ),
    );
  }
}



// class DescriptionPage extends StatelessWidget {
//   const DescriptionPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Description'),
//       ),
//       body: const Center(
//         child: Text('this is description'),
//       ),
//     );
//   }
// }