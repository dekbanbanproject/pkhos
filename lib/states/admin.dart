import 'package:flutter/material.dart';
import 'package:pkhos/states/advertise.dart';
import 'package:pkhos/utility/my_constant.dart';
import 'package:pkhos/widgets/show_signout.dart';
import 'package:pkhos/widgets/show_title.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  Widget currentWidget = AdvertisePage();
  IconData? iconSharp;
  var onPressedFunc = () => {};
  @override
  void initState() {
    super.initState();
  }

  //   @override
  // void paint(Canvas canvas, Size size) {
  //   Paint paint = Paint()
  //   // ..color = color;  // ใส่สี
  //   Offset offset = Offset(size.width / 2, size.height / 2);  // กำหนดจุดที่จะวาดวงกลม
  //   double radius =  size.width / 2; // กำหนดรัศมี
  //   canvas.drawCircle(offset, radius, paint);   // วาดวงกลมใน canvas
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 249, 232, 240),
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
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
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blueAccent,
          ),
          width: 64,
          height: 64,
          child: ClipOval(
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: () {
                  print('Tapped!');
                },
              ),
            ),
          ),
        // child: Center(
        //   child: Container(
        //     height: 300,
        //     width: 300,
        //     decoration: BoxDecoration(
        //       color: Color(0xFF3be2a5),
        //       // shape: BoxShape.circle,
        //        borderRadius: BorderRadius.circular(30),
        //     ),
          ),
          // painter: MyCirclePainter(color: Colors.green[300]),
          // )
        // ),
        // child: Container(
        //     width: 500,
        // height: 500,
        // decoration: ShapeDecoration(
        //               color: Colors.red[300],
        //               shape: CircleBorder()
        //             )
        // ),
        //      child: Ink(
        // decoration: const ShapeDecoration(
        //   color: Colors.grey,
        //   shape: CircleBorder(),
        // ),
        // child: IconButton(
        //   icon: Icon(IconData(59870, fontFamily: 'MaterialIcons')),
        //   color: Colors.black,
        //   onPressed: () {},
      ),
      // child: Ink(
      //   decoration: const ShapeDecoration(
      //     color: Colors.grey,
      //     shape: CircleBorder(),
      //   ),
      //   child: IconButton(
      //     icon: Icon(iconSharp),
      //     color: Colors.black,
      //     onPressed: onPressedFunc,
      //   ),
      // child: Icon(Icons.add),
      // backgroundColor: Colors.lightBlueAccent,
      // foregroundColor: Color.fromARGB(255, 250, 240, 245),
      // elevation: 0,
      // shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10.0),
      // side: BorderSide(color: Colors.blue,width: 2.0,style:BorderStyle.solid )
      // ),
      // mini: true,
      // shape: BeveledRectangleBorder(
      //   borderRadius: BorderRadius.circular(20.0),
      //   side: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
      // ),
      // ),
      // bottomNavigationBar: BottomAppBar(
      // notchMargin: 5.0,
      // shape: BeveledRectangleBorder(borderRadius: ),
      // shape: CircularNotchedRectangle(),
      // shape: BeveledRectangleBorder(
      // borderRadius: BorderRadius.circular(20.0),
      // side: BorderSide(color: Colors.black12,width: 2.0,style: BorderStyle.solid),
      // ),
      // color: Colors.lightBlue,
      // child: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
      //   mainAxisSize: MainAxisSize.max,
      //   // children: [
      //   //   Padding(
      //   //     padding: const EdgeInsets.only(left: 10.0),
      //   //     child: Column(mainAxisSize: MainAxisSize.min, children: [
      //   //       Icon(
      //   //         Icons.home,
      //   //         color: Colors.white,
      //   //       ),
      //   //       Text(
      //   //         "Home",
      //   //         style: TextStyle(color: Colors.white),
      //   //       )
      //   //     ]),
      //   //   ),

      //   // ],
      // ),
      // ),
      // drawer: Drawer(
      //   child: ShowSignOut(),
      // ),
      drawer: Drawer(
        child: Stack(
          children: [
            ShowSignOut(),
            Column(
              children: [
                UserAccountsDrawerHeader(accountName: null, accountEmail: null),
                buildAdvertisePagemenu(),
                buildLeavemenu(),
                buildMeetingroommenu(),
                buildCarmenu(),
                buildAssetmenu(),
                buildSuppliesmenu(),
                buildWhereHousemenu(),
              ],
            ),
          ],
        ),
      ),
      // body: currentWidget);
    );
  }

  ListTile buildAdvertisePagemenu() {
    return ListTile(
      onTap: () {
        setState(() {
          currentWidget = AdvertisePage();
          Navigator.pop(context);
        });
      },
      leading: Icon(
        Icons.quick_contacts_dialer_outlined,
        size: 30,
        color: Colors.orange,
      ),
      title: ShowTitle(
        title: 'ประชาสัมพันธ์',
        textStyle: MyConstant().h2dark(),
      ),
    );
  }

  ListTile buildLeavemenu() {
    return ListTile(
      //  onPressed: () => Navigator.pushNamed(context, '/reset'),
      onTap: () {
        Navigator.pushNamed(context, '/gleave');
      },
      leading: Icon(
        Icons.quick_contacts_dialer_outlined,
        size: 30,
        color: Colors.orange,
      ),
      title: ShowTitle(
        title: 'ข้อมูลการลา',
        textStyle: MyConstant().h2dark(),
      ),
    );
  }

  ListTile buildMeetingroommenu() {
    return ListTile(
      onTap: () {
        setState(() {});
      },
      leading: Icon(
        Icons.quick_contacts_dialer_outlined,
        size: 30,
        color: Colors.orange,
      ),
      title: ShowTitle(
        title: 'งานบริการห้องประชุม',
        textStyle: MyConstant().h2dark(),
      ),
    );
  }

  ListTile buildCarmenu() {
    return ListTile(
      onTap: () {
        setState(() {});
      },
      leading: Icon(
        Icons.quick_contacts_dialer_outlined,
        size: 30,
        color: Colors.orange,
      ),
      title: ShowTitle(
        title: 'งานบริการยานพาหนะ',
        textStyle: MyConstant().h2dark(),
      ),
    );
  }

  ListTile buildAssetmenu() {
    return ListTile(
      onTap: () {
        setState(() {});
      },
      leading: Icon(
        Icons.quick_contacts_dialer_outlined,
        size: 36,
        color: Colors.orange,
      ),
      title: ShowTitle(
        title: 'งานบริหารทรัพย์สิน',
        textStyle: MyConstant().h2dark(),
      ),
    );
  }

  ListTile buildSuppliesmenu() {
    return ListTile(
      onTap: () {
        setState(() {});
      },
      leading: Icon(
        Icons.quick_contacts_dialer_outlined,
        size: 36,
        color: Colors.orange,
      ),
      title: ShowTitle(
        title: 'งานพัสดุ',
        textStyle: MyConstant().h2dark(),
      ),
    );
  }

  ListTile buildWhereHousemenu() {
    return ListTile(
      onTap: () {
        setState(() {});
      },
      leading: Icon(
        Icons.quick_contacts_dialer_outlined,
        size: 36,
        color: Colors.orange,
      ),
      title: ShowTitle(
        title: 'คลังวัสดุ',
        textStyle: MyConstant().h2dark(),
      ),
    );
  }
}
