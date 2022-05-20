import 'dart:async';

import 'package:character_drawer_app/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Showresult extends StatefulWidget {
  const Showresult({Key? key}) : super(key: key);

  @override
  State<Showresult> createState() => _ShowresultState();
}

class _ShowresultState extends State<Showresult> {
  late String displayCharater;
  late List str;
  late String charater;
  late int num2;

  @override
  void initState() {
    super.initState();
    displayCharater = Message.ment;
    str = displayCharater.split('');
    num2 = 0;
    charater = '';
   

    //Timer
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      changeword();
    });
  }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: const Text('LED 광고'),
      ),
      body: Center(
        child: Text(charater,
        style: TextStyle(fontSize: 60,),
        ),
      ),
    );
  }

  changeword() {
    setState(() {
      if(num2 == str.length){
        num2 = 0;
        charater = '';
      }
      charater += str[num2];
      num2++;
    });
  }
}