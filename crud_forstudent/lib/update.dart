import 'package:crud_forstudent/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mysql1/mysql1.dart';

class Updatepage extends StatefulWidget {
  final Map data1;
  const Updatepage({Key? key, required this.data1}) : super(key: key);

  @override
  State<Updatepage> createState() => _UpdatepageState();
}

class _UpdatepageState extends State<Updatepage> {

  var settings = ConnectionSettings(
  host: 'localhost', 
  port: 3306,
  user: 'root',
  password: 'qwer1234',
  db: 'education'
);

 

//property
  late TextEditingController codeController;
  late TextEditingController nameController;
  late TextEditingController deptController;
  late TextEditingController phoneController;
  

  late List data;
  String code="";
  String name="";
   String dept="";
   String phone="";
   String result="";
 
 @override
  void initState() {
    super.initState();
    data = [];
    codeController =TextEditingController();
    nameController =TextEditingController();
    deptController =TextEditingController();
    phoneController =TextEditingController();
    codeController.text=widget.data1['code'];
    nameController.text=widget.data1['name'];
    deptController.text=widget.data1['dept'];
    phoneController.text=widget.data1['phone'];
    // getJSONData();
    getData();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update for CRUD'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
          children: [
            SizedBox(
              height: 200,
              child: Column(children: [
                TextField(
                controller: codeController,
                decoration: const InputDecoration(labelText: '학번입니다.',
                ),
                keyboardType: TextInputType.text,
              ),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: '성명을 수정하세요',
                ),
                keyboardType: TextInputType.text,
              ),
              TextField(
                controller: deptController,
                decoration: const InputDecoration(labelText: '전공을 수정하세요',
                ),
                keyboardType: TextInputType.text,
              ),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: '전화번호 수정하세요',
                ),
                keyboardType: TextInputType.number,
              ),
              ],),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(onPressed: (){
              code=codeController.text;
              name=nameController.text;
              dept=deptController.text;
              phone=phoneController.text;
  setState(() {
    
              updateData();
  });
             
              Navigator.pop(context);
              
            }, 
            child:const Text('수정'),
            
            ),

          ],
      ),
        ),
      )


    );
  }

  updateData() async {
    var conn = await MySqlConnection.connect(settings);

    await conn.query(
    'update student set sname=?, sdept=?, sphone=? where scode=?',
    [ name, dept, phone, code ]);

    conn.close();
  }

  getData() async {
    var conn = await MySqlConnection.connect(settings);
    var results = await conn.query("select scode, sname, sdept,sphone from student where scode = ?", widget.data1['code']);
    setState(() {
      data.add(results);
    });
    conn.close();
  }
}