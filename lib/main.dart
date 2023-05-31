import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bmi_app/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var homeBgColor = Color.fromARGB(255, 184, 149, 188);

  var weight_controller = TextEditingController();
  var heightFT_controller = TextEditingController();
  var heightIN_controller = TextEditingController();

  var result = '';
  var massage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        backgroundColor: const Color.fromARGB(255, 71, 28, 78),
      ),
      body: Container(
        color: homeBgColor,
        child: Center(
          child: Container(
            width: 300,
            height: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'BMI',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 21,
                ),
                TextField(
                  cursorColor: Colors.black,
                  controller: weight_controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text(
                      'Enter Your Weight (in KG)',
                    ),
                    labelStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(
                      Icons.line_weight,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  cursorColor: Colors.black,
                  controller: heightFT_controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text('Enter Your Height (in FT)'),
                    labelStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(
                      Icons.height,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: heightIN_controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text('Enter Your Height (in IN)'),
                    labelStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(Icons.height),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    var weight = int.parse(weight_controller.text.toString());
                    var heightFT =
                        int.parse(heightFT_controller.text.toString());
                    var heightIN =
                        int.parse(heightIN_controller.text.toString());

                    if (weight != '' && heightFT != '' && heightIN != '') {
                      var total_heightIN = (heightFT * 12) + heightIN;
                      var total_CM = total_heightIN * 2.54;
                      var total_M = total_CM / 100;
                      var bmi = weight / (total_M * total_M);

                      if (bmi < 18) {
                        massage = 'You Are UnderWeight !! ';
                        homeBgColor = const Color.fromARGB(255, 155, 202, 240);
                      } else if (bmi > 25) {
                        massage = 'You Are OverWeight !! ';
                        homeBgColor = const Color.fromARGB(255, 239, 144, 154);
                      } else {
                        massage = 'You are Healthy !!';
                        homeBgColor = const Color.fromARGB(255, 150, 233, 153);
                      }

                      setState(() {
                        result =
                            '$massage and Your BMI is ${bmi.toStringAsFixed(3)}';
                      });
                    } else {
                      setState(() {
                        result = "Please enter all tha required blanks !!!";
                      });
                    }
                  },
                  child: Text('Calculate'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  result,
                  style: TextStyle(
                    fontSize: 19,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
