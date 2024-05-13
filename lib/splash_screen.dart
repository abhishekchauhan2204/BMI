import 'dart:async';

import 'package:bmi/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class splashscreen extends StatefulWidget {
  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () { Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return MyHomePage(title: 'BMI');
    },)); });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.lightBlueAccent,

      body: Center(child: Text('BMI',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w800,color: Colors.black),))
    );
  }
}
