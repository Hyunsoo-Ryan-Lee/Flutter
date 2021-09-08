import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigation',
      theme: ThemeData(primarySwatch: Colors.brown),
      home: First(),
    );
  }
}

class First extends StatelessWidget {
  const First({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context2) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          OutlinedButton(
            child: Text('Go to the Second Page'),
            onPressed: () {
              Navigator.push(
                  context2, MaterialPageRoute(builder: (context) => Second()));
            },
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context2, MaterialPageRoute(builder: (context) => Third()));
              },
              child: Text('Go to the Third Page'))
        ],
      ),
    );
  }
}

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext ctx2) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: OutlinedButton(
          child: Text('Go to the First Page'),
          onPressed: () {
            Navigator.pop(ctx2);
          },
        ),
      ),
      backgroundColor: Colors.yellow[200],
    );
  }
}

class Third extends StatelessWidget {
  @override
  Widget build(BuildContext ctx3) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third Page'),
      ),
      body: Center(
        child: OutlinedButton(
          child: Text('Go to the First Page'),
          onPressed: () {
            Navigator.pop(ctx3);
          },
        ),
      ),
      backgroundColor: Colors.redAccent[100],
    );
  }
}
