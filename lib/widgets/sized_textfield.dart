import 'package:bmi/UI-helper/textstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class sizedinch extends StatelessWidget {
  var inchheightinput = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: TextField(
        keyboardType: TextInputType.number,
        controller: inchheightinput,
        style: t20(),
        decoration: InputDecoration(
            label: Text('Please enter your in inch'),
            suffixIcon: Icon(Icons.height),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50))),
      ),);

  }
}
