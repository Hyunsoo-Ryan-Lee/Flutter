import 'package:final_project/login/join_login.dart';
import 'package:final_project/login/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider<JoinOrLogin>.value(
          value: JoinOrLogin(), child: Authpage()), 
    );
  }
}
