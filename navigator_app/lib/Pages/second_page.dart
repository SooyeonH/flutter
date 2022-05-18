import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 appBar: AppBar(
        title: const Text("Second Page"),
        backgroundColor: Colors.red,
      ),
body: Center(
  child: ElevatedButton(
    onPressed: (){
    Navigator.pop(context);  //첫번째 위에 두번째페이지가 올라가져 있는거기 떄문에 두번째 페이지만 없애주면 첫번쨰페이지가 보임 
  },
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.red),
  ),
   child: const Text('Go to the first page'),
),
    ),
    );
  }
}