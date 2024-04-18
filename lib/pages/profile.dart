import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Text('Profile Page'),
          Center(child: SizedBox(height: 150,)),
          CircleAvatar(
            radius: 70,
            child: Icon(Icons.people,size: 120,),
          )
        ],
      ),
    );
  }
}