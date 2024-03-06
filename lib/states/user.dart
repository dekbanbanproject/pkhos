import 'package:flutter/material.dart';
import 'package:pkhos/utility/my_constant.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 249, 232, 240),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 249, 232, 240),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Ver.670305',
              style: MyConstant().h1whit17(),
            ),
          ],
        ),
      ),
     
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.lightBlueAccent,
        foregroundColor: Color.fromARGB(255, 250, 240, 245),
      ),
      bottomNavigationBar: BottomAppBar(
          color: Colors.lightBlue,
          child: Container(height: 50.0,),
      ),
       floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
