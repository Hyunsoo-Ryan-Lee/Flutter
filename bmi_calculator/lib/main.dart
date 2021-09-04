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
  String result = '';
  double height = 0;
  double weight = 0;
  int age = 0;
  final _valuelist = [
    '주로 좌식 생활',
    '주 1~3일 운동',
    '주 3~5일 운동',
    '거의 매일 운동',
    '매일 강도높게 운동'
  ];
  String dropdownValue = '주로 좌식 생활';
  String holder = '';
  TextEditingController heightcontroller = TextEditingController();
  TextEditingController weightcontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();

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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    radioButton('Man', Colors.blueAccent, 0),
                    radioButton('Women', Colors.redAccent, 1)
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  '나이를 입력하세요 :',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: agecontroller,
                  textAlign: TextAlign.center, // 내부 문자 center 정렬
                  decoration: InputDecoration(
                      hintText: '나이를 입력하세요', // 입력칸에 연하게 보이는 문자
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      )),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  '신장을 입력하세요(cm) :',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: heightcontroller,
                  textAlign: TextAlign.center, // 내부 문자 center 정렬
                  decoration: InputDecoration(
                      hintText: '신장을 입력하세요(cm)', // 입력칸에 연하게 보이는 문자
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      )),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  '체중을 입력하세요(Kg) :',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: weightcontroller,
                  textAlign: TextAlign.center, // 내부 문자 center 정렬
                  decoration: InputDecoration(
                      hintText: '체중을 입력하세요(Kg)', // 입력칸에 연하게 보이는 문자
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      )),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  '활동 정도를 선택하세요',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: DropdownButton(
                    value: dropdownValue,
                    onChanged: (String? newValue) {
                      getDropDownItem();
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: _valuelist
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    elevation: 4,
                    icon: const Icon(Icons.arrow_drop_down_rounded),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    '$holder',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                    width: double.infinity,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          height = double.parse(heightcontroller.value.text);
                          weight = double.parse(weightcontroller.value.text);
                          age = int.parse(agecontroller.value.text);
                        });
                        calculateBmi(age, height, weight);
                      },
                      style: TextButton.styleFrom(primary: Colors.blue[200]),
                      child: Text(
                        'Calculate',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    'Your BMI is : ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 50.0),
                Container(
                  width: double.infinity,
                  child: Text(
                    '$result',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // String calculateBmi(double height, double weight) {
  //   double result = weight / (height * height);
  //   String bmi = result.toStringAsFixed(2);
  //   return bmi;
  // }

  void calculateBmi(int age, double height, double weight) {
    double finalresult = 655 + (9.6 * weight) + (1.8 * height) - (4.7 * age);
    String bmi = finalresult.toStringAsFixed(2);
    setState(() {
      result = bmi;
    });
  }

  void change(int index) {
    setState(() {
      currentindex = index;
    });
  }

  void getDropDownItem() {
    setState(() {
      holder = dropdownValue;
    });
  }

  Widget radioButton(String value, Color color, int index) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12.0),
        height: 80.0,
        child: OutlinedButton(
          // style: ButtonStyle(
          // backgroundColor: MaterialStateProperty.all(Colors.grey[100])),
          style: OutlinedButton.styleFrom(
            backgroundColor: currentindex == index ? color : Colors.grey[200],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          onPressed: () {
            change(index);
          },
          child: Text(
            value,
            style: TextStyle(
              color: currentindex == index ? Colors.black : color,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
