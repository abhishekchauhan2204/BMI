import 'package:bmi/UI-helper/textstyle.dart';

import 'package:bmi/splash_screen.dart';
import 'package:bmi/widgets/sized_textfield.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BMI',
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          useMaterial3: true,
        ),
        home: splashscreen());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var weightinput = TextEditingController();
  var feetheightinput = TextEditingController();
  var inchheightinput = TextEditingController();
  var bgcolor;

  var result = '';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Dismiss the keyboard when tapped outside the TextField
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          flexibleSpace: Center(
            child: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/images/play_store_512.png'),
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.purple,
        ),
        body: Container(
          color: bgcolor,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Welcome', style: t25(rang: Colors.purple)),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                        width: 250,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: weightinput,
                          style: t20(),
                          decoration: InputDecoration(
                            label: Text('Please enter your weight in kgs'),
                            suffixIcon: Icon(Icons.line_weight),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide()),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide()),
                          ),
                        )),
                    Text(weightinput.text.toString()),
                    SizedBox(
                        width: 250,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: feetheightinput,
                          style: t20(),
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.height),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide()),
                            label: Text('Please enter your height in feet'),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide()),
                          ),
                        )),
                    Text(feetheightinput.text.toString()),
                    SizedBox(
                      width: 250,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: inchheightinput,
                        style: t20(),
                        decoration: InputDecoration(
                            label: Text('Please enter your height in inch'),
                            suffixIcon: Icon(Icons.height),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50))),
                      ),
                    ),
                    Text(inchheightinput.text.toString()),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                Colors.deepPurple.shade100)),
                        onPressed: () {
                          var wt = weightinput.text.toString();
                          var fht = feetheightinput.text.toString();
                          var iht = inchheightinput.text.toString();

                          if (wt != '' && fht != '' && iht != '') {
                            //BMI calculation

                            var iwt = int.parse(wt);
                            var ifth = int.parse(fht);
                            var iith = int.parse(iht);

                            var tinch = (ifth * 12) + iith;
                            var tcm = (2.54 * tinch);
                            var meter = (tcm / 100);

                            var bmi = iwt / (meter * meter);

                            var msg = '';

                            if (bmi > 25) {
                              msg = 'you are overweight';
                              bgcolor = Colors.deepOrangeAccent.shade100;
                            } else if (bmi < 18) {
                              msg = 'you are underweight';
                              bgcolor = Colors.red.shade100;
                            } else {
                              msg = 'you are healthy';
                              bgcolor = Colors.green.shade200;
                            }
                            ;

                            setState(() {
                              result =
                                  '$msg \nyour bmi is ${bmi.toStringAsFixed(2)}';
                            });
                          } else {
                            setState(() {
                              result = 'please provide the data in above field';
                            });
                          }
                        },
                        child: Text(
                          'Calculate',
                          style: t25(rang: Colors.purple),
                        )),
                    Text(
                      result,
                      style: t25(rang: Colors.purple),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
