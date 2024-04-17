import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pkhos/utility/my_constant.dart';
import 'package:pkhos/widgets/list_cctv.dart';
import 'package:pkhos/widgets/list_cctv_add.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  bool isFABExtended = false;
  int _index = 0;
  Widget curentWidget = ListCctv();
  List<Widget> widgets = [
    ListCctv(),
    Listcctvadd()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 249, 232, 240),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 171, 125, 250),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.photo_camera_front,
                    color: Color.fromARGB(255, 255, 255, 255))),
            Text(
              // 'Ver.670305',
              'PK-Service',
              style: MyConstant().h1whit17(),
            ),
          ],
        ),
      ),
      drawer: Showdrawer(),
      body: curentWidget,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                minWidth: 20,
                onPressed: () {
                  setState(() {
                    curentWidget = Listcctvadd();
                    // _index = 0;
                  });
                  Navigator.pop(context);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.qr_code_scanner_sharp,
                      color: _index == 0 ? Colors.orange : Colors.grey,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Drawer Showdrawer() => Drawer(
        child: Stack(children: showcctvadd),
      );

  List<Widget> get showcctv {
    return [
      ListTile(
        onTap: () {
          setState(() {
            curentWidget = ListCctv();
            _index = 0;
             Navigator.pop(context);
          });
         
        },
        leading: Icon(Icons.add),
        title: Text('data'),
        subtitle: Text('subdata'),
      )
    ];
  }

  List<Widget> get showcctvadd {
    return [
      ListTile(
        onTap: () {
          setState(() {
            curentWidget = Listcctvadd();
            _index = 1;
             Navigator.pop(context);
          });
         
        },
        leading: Icon(Icons.add),
        title: Text('data'),
        subtitle: Text('subdata'),
      )
    ];
  }

  // ListTile showcctvadd() => ListTile(
  //   leading: Icon(Icons.add),
  //   title: Text('data'),
  //   subtitle: Text('subdata'),
  //   onTap: () {
  //     setState(() {

  //                   // _index = 0;
  //                 });
  //                   Navigator.pop(context);
  //   },
  // );
}
