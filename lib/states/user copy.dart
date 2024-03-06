import 'package:flutter/material.dart';
import 'package:pkhos/utility/my_constant.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
 bool isFABExtended = false; 

  @override
  // void initState() {
  //   super.initState();    
  // }
  void _switchButton() {
    setState(
      () {
        isFABExtended = !isFABExtended;
      },
    );
  }
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: isFABExtended ? FloatingActionButton(
        onPressed: _switchButton,
          child: Icon(Icons.check),
          )
      : FloatingActionButton.extended(
          onPressed: _switchButton,
          label: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: Icon(Icons.add),
              ),
              Text("Add Button")
            ],
          ),
        ),
        // onPressed: () {},
        // child: Icon(Icons.add),
        // backgroundColor: Colors.lightBlueAccent,
        // foregroundColor: Color.fromARGB(255, 250, 240, 245),
        // elevation: 0,
        // shape: BeveledRectangleBorder(
        //     borderRadius: BorderRadius.circular(30.0),
        //     side: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
        //     ),
        
    //   ),
    //   bottomNavigationBar: BottomAppBar(
    //     notchMargin: 5.0,
    //       shape: CircularNotchedRectangle(),
    //     color: Colors.lightBlue,
    //     child: Container(
    //       height: 50.0,
    //     ),
    //   ),
    );
  }
}
