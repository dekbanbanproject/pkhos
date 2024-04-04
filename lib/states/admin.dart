import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pkhos/states/advertise.dart';
import 'package:pkhos/states/login.dart';
import 'package:pkhos/utility/my_constant.dart';
import 'package:qrscan/qrscan.dart' as scanner;
// import 'package:pkhos/widgets/show_signout.dart';
// import 'package:pkhos/widgets/show_title.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  Widget currentWidget = AdvertisePage();
  IconData? iconSharp;
  var onPressedFunc = () => {};
  int _index = 0;
  late String scanresult;
  late String code = "";
  late String getcode = "";
  late String _scanBarcode = 'ยังไม่มีข้อมูล';

  @override
  void initState() {
    super.initState();
  }

  startScan() async {
    // print('OK');
    //อ่านข้อมูลจาก Barcode และ QRCODE
    String? cameraScanResult = await scanner.scan();
    setState(() {
      scanresult = cameraScanResult!;
    });
  }

  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen((barcode) => print(barcode));
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  //   @override
  // void paint(Canvas canvas, Size size) {
  //   Paint paint = Paint()
  //   // ..color = color;  // ใส่สี
  //   Offset offset = Offset(size.width / 2, size.height / 2);  // กำหนดจุดที่จะวาดวงกลม
  //   double radius =  size.width / 2; // กำหนดรัศมี
  //   canvas.drawCircle(offset, radius, paint);   // วาดวงกลมใน canvas
  // }
  // Future scanbarcode() async {
  // getcode = await FlutterBarcodeScanner.scanBarcode(lineColor, cancelButtonText, isShowFlashIcon, scanMode)
  // await FlutterBarcodeScanner.scanBarcode("#009922", "CANCEL", true,);
  // String getcode = await FlutterBarcodeScanner.scanBarcode("#009922", "CANCEL", true, );
  // FlutterBarcodeScanner.getBarcodeStreamReceiver("#ff6666", "Cancel", false, ScanMode.DEFAULT)
  //  .listen((barcode) {
  //  /// barcode to be used
  //  });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 249, 232, 240),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 145, 220, 255),
        title: Text(
          'Pk Service',
          style: MyConstant().h1dark(),
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
            onPressed: () {
              // Navigator.pushNamedAndRemoveUntil(
              //     context, MyConstant.routeLogin, (route) => false);
              MaterialPageRoute route = MaterialPageRoute(
                builder: (context) => Login(),
              );
              Navigator.pushAndRemoveUntil(context, route, (route) => false);
            },

            // onPressed: () {
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute<void>(
            //       builder: (BuildContext context) {
            //         return Scaffold(
            //           appBar: AppBar(
            //             title: const Text('Next page'),
            //           ),
            //           body: const Center(
            //             child: Text(
            //               'This is the next page',
            //               style: TextStyle(fontSize: 24),
            //             ),
            //           ),
            //         );
            //       },
            //     ),
            //   );
            // },
          ),
        ],
      ),
      body: Builder(
        builder: (BuildContext context) {
          return Container(
            // alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Text(
                          //   'ผลการสแกน',
                          //   style: TextStyle(fontSize: 25),
                          // ),
                          Text(
                            'Scan result : $_scanBarcode\n',
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // child: Flex(
            //   direction: Axis.vertical,
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //     // ElevatedButton(
            //     //     onPressed: () => scanBarcodeNormal(),
            //     //     child: Text('Start barcode scan')),
            //     // ElevatedButton(
            //     //     onPressed: () => scanQR(), child: Text('Start QR scan')),
            //     // ElevatedButton(
            //     //     onPressed: () => startBarcodeScanStream(),
            //     //     child: Text('Start barcode scan stream')),

            //     Text(
            //       'Scan result : $_scanBarcode\n',
            //       style: TextStyle(fontSize: 20),
            //     )

            //   ],
            // ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => scanQR(),
        tooltip: 'Start scan',
        child: const Icon(Icons.qr_code_scanner_sharp),
      ),
    );

    // body: Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: Container(
    //     child: SizedBox(
    //       height: 300,
    //       width: double.infinity,
    //       child: Card(
    //         child: Padding(
    //           padding: const EdgeInsets.all(8.0),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text(
    //                 'ผลการสแกน',
    //                 style: TextStyle(fontSize: 25),
    //               ),
    //               Text(
    //                 scanresult = "ยังไม่มีข้อมูล",
    //                 style: TextStyle(fontSize: 20),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // ),

    //   floatingActionButton: FloatingActionButton(
    //     onPressed: startScan,
    //     child: Icon(Icons.qr_code_scanner_sharp),
    //   ),
    //   floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    //   bottomNavigationBar: BottomAppBar(
    //     // shape: CircularNotchedRectangle(),
    //     // notchMargin: 10,
    //     child: Container(
    //       height: 50,
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Row(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               MaterialButton(
    //                 minWidth: 90,
    //                 onPressed: () {},
    //                 child: Column(
    //                   mainAxisAlignment: MainAxisAlignment.center,
    //                   children: [
    //                     Icon(
    //                       Icons.qr_code_2_sharp,
    //                       color: _index == 0 ? Colors.orange : Colors.grey,
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               MaterialButton(
    //                 minWidth: 90,
    //                 onPressed: () {},
    //                 child: Column(
    //                   mainAxisAlignment: MainAxisAlignment.center,
    //                   children: [
    //                     Icon(
    //                       Icons.qr_code,
    //                       color: _index == 1 ? Colors.orange : Colors.grey,
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               MaterialButton(
    //                 minWidth: 90,
    //                 onPressed: () {},
    //                 child: Column(
    //                   mainAxisAlignment: MainAxisAlignment.center,
    //                   children: [
    //                     Icon(
    //                       Icons.camera,
    //                       color: _index == 1 ? Colors.orange : Colors.grey,
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}

// elevation: 1,
// titleSpacing: 0,
// leading: IconButton(
//   onPressed: () {},
//   icon: const Icon(Icons.chevron_left),
// ),
// leading: Text(
//   'Pk Service',style: MyConstant().h1White(),
// ),
// title: Text(
//   'Pk Service',style: MyConstant().h1White(),
// ),
//     Text(
//       'Ver.670305',
//       style: MyConstant().h1whit17(),
//     ),
// actions: [
// IconButton(
//   onPressed: () {},
//   icon: const Icon(
//     Icons.favorite,
//     color: Colors.pink,
//     size: 24.0,
//     semanticLabel: 'Text to announce in accessibility modes',
//   ),
// ),
// IconButton(
//   onPressed: () {},
//   icon: const Icon(
//     Icons.local_activity,
//     color: Colors.black,
//     size: 24.0,
//     semanticLabel: 'Text to announce in accessibility modes',
//   ),
// ),
//   Container(
//     margin: const EdgeInsets.only(right: 15),
//     child: IconButton(
//       onPressed: () {},
//       icon: const Icon(
//         Icons.logout,
//         color: Colors.pink,
//         size: 24.0,
//         semanticLabel: 'Text',
//       ),
//     ),
//   ),
// ],

// leading: Builder(
//   builder: (context) {
//     return IconButton(
//         onPressed: () {},
//         icon: Icon(Icons.logout, color: Colors.white));
//   },
// ),
// leading: Row(
//   mainAxisAlignment: MainAxisAlignment.start,
//   children: [
//     Text(
//       'Ver.670305',
//       style: MyConstant().h1whit17(),
//     ),
//     // Icon(
//     //   Icons.logout,
//     //   color: Colors.white,
//     // ),
//     //  ShowSignOut(),
//   ],
// ),
// leading: Builder(
//   builder: (context) {
//     return IconButton(
//         onPressed: () {},
//         icon: Icon(Icons.logout, color: Colors.white));
//   },
// ),
// title: Row(
//   mainAxisAlignment: MainAxisAlignment.end,
//   children: [
//     Text(
//       'Ver.670305',
//       style: MyConstant().h1whit17(),
//     ),
//     // Icon(
//     //   Icons.logout,
//     //   color: Colors.white,
//     // ),
//     //  ShowSignOut(),
//   ],
// ),
// ),
// floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       floatingActionButton: FloatingActionButton(
//         onPressed: startScan,
//         child: Icon(Icons.qr_code_scanner_sharp),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
//       bottomNavigationBar: BottomAppBar(
//         // shape: CircularNotchedRectangle(),
//         // notchMargin: 10,
//         child: Container(
//           height: 50,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   MaterialButton(
//                     minWidth: 90,
//                     onPressed: () {},
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.qr_code_2_sharp,
//                           color: _index == 0 ? Colors.orange : Colors.grey,
//                         ),
//                         // Text(
//                         //   'Dashboard',
//                         //   style: TextStyle(
//                         //       color: _index == 0
//                         //           ? Colors.lightBlueAccent
//                         //           : Colors.grey),
//                         // )
//                       ],
//                     ),
//                   ),
//                   MaterialButton(
//                     minWidth: 90,
//                     onPressed: () {},
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.qr_code,
//                           color: _index == 1 ? Colors.orange : Colors.grey,
//                         ),
//                         // Text(
//                         //   'หนังสือราชการ',
//                         //   style: TextStyle(
//                         //       color: _index == 1
//                         //           ? Colors.lightBlueAccent
//                         //           : Colors.grey),
//                         // )
//                       ],
//                     ),
//                   ),
//                   MaterialButton(
//                     minWidth: 90,
//                     onPressed: () {},
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.camera,
//                           color: _index == 1 ? Colors.orange : Colors.grey,
//                         ),
//                         // Text(
//                         //   'หนังสือราชการ',
//                         //   style: TextStyle(
//                         //       color: _index == 1
//                         //           ? Colors.lightBlueAccent
//                         //           : Colors.grey),
//                         // )
//                         // Icon(
//                         //   Icons.assignment_ind_rounded,
//                         //   //  Icons.calendar_today,
//                         //   color: _index == 3 ? Colors.orange : Colors.grey,
//                         // ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// child: Center(
//   child: Container(
//     height: 300,
//     width: 300,
//     decoration: BoxDecoration(
//       color: Color(0xFF3be2a5),
//       // shape: BoxShape.circle,
//        borderRadius: BorderRadius.circular(30),
//     ),
// ),
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
// ),
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
// drawer: Drawer(
//   child: Stack(
//     children: [
//       ShowSignOut(),
//       Column(
//         children: [
//           UserAccountsDrawerHeader(accountName: null, accountEmail: null),
//           buildAdvertisePagemenu(),
//           buildLeavemenu(),
//           buildMeetingroommenu(),
//           buildCarmenu(),
//           buildAssetmenu(),
//           buildSuppliesmenu(),
//           buildWhereHousemenu(),
//         ],
//       ),
//     ],
//   ),
// ),
// body: currentWidget);
//   );
// }

//   ListTile buildAdvertisePagemenu() {
//     return ListTile(
//       onTap: () {
//         setState(() {
//           currentWidget = AdvertisePage();
//           Navigator.pop(context);
//         });
//       },
//       leading: Icon(
//         Icons.quick_contacts_dialer_outlined,
//         size: 30,
//         color: Colors.orange,
//       ),
//       title: ShowTitle(
//         title: 'ประชาสัมพันธ์',
//         textStyle: MyConstant().h2dark(),
//       ),
//     );
//   }

//   ListTile buildLeavemenu() {
//     return ListTile(
//       //  onPressed: () => Navigator.pushNamed(context, '/reset'),
//       onTap: () {
//         Navigator.pushNamed(context, '/gleave');
//       },
//       leading: Icon(
//         Icons.quick_contacts_dialer_outlined,
//         size: 30,
//         color: Colors.orange,
//       ),
//       title: ShowTitle(
//         title: 'ข้อมูลการลา',
//         textStyle: MyConstant().h2dark(),
//       ),
//     );
//   }

//   ListTile buildMeetingroommenu() {
//     return ListTile(
//       onTap: () {
//         setState(() {});
//       },
//       leading: Icon(
//         Icons.quick_contacts_dialer_outlined,
//         size: 30,
//         color: Colors.orange,
//       ),
//       title: ShowTitle(
//         title: 'งานบริการห้องประชุม',
//         textStyle: MyConstant().h2dark(),
//       ),
//     );
//   }

//   ListTile buildCarmenu() {
//     return ListTile(
//       onTap: () {
//         setState(() {});
//       },
//       leading: Icon(
//         Icons.quick_contacts_dialer_outlined,
//         size: 30,
//         color: Colors.orange,
//       ),
//       title: ShowTitle(
//         title: 'งานบริการยานพาหนะ',
//         textStyle: MyConstant().h2dark(),
//       ),
//     );
//   }

//   ListTile buildAssetmenu() {
//     return ListTile(
//       onTap: () {
//         setState(() {});
//       },
//       leading: Icon(
//         Icons.quick_contacts_dialer_outlined,
//         size: 36,
//         color: Colors.orange,
//       ),
//       title: ShowTitle(
//         title: 'งานบริหารทรัพย์สิน',
//         textStyle: MyConstant().h2dark(),
//       ),
//     );
//   }

//   ListTile buildSuppliesmenu() {
//     return ListTile(
//       onTap: () {
//         setState(() {});
//       },
//       leading: Icon(
//         Icons.quick_contacts_dialer_outlined,
//         size: 36,
//         color: Colors.orange,
//       ),
//       title: ShowTitle(
//         title: 'งานพัสดุ',
//         textStyle: MyConstant().h2dark(),
//       ),
//     );
//   }

//   ListTile buildWhereHousemenu() {
//     return ListTile(
//       onTap: () {
//         setState(() {});
//       },
//       leading: Icon(
//         Icons.quick_contacts_dialer_outlined,
//         size: 36,
//         color: Colors.orange,
//       ),
//       title: ShowTitle(
//         title: 'คลังวัสดุ',
//         textStyle: MyConstant().h2dark(),
//       ),
//     );
//   }
// }
