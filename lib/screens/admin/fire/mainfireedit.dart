import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:pkhos/models/firemodel.dart';
import 'package:pkhos/screens/admin/fire/mainfirereq.dart';
import 'package:pkhos/utility/my_constant.dart';
import 'package:pkhos/utility/my_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainFireedit extends StatefulWidget {
    final Firemodel fireModeledit;
  const MainFireedit({Key? key, required this.fireModeledit})
      : super(key: key);

  @override
  State<MainFireedit> createState() => _MainFireeditState();
}

class _MainFireeditState extends State<MainFireedit> {
   Future<void> _refreshpage() async {
    return await Future.delayed(Duration(seconds: 2));
  }
    final formKey = GlobalKey<FormState>();
  late Firemodel _fireModeledit;
  String? fire_check_id, fire_num, fire_name, check_date, fire_check_injection, fire_check_joystick,fire_check_body,fire_check_gauge,fire_check_drawback;
 
 @override
  void initState() {
    super.initState();
    _fireModeledit = widget.fireModeledit;
    fire_check_id = _fireModeledit.fire_check_id;
    fire_num = _fireModeledit.fire_num;
    fire_name = _fireModeledit.fire_name;
    check_date = _fireModeledit.check_date;
    fire_check_injection = _fireModeledit.fire_check_injection;
    fire_check_joystick = _fireModeledit.fire_check_joystick;
    fire_check_body = _fireModeledit.fire_check_body;
    fire_check_gauge = _fireModeledit.fire_check_gauge;
    fire_check_drawback = _fireModeledit.fire_check_drawback;
    print('## drawback ## ==>>>$fire_check_drawback');
  }
 
  @override
  Widget build(BuildContext context) {
      double size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Padding(
          padding: const EdgeInsets.only(right: 30),
          child: Center(
            child: Text(
              'รายละเอียด',
              // _gleaveModel.LEAVE_PERSON_FULLNAME,
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Kanit-Regular',
                  color: Colors.white),
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
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 15, bottom: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 3, bottom: 3),
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
                            // color: Colors.black26,
                            // offset: Offset(0, 2),
                            // blurRadius: 6.0,
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
                    padding: const EdgeInsets.only(top: 3, bottom: 3),
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
                            // color: Colors.black26,
                            // offset: Offset(0, 2),
                            // blurRadius: 6.0,
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
                    padding: const EdgeInsets.only(top: 3, bottom: 3),
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
                            // color: Colors.black26,
                            // offset: Offset(0, 2),
                            // blurRadius: 6.0,
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
                    padding: const EdgeInsets.only(top: 3, bottom: 3),
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
                            // color: Colors.black26,
                            // offset: Offset(0, 2),
                            // blurRadius: 6.0,
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
                    padding: const EdgeInsets.only(top: 3, bottom: 3),
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
                            // color: Colors.black26,
                            // offset: Offset(0, 2),
                            // blurRadius: 6.0,
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
            ),
            saveButtom(size),
          ],
        ),
        //  onRefresh: onRefresh
      ),
    );
  }
   Widget injectionRadio() => Container(
        child: Row(
          children: <Widget>[
            Radio(
              value: '0',
              groupValue: fire_check_injection,
              onChanged: (value) {
                setState(() {
                  fire_check_injection = value!;
                });
              },
            ),
            Text('ปกติ'),
            Radio(
              value: '1',
              groupValue: fire_check_injection,
              onChanged: (value) {
                setState(() {
                  fire_check_injection = value!;
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
              groupValue: fire_check_joystick,
              onChanged: (value) {
                setState(() {
                  fire_check_joystick = value!;
                });
              },
            ),
            Text('ปกติ'),
            Radio(
              value: '1',
              groupValue: fire_check_joystick,
              onChanged: (value) {
                setState(() {
                  fire_check_joystick = value!;
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
              groupValue: fire_check_body,
              onChanged: (value) {
                setState(() {
                  fire_check_body = value!;
                });
              },
            ),
            Text('ปกติ'),
            Radio(
              value: '1',
              groupValue: fire_check_body,
              onChanged: (value) {
                setState(() {
                  fire_check_body = value!;
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
              groupValue: fire_check_gauge,
              onChanged: (value) {
                setState(() {
                  fire_check_gauge = value!;
                });
              },
            ),
            Text('ปกติ'),
            Radio(
              value: '1',
              groupValue: fire_check_gauge,
              onChanged: (value) {
                setState(() {
                  fire_check_gauge = value!;
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
              groupValue: fire_check_drawback,
              onChanged: (value) {
                setState(() {
                  fire_check_drawback = value!;
                });
              },
            ),
            Text('ปกติ'),
            Radio(
              value: '1',
              groupValue: fire_check_drawback,
              onChanged: (value) {
                setState(() {
                  fire_check_drawback = value!;
                });
              },
            ),
            Text('ชำรุด'),
          ],
        ),
      );


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
                'Update',
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
        title: Text('ต้องการแก้ไขข้อมูลใช่ไหม ?'),
        children: [
          Center( 
            child: ElevatedButton.icon( 
              label: Text(
                ' Yes',
                style: MyConstant().h2save(),
              ),
              onPressed: () {
                Navigator.pop(context);
                updateActive();
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
 
    Future<Null> updateActive() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    String id = preferences.getString('id')!;
    // String article_num2 = article_numController.text;
    print('######## userid = $id');
    // print('######## Active = $fireStatus');
  
    String path =
        '${MyConstant.domain}/pkhos/api/getfireupdate.php?isAdd=true&fire_num=$fire_num&fire_check_id=$fire_check_id&user_id=$id&fire_check_injection=$fire_check_injection&fire_check_joystick=$fire_check_joystick&fire_check_body=$fire_check_body&fire_check_gauge=$fire_check_gauge&fire_check_drawback=$fire_check_drawback';
    await Dio().get(path).then((value) async {
      String dd = value.toString();
      print('######## Vaaaaaaaaaa = $dd');
      if (value.toString() == 'false') { 
        MyDialog().normalDialog(context, 'กรุณาลองใหม่', 'ไม่สำเร็จ');
      } else {
       Navigator.pop(context,Mainfirereq());
      }
    });
  }
}