import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:pkhos/pages/cctv.dart';
import 'package:pkhos/pages/home.dart';
import 'package:pkhos/pages/profile.dart';
import 'package:pkhos/states/signout.dart';
import 'package:pkhos/utility/my_constant.dart';
import 'package:pkhos/widgets/list_cctv.dart';
import 'package:pkhos/widgets/list_cctv_add.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  Widget curentWidget = ListCctv();
  List<Widget> widgets = [ListCctv(), Listcctvadd()];
  final items = const [
    Icon(Icons.home, size: 26, color: Colors.white),
    Icon(Icons.photo_camera_front, size: 26, color: Colors.white),
    Icon(Icons.person, size: 26, color: Colors.white),
    Icon(Icons.message, size: 26, color: Colors.white),
    // Icon(Icons.add, size: 26, color: Colors.white),
    Icon(Icons.notifications, size: 26, color: Colors.white),
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 211, 187, 252),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 171, 125, 250),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
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
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Version',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Version 670305')));
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () => signoutProcess(context),
            // onPressed: () {
            //   // Navigator.pushNamedAndRemoveUntil(
            //   //     context, MyConstant.routeLogin, (route) => false);
            //   MaterialPageRoute route = MaterialPageRoute(
            //     builder: (context) => Login(),
            //   );
            //   Navigator.pushAndRemoveUntil(context, route, (route) => false);
            // },
          ),
        ],
      ),
      
      bottomNavigationBar: CurvedNavigationBar(
        items: items,
        index: index,
        onTap: (selectedIndex) {
          setState(() {
            index = selectedIndex;
          });
        },
        height: 70,
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Color.fromARGB(255, 171, 125, 250),
        color: Color.fromARGB(255, 171, 125, 250),
        animationDuration: const Duration(milliseconds: 300), 
      ),
      body: Container(
        color: Color.fromARGB(255, 211, 187, 252),
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: getSelectedWidget(index: index),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: BottomAppBar(
      //   shape: CircularNotchedRectangle(),
      //   notchMargin: 10,
      //   child: Container(
      //     height: 70,
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         MaterialButton(
      //           minWidth: 20,
      //           onPressed: () {
      //             setState(() {
      //               curentWidget = Listcctvadd();
      //               // _index = 0;
      //             });
      //             Navigator.pop(context);
      //           },
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               Icon(
      //                 Icons.qr_code_scanner_sharp,
      //                 color: _index == 0 ? Colors.orange : Colors.grey,
      //               ),
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }

  Widget getSelectedWidget({required int index}) {
    Widget widget;
    switch (index) {
      case 0:
        widget = const HomePage();
        break;
      case 1:
        widget = const CctvPage();
        break;
      case 2:
        widget = const Profile();
        break;
      default:
        widget = const HomePage();
    }
    return widget;
  }

  // Drawer Showdrawer() => Drawer(
  //       child: Stack(children: showcctvadd),
  //     );

  // List<Widget> get showcctv {
  //   return [
  //     ListTile(
  //       onTap: () {
  //         setState(() {
  //           curentWidget = ListCctv();
  //           _index = 0;
  //            Navigator.pop(context);
  //         });

  //       },
  //       leading: Icon(Icons.add),
  //       title: Text('data'),
  //       subtitle: Text('subdata'),
  //     )
  //   ];
  // }

  // List<Widget> get showcctvadd {
  //   return [
  //     ListTile(
  //       onTap: () {
  //         setState(() {
  //           curentWidget = Listcctvadd();
  //           _index = 1;
  //            Navigator.pop(context);
  //         });

  //       },
  //       leading: Icon(Icons.add),
  //       title: Text('data'),
  //       subtitle: Text('subdata'),
  //     )
  //   ];
  // }

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
