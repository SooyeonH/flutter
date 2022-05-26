import 'package:flutter/material.dart';

class Fixpage extends StatefulWidget {
  final String textvalue;

  const Fixpage({Key? key, required this.textvalue}) : super(key: key);

  @override
  State<Fixpage> createState() => _FixpageState();
}

class _FixpageState extends State<Fixpage> {
  late TextEditingController textEditingController2;
  late bool _switchonoff;
  late List contentall;
  late String ment;

  @override
  void initState() {
    super.initState();
    textEditingController2 = TextEditingController();
    textEditingController2.text = widget.textvalue;
    _switchonoff = true;
    contentall = [];
    ment="On";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("수정화면"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: textEditingController2,
                
                keyboardType: TextInputType.text,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                ment
                ),
                Switch(
                    value: _switchonoff,
                    onChanged: (value) {
                      setState(() {
                        _switchonoff = value;
                        onoff();
                      });
                    }),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  contentall.add(textEditingController2.text);
                  contentall.add(_switchonoff);
                });
                Navigator.pop(context, contentall);
                //유언장 같은거 사라지고 contentall을 남긴다고 생각하기 
              },
              child: Text('OK'),
            ),
          ],
        ),
      ),
    );
  }
  onoff(){
    if(_switchonoff){
      ment="On";
    }else{
      ment="Off";
    }
  }
}
