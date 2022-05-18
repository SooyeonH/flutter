import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Screen2nd extends StatelessWidget {
  const Screen2nd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('screen 2nd '),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text(
          'screen 2nd',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
