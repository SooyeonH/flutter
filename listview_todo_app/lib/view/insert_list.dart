import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:listview_todo_app/model/message.dart';

class InsertList extends StatefulWidget {
  const InsertList({Key? key}) : super(key: key);

  @override
  State<InsertList> createState() => _InsertListState();
}

class _InsertListState extends State<InsertList> {
  late TextEditingController textEditingController;
  late bool switchValue;
  late bool switchValue2;
  late bool switchValue3;
  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    switchValue = true;
    switchValue2 = false;
    switchValue3 = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add View'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("구매"),
                  Switch(
                      value: switchValue,
                      onChanged: (value) {
                        setState(() {
                          switchValue = value;
                          if (switchValue) {
                            switchValue2 = false;
                            switchValue3 = false;
                          }
                        });
                      }),
                  const CircleAvatar(
                    backgroundImage: AssetImage('images/cart.png'),
                    radius: 20,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("약속"),
                  Switch(
                      value: switchValue2,
                      onChanged: (value) {
                        setState(() {
                          switchValue2 = value;
                          if (switchValue2) {
                            switchValue = false;
                            switchValue3 = false;
                          }
                        });
                      }),
                  const CircleAvatar(
                    backgroundImage: AssetImage('images/clock.png'),
                    backgroundColor: Colors.white,
                    radius: 20,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("스터디"),
                  Switch(
                      value: switchValue3,
                      onChanged: (value) {
                        setState(() {
                          switchValue3 = value;
                          if (switchValue3) {
                            switchValue = false;
                            switchValue2 = false;
                          }
                        });
                      }),
                  Image.asset(
                    'images/pencil.png',
                    width: 40,
                    height: 40,
                  ),
                ],
              ),
              TextField(
                controller: textEditingController,
                decoration: const InputDecoration(
                  labelText: '목록을 입력하세요',
                ),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  if (textEditingController.text.trim().isNotEmpty) {
                    addList();
                  }
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //function
  addList() {
    if (switchValue) {
      Message.imagePath = "images/cart.png";
    }
    if (switchValue2) {
      Message.imagePath = "images/clock.png";
    }
    if (switchValue3) {
      Message.imagePath = "images/pencil.png";
    }
    Message.workList = textEditingController.text;
    Message.action = true;
  }
}
