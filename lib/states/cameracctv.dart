import 'package:flutter/material.dart';
import 'package:pkhos/utility/my_constant.dart';

class CameraCCtv extends StatefulWidget {
  const CameraCCtv({Key? key}) : super(key: key);

  @override
  State<CameraCCtv> createState() => _CameraCtState();
}

class _CameraCtState extends State<CameraCCtv> {
 bool loadStatus = true;

@override
void initState() {
  super.initState();
  
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 249, 232, 240),
       appBar: AppBar(title: Text('ลงข้อมูลกล้องวงจรปิด'),
          // elevation: 0,
          // backgroundColor: Colors.white,
          // leading: Builder(
          //   builder: (context) {
          //     return IconButton(
          //       onPressed: () => Scaffold.of(context).openDrawer(),
          //       icon: Icon(
          //         Icons.menu_open,
          //         color: Colors.orange,
          //       ),
          //     );
          //   },
          // ),
          // title: Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [MyConstant().version],
          // ),
        ),
      // drawer: Drawer(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.end,
      //   ),
      // ),
      // body: SafeArea(child: Container()),
    );
  }
}