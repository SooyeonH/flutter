import 'package:flutter/material.dart';
import 'package:textfield_login_app/main2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController textEditingController1;
  late TextEditingController textEditingController2;

  @override
  void initState() {
    textEditingController1=TextEditingController();
    textEditingController2=TextEditingController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  title: const Text('Log In'),
),
body: Center(
  child: Column(
   
    // ignore: prefer_const_literals_to_create_immutables
    children: [
      SizedBox(
height: 40,
      ),
      const CircleAvatar(
        radius: 50,
        child: Icon(Icons.person,
        size: 60,),
        


      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: TextField(
          controller: textEditingController1,
          decoration: const InputDecoration(labelText: "사용자 ID를 입력하세요"),
          keyboardType: TextInputType.text,
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: TextField(
          controller: textEditingController2,
          decoration: const InputDecoration(labelText: "패스워드를 입력하세요"),
          keyboardType: TextInputType.text,
          obscureText: true,
        ),
      ),
      ElevatedButton(onPressed: (){
        if (textEditingController1.text.trim().isEmpty ||
                      textEditingController2.text.trim().isEmpty) {
                    errorsnackbar(context);
                  }else if (textEditingController1.text!='root' 
                  || textEditingController2.text!='qwer1234' ) {
                    errorsnackbar1(context);
                  
                  }else if(textEditingController1.text=='root' 
                  || textEditingController2.text=='qwer1234'){
                _showDialog(context);
                    
                  };
      },
       child: const Text('Log In')
       ),
    ],
  ),
),
    );
  }
  errorsnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('사용자 ID와 암호를 입력하세요'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }

  errorsnackbar1(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('사용자 ID나 암호가 일치하지 않습니다'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.blue,
      ),
    );
  }

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: const Text('환영합니다!'),
          content: const Text('신분이 확인되었습니다.'),
          actions: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                  Navigator.push(context,
                   MaterialPageRoute(builder: (context){
                     return const MyHomePage();
                   },
                   ),
                   );
                },
                child: const Text('OK'),
              ),
            ),
          ],
        );
      },
    );
  }
}