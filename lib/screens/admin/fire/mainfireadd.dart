import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:pkhos/models/firemodel.dart';
import 'package:pkhos/screens/admin/cctv/maincctvreq.dart';
import 'package:pkhos/utility/my_constant.dart';
import 'package:pkhos/utility/my_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainFireadd extends StatefulWidget {
  const MainFireadd({super.key});

  @override
  State<MainFireadd> createState() => _MainFireaddState();
}

class _MainFireaddState extends State<MainFireadd> {
  late String _scanBarcode = 'ยังไม่มีข้อมูล';
  int index = 0;
  final formKey = GlobalKey<FormState>();
  // TextEditingController fire_numController = TextEditingController();
  // TextEditingController check_dateController = TextEditingController();
  // TextEditingController camera_screenController = TextEditingController();

  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen((barcode) => print(barcode));
  }

  late String barcodeScanRes = '';
  late String getbarcodeScanRes = '';
  late String fireStatus = '';
  late String fire_num = '';
  late String injectionStatus = '';
  late String joystickStatus = '';
  late String bodyStatus = '';
  late String gaugeStatus = '';
  late String drawbackStatus = '';
  List<Firemodel> fireModel = [];

  @override
  void initState() {
    super.initState();
    scanQR();
  }

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

  Future<void> _refreshpage() async {
    return await Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 222, 248, 244),
        title: Padding(
          padding: const EdgeInsets.only(right: 30),
          child: Center(
            child: Text(
              'บันทึกข้อมูลถังดับเพลิง',
              // _gleaveModel.LEAVE_PERSON_FULLNAME,
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Kanit-Regular',
                  color: Color.fromARGB(255, 8, 190, 166)),
            ),
          ),
        ),
      ),
      body: LiquidPullToRefresh(
        onRefresh: _refreshpage,
        color: Colors.deepPurple, height: 300,
        backgroundColor: Colors.deepPurple[200],
        animSpeedFactor: 2,
        showChildOpacityTransition: true,
        child: ListView(
          // child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: MaterialButton(
                    onPressed: () {
                      // scanbarcodenew();
                      scanQR();
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          child: Icon(
                            Icons.qr_code_scanner_sharp,
                            color: Colors.orange,
                            size: 50,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: SizedBox(
                    height: 3,
                  ),
                ),
                Text('SCAN QRCODE FIRE EXTINGUISHER'),
                Center(
                  child: SizedBox(
                    height: 3,
                  ),
                ),
                // textNum(),
                Text(
                  'รหัสถังดับเพลิง :$_scanBarcode',
                  style: TextStyle(fontSize: 18),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                    bottom: 3,
                    left: 10,
                    right: 10,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                            color: Color.fromARGB(255, 102, 217, 252)),
                        left: BorderSide(
                            color: Color.fromARGB(255, 102, 217, 252)),
                        right: BorderSide(
                            color: Color.fromARGB(255, 102, 217, 252)),
                        bottom: BorderSide(
                            color: Color.fromARGB(255, 102, 217, 252)),
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(221, 255, 255, 255)
                              .withOpacity(0.05),
                          spreadRadius: 1.5,
                          blurRadius: 1.5,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Card(
                      color: Colors.white,
                      child: ListTile(
                        leading: Text(
                          'สายฉีด',
                          style: TextStyle(fontSize: 17),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            injectionRadio(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 3, bottom: 3, left: 10, right: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                            color: Color.fromARGB(255, 102, 217, 252)),
                        left: BorderSide(
                            color: Color.fromARGB(255, 102, 217, 252)),
                        right: BorderSide(
                            color: Color.fromARGB(255, 102, 217, 252)),
                        bottom: BorderSide(
                            color: Color.fromARGB(255, 102, 217, 252)),
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(221, 255, 255, 255)
                              .withOpacity(0.05),
                          spreadRadius: 1.5,
                          blurRadius: 1.5,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Card(
                      color: Colors.white,
                      child: ListTile(
                        leading: Text(
                          'คันบังคับ',
                          style: TextStyle(fontSize: 17),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            joystickRadio(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 3, bottom: 3, left: 10, right: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                            color: Color.fromARGB(255, 102, 217, 252)),
                        left: BorderSide(
                            color: Color.fromARGB(255, 102, 217, 252)),
                        right: BorderSide(
                            color: Color.fromARGB(255, 102, 217, 252)),
                        bottom: BorderSide(
                            color: Color.fromARGB(255, 102, 217, 252)),
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(221, 255, 255, 255)
                              .withOpacity(0.05),
                          spreadRadius: 1.5,
                          blurRadius: 1.5,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Card(
                      color: Colors.white,
                      child: ListTile(
                        leading: Text(
                          'ตัวถัง',
                          style: TextStyle(fontSize: 17),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            bodyRadio(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 3, bottom: 3, left: 10, right: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                            color: Color.fromARGB(255, 102, 217, 252)),
                        left: BorderSide(
                            color: Color.fromARGB(255, 102, 217, 252)),
                        right: BorderSide(
                            color: Color.fromARGB(255, 102, 217, 252)),
                        bottom: BorderSide(
                            color: Color.fromARGB(255, 102, 217, 252)),
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(221, 255, 255, 255)
                              .withOpacity(0.05),
                          spreadRadius: 1.5,
                          blurRadius: 1.5,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Card(
                      color: Colors.white,
                      child: ListTile(
                        leading: Text(
                          'เกจความดัน',
                          style: TextStyle(fontSize: 17),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            gaugeRadio(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 3, bottom: 3, left: 10, right: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                            color: Color.fromARGB(255, 102, 217, 252)),
                        left: BorderSide(
                            color: Color.fromARGB(255, 102, 217, 252)),
                        right: BorderSide(
                            color: Color.fromARGB(255, 102, 217, 252)),
                        bottom: BorderSide(
                            color: Color.fromARGB(255, 102, 217, 252)),
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(221, 255, 255, 255)
                              .withOpacity(0.05),
                          spreadRadius: 1.5,
                          blurRadius: 1.5,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Card(
                      color: Colors.white,
                      child: ListTile(
                        leading: Text(
                          'สิ่งกีดขวาง',
                          style: TextStyle(fontSize: 17),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            drawbackRadio(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            saveButtom(size),
          ],
        ),
        //  onRefresh: onRefresh
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
          child: Padding(
            padding: const EdgeInsets.only(top: 3),
            child: ElevatedButton.icon(
              icon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(
                  Icons.save,
                  color: Color.fromARGB(255, 8, 190, 166),
                  size: 30.0,
                ),
              ),
              label: Text(
                'Save',
                style: MyConstant().h2save(),
              ),
              onPressed: () => comfirmDialog(),
              style: ElevatedButton.styleFrom(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(50.0),
                  ),
                  backgroundColor: Color.fromARGB(255, 222, 248, 244)),
            ),
          ),
        ),
      ],
    );
  }

  Future<Null> comfirmDialog() async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text('บันทึกข้อมูลใช่ไหม ?'),
        children: [
          Center( 
            child: ElevatedButton.icon( 
              label: Text(
                ' Yes',
                style: MyConstant().h2save(),
              ),
              onPressed: () {
                Navigator.pop(context);
                saveActive();
              },
              // onPressed: () => comfirmDialog(),
              style: ElevatedButton.styleFrom(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0),
                  ),
                  backgroundColor: Color.fromARGB(255, 222, 248, 244)),
            ),
          )
        ],
      ),
    );
  }

  Future<Null> saveActive() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    String id = preferences.getString('id')!;
    // String article_num2 = article_numController.text;
    print('######## userid = $id');
    print('######## Active = $fireStatus');
  
    String path =
        '${MyConstant.domain}/pkhos/api/getfireinsert.php?isAdd=true&fire_num=$_scanBarcode&user_id=$id&fire_check_injection=$injectionStatus&fire_check_joystick=$joystickStatus&fire_check_body=$bodyStatus&fire_check_gauge=$gaugeStatus&fire_check_drawback=$drawbackStatus';
    await Dio().get(path).then((value) async {
      String dd = value.toString();
      print('######## Vaaaaaaaaaa = $dd');
      if (value.toString() == 'false') { 
        MyDialog().normalDialog(context, 'บันทึกไปแล้ว', 'ข้อมูลซ้ำ');
      } else {
       Navigator.pop(context,MaincctvReq());
      }
    });
  }

  Widget injectionRadio() => Container(
        child: Row(
          children: <Widget>[
            Radio(
              value: '0',
              groupValue: injectionStatus,
              onChanged: (value) {
                setState(() {
                  injectionStatus = value!;
                });
              },
            ),
            Text('ปกติ'),
            Radio(
              value: '1',
              groupValue: injectionStatus,
              onChanged: (value) {
                setState(() {
                  injectionStatus = value!;
                });
              },
            ),
            Text('ชำรุด'),
          ],
        ),
      );

  Widget joystickRadio() => Container(
        child: Row(
          children: <Widget>[
            Radio(
              value: '0',
              groupValue: joystickStatus,
              onChanged: (value) {
                setState(() {
                  joystickStatus = value!;
                });
              },
            ),
            Text('ปกติ'),
            Radio(
              value: '1',
              groupValue: joystickStatus,
              onChanged: (value) {
                setState(() {
                  joystickStatus = value!;
                });
              },
            ),
            Text('ชำรุด'),
          ],
        ),
      );

  Widget bodyRadio() => Container(
        child: Row(
          children: <Widget>[
            Radio(
              value: '0',
              groupValue: bodyStatus,
              onChanged: (value) {
                setState(() {
                  bodyStatus = value!;
                });
              },
            ),
            Text('ปกติ'),
            Radio(
              value: '1',
              groupValue: bodyStatus,
              onChanged: (value) {
                setState(() {
                  bodyStatus = value!;
                });
              },
            ),
            Text('ชำรุด'),
          ],
        ),
  );

  Widget gaugeRadio() => Container(
        child: Row(
          children: <Widget>[
            Radio(
              value: '0',
              groupValue: gaugeStatus,
              onChanged: (value) {
                setState(() {
                  gaugeStatus = value!;
                });
              },
            ),
            Text('ปกติ'),
            Radio(
              value: '1',
              groupValue: gaugeStatus,
              onChanged: (value) {
                setState(() {
                  gaugeStatus = value!;
                });
              },
            ),
            Text('ชำรุด'),
          ],
        ),
  );

  Widget drawbackRadio() => Container(
        child: Row(
          children: <Widget>[
            Radio(
              value: '0',
              groupValue: drawbackStatus,
              onChanged: (value) {
                setState(() {
                  drawbackStatus = value!;
                });
              },
            ),
            Text('ปกติ'),
            Radio(
              value: '1',
              groupValue: drawbackStatus,
              onChanged: (value) {
                setState(() {
                  drawbackStatus = value!;
                });
              },
            ),
            Text('ชำรุด'),
          ],
        ),
      );
}
