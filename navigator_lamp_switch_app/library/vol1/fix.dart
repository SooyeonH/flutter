import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';


import 'main.dart';
import 'message.dart';

class Fixpage extends StatefulWidget {
  const Fixpage({Key? key}) : super(key: key);

  @override
  State<Fixpage> createState() => _FixpageState();
}

class _FixpageState extends State<Fixpage> {
  late bool _switchcolor;
  late bool _switchonoff;

  @override
  void initState() {
    _switchcolor = false;
    _switchonoff = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('수정화면'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(Message.lampcolor),
                Switch(
                    value: _switchcolor,
                    onChanged: (value) {
                      setState(() {
                        _switchcolor = value;

                        if (_switchcolor) {
                          Message.lampcolor = "Yellow";
                        } else {
                          Message.lampcolor = "Red";
                        }
                        if (_switchonoff) {
                          _switchcolor = false;
                        }
                      });
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(Message.lamponoff),
                Switch(
                    value: _switchonoff,
                    onChanged: (value) {
                      setState(() {
                        _switchonoff = value;

                        if (_switchonoff) {
                          Message.lamponoff = "Off";
                        } else {
                          Message.lamponoff = "On";
                        }
                      });
                    }),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    checklamp();
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const MyHomePage();
                      },
                    ),
                  );
                },
                child: const Text("OK")),
          ],
        ),
      ),
    );
  }

  checklamp() {
    if (_switchcolor) {
      Message.lampstate = 'images/lamp_red.png';
    } else if (_switchonoff) {
      Message.lampstate = 'images/lamp_off.png';
    } else {
      Message.lampstate = 'images/lamp_on.png';
    }
  }
}
