import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:pkhos/models/article_model.dart';
import 'package:pkhos/pages/cctvdetail.dart';
import 'package:pkhos/utility/my_constant.dart';

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
  TextEditingController articleController = TextEditingController();
  // TextEditingController passappController = TextEditingController();

  Future<void> scanbarcodenew() async {
    //  getcode =
    await FlutterBarcodeScanner.scanBarcode(
            '#ff6666', 'Cancel', true, ScanMode.QR)
        .then((String article_num) {
      // Navigator.push(context,
      // MaterialPageRoute(builder: (context) => CctvDetail(article_num)));
    });
  }

  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen((barcode) => print(barcode));
  }

  late String barcodeScanRes = '';
  late String getbarcodeScanRes = '';
  late String cctvStatus = '';

  Future<void> scanQR() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      // print(barcodeScanRes);
      print('## value for API ===> $barcodeScanRes');
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
    double size = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          MaterialButton(
            onPressed: () {
              // scanbarcodenew();
              scanQR();
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
          ),
          Center(
            child: SizedBox(
              height: 5,
            ),
          ),
          Text('รายการกล้องวงจรปิด'),
          Center(
            child: SizedBox(
              height: 5,
            ),
          ),
          articleNum(size),
          Center(
            child: SizedBox(
              height: 5,
            ),
          ),
          textNum(),
          Center(
            child: SizedBox(
              height: 5,
            ),
          ),
          normalRadio(),
          damagedRadio(),
          saveButtom(size),
        ],
      ),
    );
  }

  // dynamic saveButtom() => saveButtom();
    Row saveButtom(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 18),
          width: size * 0.6,
          child: ElevatedButton(
            style: MyConstant().mybuttonStyle(),
            onPressed: () {
               
            },
            child: Text('Save',style: MyConstant().h2White(),),
          

          ),
        ),
      ],
    );
  }

  Widget normalRadio() => Container(
        child: Row(mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(width: 250.0,
              child: Row(
                children: <Widget>[
                  Radio(
                    value: '0',
                    groupValue: cctvStatus,
                    onChanged: (value) {
                      setState(() {
                        cctvStatus = value!;
                      });
                    },
                  ),
                  Text('ปกติ'),
                ],
              ),
            ),
          ],
        ),
      );

       Widget damagedRadio() => Container(
        child: Row(mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(width: 250.0,
              child: Row(
                children: <Widget>[
                  Radio(
                    value: '1',
                    groupValue: cctvStatus,
                    onChanged: (value) {
                      setState(() {
                        cctvStatus = value!;
                      });
                    },
                  ),
                  Text('ชำรุด'),
                ],
              ),
            ),
          ],
        ),
      );

  dynamic textNum() {
    return Container(
        child: Text(
      'Scan result : $_scanBarcode\n',
      style: TextStyle(fontSize: 20),
    ));
  }

  Row articleNum(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          width: size * 0.8,
          child: TextFormField(
            initialValue: barcodeScanRes,
            // controller: articleController,
            decoration: InputDecoration(
              labelStyle: MyConstant().h2(),
              labelText: '$_scanBarcode\n',
              // prefixIcon: Icon(
              //   Icons.account_circle,
              //   color: MyConstant.info,
              // ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.primary),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.warning),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }
//   Text articleNum() {
//     return Text(
//           'Scan result : $_scanBarcode\n',
//           style: TextStyle(fontSize: 20),
//         );
//   }
}
