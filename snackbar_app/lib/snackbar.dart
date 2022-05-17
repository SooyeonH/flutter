import 'package:flutter/material.dart';


class MySnackBar extends StatelessWidget {
  const MySnackBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
       return Center(
         
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                //안에서 스낵바
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Elevated button is clicked'),
                    duration: Duration(seconds: 1),
                    backgroundColor: Colors.blue,
                   ),
                );
               
              },
              child: const Text('Snackbar Button'),
            ),
            ElevatedButton(
          style: ElevatedButton.styleFrom(
                primary: Colors.red,
          ),
          onPressed: () {
            //안에서 스낵바
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Elevated button is clicked'),
                duration: Duration(seconds: 1),
                backgroundColor: Colors.red,
               ),
            );
           
          },
          child: const Text('Snackbar Button'),
        ),
          ],
        ),
       );
      
   
  }
 
}

