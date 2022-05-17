import 'package:flutter/material.dart';

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: const Text(
          "영웅 card",
        ),
        backgroundColor: Color.fromARGB(255, 231, 107, 6),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: 
            
              [
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                   
                    child: CircleAvatar(
                      backgroundImage: AssetImage('images/Lee.jpg'),
                      radius: 60,
                    ),
                  ),
                ),
                Divider(
                  height: 30,
                  color: Color.fromARGB(205, 59, 53, 53),
                  thickness: 0.7,
                ),
                
                Text(
                  "성웅",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                Text(
                  "이순신 장군",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "전적",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                Text(
                  "62전 62승",
                  style: TextStyle(
                    color: Color.fromARGB(255, 210, 55, 13),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
                Row(
                  children: [
                     Icon(Icons.check_circle_outline),
                    Text(
                        "옥포해전",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                  
                  ],
                ),
                    
                  
                 Row(
                   children: [
                      Icon(Icons.check_circle_outline),
                     Text(
                      "사천포해전",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                ),
                   ],
                 ),
                 Row(
                   children: [
                      Icon(Icons.check_circle_outline),
                     Text(
                      "당포해전",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                ),
                   ],
                 ),
                 Row(
                   children: [
                      Icon(Icons.check_circle_outline),
                     Text(
                      "한산도대첩",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                ),
                   ],
                 ),
                 Row(
                   children: [
                      Icon(Icons.check_circle_outline),
                     Text(
                      "부산포해전",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                ),
                   ],
                 ),
                 Row(
                   children: [
                      Icon(Icons.check_circle_outline),
                     Text(
                      "명량해전",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                ),
                   ],
                 ),
                 Row(
                   children: [
                      Icon(Icons.check_circle_outline),
                     Text(
                      "노량해전",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                ),
                   ],
                 ),
                Center(
                  child: Padding(
                    
                    padding: EdgeInsets.all(15.0),
                   
                    child: CircleAvatar(
                      
                      backgroundImage: AssetImage('images/turtle.gif',
                       ),
                      backgroundColor: Colors.orange,
                      radius: 30,
                    
                      
                    ),
                  ),
                ),
              ],
        ),
      ),
    );
  }
}
