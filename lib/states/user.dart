import 'dart:io';

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
  // void _switchButton() {
  //   setState(
  //     () {
  //       isFABExtended = !isFABExtended;
  //     },
  //   );
  // }
  Widget build(BuildContext context) {
    // return const Placeholder();
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: CustomPaint(
          // painter: HexagonPainter(Offset(11,11),30)
          child: const Icon(Icons.add, color: Colors.white, size: 28),
        ),
        // elevation: 12,
        backgroundColor: Color.fromARGB(255, 171, 125, 250),
        // tooltip: 'Menu',
        //
        onPressed: () {},
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 5.0,
        color: const Color.fromARGB(255, 171, 125, 250),
        // shape: const CircularNotchedRectangle(),
        // shape: cur,
        // shape: BeveledRectangleBorder(
        //   borderRadius: BorderRadius.zero
        // ),
        height: 55,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.home,
                    color: Color.fromRGBO(43, 217, 254, 1.0))),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite, color: Colors.red))
          ],
        ),
      ),
    );
  }
}
