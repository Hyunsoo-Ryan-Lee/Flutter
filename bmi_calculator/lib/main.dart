import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BmiCalculator(),
    );
  }
}

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({Key? key}) : super(key: key);

  @override
  _BmiCalculatorState createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'BMI Calculator',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0.0,
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  children: [
                    radioButton('Man', Colors.blue, 0),
                    radioButton('Women', Colors.pink, 1)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void change(int index) {
    setState(() {
      currentindex = index;
    });
  }

  Widget radioButton(String value, Color color, int index) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12.0),
        child: OutlinedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.grey[100])),
          // color: currentindex == index ? color : Colors.grey[200],
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(8.0),
          // ),
          onPressed: () {
            change(index);
          },
          child: Text(
            value,
            style: TextStyle(
              color: currentindex == index ? Colors.black : color,
            ),
          ),
        ),
      ),
    );
  }
}
