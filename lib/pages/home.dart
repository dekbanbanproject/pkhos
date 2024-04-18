import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Text('Home Page'),
          Center(child: SizedBox(height: 150,)),
          CircleAvatar(
            radius: 70,
            child: Icon(Icons.home,size: 120,),
          )
        ],
      ),
    );
  }
}