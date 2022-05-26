import 'package:flutter/material.dart';
import 'package:listview_todo_app/model/message.dart';
import 'package:listview_todo_app/model/todo_list.dart';
import 'package:listview_todo_app/view/detail_list.dart';

class TableList extends StatefulWidget {
  const TableList({Key? key}) : super(key: key);

  @override
  State<TableList> createState() => _TableListState();
}

class _TableListState extends State<TableList> {
  // TodoList 배열 생성
  List<TodoList> todoList = [];

  @override
  void initState() {
    super.initState();
    todoList.add(TodoList(imagePath: 'images/cart.png', workList: '책구매'));
    todoList.add(TodoList(imagePath: 'images/clock.png', workList: '철수와 약속'));
    todoList
        .add(TodoList(imagePath: 'images/pencil.png', workList: '스터디 준비하기'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main View'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/insert') //context 위치, 화면 등등 기억하는것 
                  .then((value) => rebuildData());
            },
            icon: const Icon(
              Icons.add_outlined,
            ),
          ),
        ],
      ),
      body: Center(
        child: ListView.builder(
            itemCount: todoList.length, //todolist 개수만큼 만들어줌
            itemBuilder: (context, position) {
              //position이 인덱스같은것
              return Padding(
                padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                child: GestureDetector(
                  onTap: () {
                    Message.workList = todoList[position].workList;
                    Message.imagePath = todoList[position].imagePath;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailList(),
                        ));
                  },
                  child: Card(
                    color: position % 2 == 0
                        ? Color.fromARGB(255, 110, 230, 243)
                        : Color.fromARGB(255, 246, 223, 235),
                    child: Row(
                      children: [
                        Image.asset(
                          todoList[position].imagePath,
                          width: 100,
                          height: 100,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          todoList[position].workList,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  //function
  rebuildData() {
    setState(() {
      if (Message.action) {
        todoList.add(
            TodoList(imagePath: Message.imagePath, workList: Message.workList));
        Message.action = false;
      }
    });
  }
}
