import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:pkhos/pages/cctv.dart';
import 'package:pkhos/pages/home.dart';
import 'package:pkhos/pages/profile.dart';
import 'package:pkhos/screens/admin/cctv/maincctv.dart';
import 'package:pkhos/screens/admin/cctv/mainhome.dart';
import 'package:pkhos/screens/admin/cctv/mainprofile.dart';
import 'package:pkhos/screens/admin/cctv/mainreport.dart';
import 'package:pkhos/states/signout.dart';
import 'package:pkhos/utility/my_constant.dart';
import 'package:pkhos/widgets/list_cctv.dart';
import 'package:pkhos/widgets/list_cctv_add.dart';

class AdminNew extends StatefulWidget {
  const AdminNew({super.key});

  @override
  State<AdminNew> createState() => _AdminNewState();
}

int currentIndex = 0;
List screens = const [
  // Scaffold(),
  MainHome(),
  MainCctv(),
  MainReport(),
  MainProfile(),
  Scaffold()
];

class _AdminNewState extends State<AdminNew> {
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: Text('data'),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            currentIndex = 2;
          });
        },
        shape: const CircleBorder(),
        backgroundColor: MyConstant.cctvaddColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 35,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        height: 60,
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 0;
                });
              },
              icon: Icon(
                Icons.home,
                size: 30,
                color: currentIndex == 0
                    ? MyConstant.cctvhomeColor
                    : Colors.grey.shade400,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 1;
                });
              },
              icon: Icon(
                Icons.photo_camera_front,
                size: 30,
                color: currentIndex == 1
                    ? MyConstant.kcctvtColor
                    : Colors.grey.shade400,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 3;
                });
              },
              icon: Icon(
                Icons.bar_chart,
                size: 30,
                color: currentIndex == 3
                    ? MyConstant.cctvtreportColor
                    : Colors.grey.shade400,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 4;
                });
              },
              icon: Icon(
                Icons.person,
                size: 30,
                color: currentIndex == 4
                    ? MyConstant.cctvprofileColor
                    : Colors.grey.shade400,
              ),
            ),
          ],
        ),
      ),
      body: screens[currentIndex],
    );
  }
}
