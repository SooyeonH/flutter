import 'package:flutter/material.dart';

import 'package:textfield_login_app/animal_item.dart';

class FirstPage extends StatefulWidget {
  final List<Animal> list;
  const FirstPage({Key? key, required this.list}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
            // 내장객체?
            itemCount: widget.list.length,
            itemBuilder: (context, position) {
              
              //gesturedetector 는 하나 누르면 상세 내용 나오게 하는 것 
              return GestureDetector(
                onTap: () {
                                      // 파라미터로 넣어줌 
                  _showKind(context, widget.list[position]);
                },
                child: Card(
                  child: Row(
                    children: [
                      Image.asset(
                        widget.list[position].imagePath,
                        height: 100,
                        width: 100,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Text(widget.list[position].animalName),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  _showKind(BuildContext context, Animal animal){
    showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext ctx) {
      return AlertDialog(
        title: Text(animal.animalName),
        content:
            Text('이 동물은 ${animal.animalName}입니다.'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('종료'),
          )
        ],
      );
    });
  }

}