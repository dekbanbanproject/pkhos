import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:pkhos/pages/cctvdetail.dart';

// HomePage
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String _scanBarcode = 'ยังไม่มีข้อมูล';
  // late String code = '';
  // late String getcode = '';

  Future<void> scanbarcodenew() async {
    //  getcode =
    await FlutterBarcodeScanner.scanBarcode(
            '#ff6666', 'Cancel', true, ScanMode.QR)
        .then((String article_num) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CctvDetail(article_num)
          ));
    });
  }

  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen((barcode) => print(barcode));
  }

  late String barcodeScanRes = '';
  late String getbarcodeScanRes = '';

  Future<void> scanQR() async {
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Text('รายการกล้องวงจรปิด'),
          Center(
              child: SizedBox(
            height: 10,
          )),
          Text(
            'Scan result : $_scanBarcode\n',
            style: TextStyle(fontSize: 20),
          ),
          // CircleAvatar(
          //   radius: 70,
          //   child: Icon(Icons.people,size: 120,),
          // )
          MaterialButton(
            onPressed: () {
              scanbarcodenew();
            }, 
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 70,
                  child: Icon(
                    Icons.qr_code_scanner_sharp,
                    color: Colors.orange,
                    size: 90,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
    //  return
    //            Container(
    //             child: SizedBox(
    //               height: 300,
    //               width: double.infinity,
    //               child: Card(
    //                 child: Padding(
    //                   padding: const EdgeInsets.all(8.0),
    //                   child: Column(
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: [
    //                       Text(
    //                         'Scan result : $_scanBarcode\n',
    //                         style: TextStyle(fontSize: 20),
    //                       )
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //             ),

    //       );
  }
}
