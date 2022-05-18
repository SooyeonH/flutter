import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Screen extends StatelessWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mail"),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/1st');
            },
            icon: Icon(Icons.email),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/2nd');
            },
            icon: Icon(Icons.email_outlined),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/1st');
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              child: const Text("보낸 편지함"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/2nd');
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              child: const Text("받은 편지함"),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          //똑같은 뷰로 아래로 쌓이는 것
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/pikachu-1.jpg'),
              ),
              accountName: Text('pikachu'),
              accountEmail: Text('pikachu@naver.com'),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
            ),
            Column(
              children: [
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, '/1st');
                  },
                  leading: const Icon(
                    Icons.mail,
                    color: Colors.blue,
                  ),
                  title: const Text('보낸 편지함'),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, '/2nd');
                  },
                  leading: const Icon(
                    Icons.mail_outline,
                    color: Colors.red,
                  ),
                  title: const Text('받은 편지함'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
