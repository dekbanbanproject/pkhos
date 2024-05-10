import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pkhos/models/fdhminidatasetmodel.dart';
import 'package:pkhos/utility/my_constant.dart';
import 'package:pkhos/utility/my_dialog.dart';

class MainAuthpidsit extends StatefulWidget {
  const MainAuthpidsit({super.key});

  @override
  State<MainAuthpidsit> createState() => _MainAuthpidsitState();
}

class _MainAuthpidsitState extends State<MainAuthpidsit> {
  String? vn;
  String? total_amont;
  // List<dynamic> vn = [];
  List<Fdhminidatasetmodel> fdhminidatasetModel = [];
  @override
  void initState() {
    super.initState();
    fdh_countvn();
    fdh_sumincome();
  }

  Future<void> fdh_sumincome() async {
    final urlincome = '${MyConstant.fdh_sumincome}';
    await Dio().get(urlincome).then((values) async {
      var sumincome_ = values.toString();
      
      if (values.toString() == '{}') {
        setState(() {
          total_amont = '0';
        });
      } else {
        setState(() {
          total_amont = sumincome_;
        }); 
      }
      //  for (var item in json.decode(value.data!)) {
      // UsersModel model = UsersModel.fromMap(item);
      print('## value for API  sumincome_==>  $sumincome_');
      // for (var item in json.decode(values.data!)) {
      // Fdhminidatasetmodel model = Fdhminidatasetmodel.fromJson(item);
      // var countvn = model.vn!.toString();
      // print('### ==>>>$countvn');
      // setState(() {
      //   fdhminidatasetModel.add(model);

      // });
      // }
      // setState(() {
      //   total_amont = sumincome_;
      // });
    });
  }

  Future<void> fdh_countvn() async {
    final urlcount = '${MyConstant.fdh_countvn}';
    await Dio().get(urlcount).then((values) async {
      var vn_ = values.toString();
      print('######## pull vn_ = $vn_');
      setState(() {
        vn = vn_;
      });
    });
  }

  Future<void> LoginMini() async {
    try {
      final url = '${MyConstant.fdh_mini_auth}';

      await Dio().get(url).then((values) async {
        String ddd = values.toString();

        print('######## pull LoginMini = $ddd');
        if (values.toString() == '200') {
          MyDialog().normalDialog(context, 'Login Success', 'Success');
        } else {
          MyDialog().normalDialog(context, 'Login Not Success', 'UnSuccess');
        }
      });
      // print('## value for API ===> $status');
    } on PlatformException {}
    if (!mounted) return;
  }

  Future<void> fdh_minipullhosinv() async {
    try {
      final url = '${MyConstant.fdh_mini_pullhosinv}';

      await Dio().get(url).then((values) async {
        String ddd = values.toString();

        print('######## pull fdh_minipullhosinv = $ddd');
        if (values.toString() == '200') {
          MyDialog().normalDialog(context, 'Pull Data Success', 'Success');
        } else {
          MyDialog()
              .normalDialog(context, 'Pull Data Not Success', 'UnSuccess');
        }
      });
      // print('## value for API ===> $status');
    } on PlatformException {}
    if (!mounted) return;
  }

  Future<void> fdh_minipullhosnoinv() async {
    try {
      final urlnoinv = '${MyConstant.fdh_minipullhosnoinv}';

      await Dio().get(urlnoinv).then((values) async {
        String noinv = values.toString();

        print('######## pullfdh_minipullhosnoinv = $noinv');
        if (values.toString() == '200') {
          MyDialog().normalDialog(context, 'Pull Data Success', 'Success');
        } else {
          MyDialog()
              .normalDialog(context, 'Pull Data Not Success', 'UnSuccess');
        }
      });
    } on PlatformException {}
    if (!mounted) return;
  }

  Future<void> fdh_mini_pidsit() async {
    try {
      final urlpidsit = '${MyConstant.fdh_mini_pidsit}';

      await Dio().get(urlpidsit).then((values) async {
        String pidsit = values.toString();

        print('######## pull pidsit = $pidsit');
        if (values.toString() == '200') {
          MyDialog().normalDialog(context, 'ปิดสิทธิ์สำเร็จ', 'Success');
        } else {
          MyDialog().normalDialog(context, 'ปิดสิทธิ์ไม่สำเร็จ', 'UnSuccess');
        }
      });
    } on PlatformException {}
    if (!mounted) return;
  }

  Future<void> fdh_mini_pullbookid() async {
    try {
      final url = '${MyConstant.fdh_mini_pullbookid}';

      await Dio().get(url).then((values) async {
        String ddd = values.toString();

        print('######## pull bookid = $ddd');
        if (values.toString() == '200') {
          MyDialog().normalDialog(context, 'Pull IdBook สำเร็จ', 'Success');
        } else {
          MyDialog()
              .normalDialog(context, 'Pull IdBook ไม่สำเร็จ', 'UnSuccess');
        }
      });
      // print('## value for API ===> $status');
    } on PlatformException {}
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Center(
                        child: Text(
                          'Mini Data Set',
                          style: TextStyle(
                            fontSize: 35,
                            fontFamily: 'Kanit-Regular',
                            color: Color.fromARGB(255, 4, 197, 193),
                          ),
                        ),
                        //   child: Container(
                        //     height: 150,
                        //     width: 200,
                        //     decoration: BoxDecoration(
                        //       // shape: BoxShape.circle,
                        //     image: DecorationImage(
                        //         image: AssetImage("images/fdhss.png"),
                        //         fit: BoxFit.cover),
                        //   ),
                        // ),
                      ),
                    ),
                    // SizedBox(height: 5),
                    // Text(
                    //   "FDH",
                    //   style:
                    //       TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    // ),
                  ],
                ),
              ),
              // const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: IconButton(
                          style: IconButton.styleFrom(
                              backgroundColor: MyConstant.kprimaryColor,
                              padding: const EdgeInsets.all(10)),
                          iconSize: 30,
                          icon: const Icon(Icons.fingerprint),
                          color: Color.fromARGB(255, 255, 128, 44),
                          tooltip: 'Login',
                          onPressed: () {
                            setState(() {
                              LoginMini();
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 2, right: 2),
                        child: IconButton(
                          style: IconButton.styleFrom(
                              backgroundColor: MyConstant.kprimaryColor,
                              padding: const EdgeInsets.all(10)),
                          iconSize: 30,
                          icon: const Icon(Icons.download),
                          color: Color.fromARGB(255, 44, 149, 235),
                          tooltip: 'Pull Invoice',
                          onPressed: () {
                            setState(() {
                              fdh_minipullhosinv();
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 2, right: 2),
                        child: IconButton(
                          style: IconButton.styleFrom(
                              backgroundColor: MyConstant.kprimaryColor,
                              padding: const EdgeInsets.all(10)),
                          iconSize: 30,
                          icon: const Icon(Icons.download),
                          color: Color.fromARGB(255, 201, 20, 218),
                          tooltip: 'Pull NoInvoice',
                          onPressed: () {
                            setState(() {
                              fdh_minipullhosnoinv();
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 2, right: 2),
                        child: IconButton(
                          style: IconButton.styleFrom(
                              backgroundColor: MyConstant.kprimaryColor,
                              padding: const EdgeInsets.all(10)),
                          iconSize: 30,
                          icon: const Icon(Icons.upload),
                          color: Color.fromARGB(255, 252, 64, 111),
                          tooltip: 'Pid Sit',
                          onPressed: () {
                            setState(() {
                              fdh_mini_pidsit();
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 2, right: 2),
                        child: IconButton(
                          style: IconButton.styleFrom(
                              backgroundColor: MyConstant.kprimaryColor,
                              padding: const EdgeInsets.all(10)),
                          iconSize: 30,
                          icon: const Icon(Icons.download),
                          color: Color.fromARGB(255, 4, 197, 193),
                          tooltip: 'Pull BookID',
                          onPressed: () {
                            setState(() {
                              fdh_mini_pullbookid();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                //   ],
                // ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, top: 30, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 140,
                      height: 160,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 4, 197, 193),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          bottomLeft: Radius.circular(50),
                        ),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            "images/person.png",
                            height: 110,
                            width: 110,
                          ),
                          Text(
                            '$vn Visit',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 140,
                      height: 160,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 123, 233),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            "images/money.png",
                            height: 110,
                            width: 110,
                          ),
                          Text(
                            '$total_amont ฿',
                            //  '$vn',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, top: 30, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 140,
                      height: 160,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 150, 190, 252),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            "images/person.png",
                            height: 120,
                            width: 120,
                          ),
                          Text(
                            'ปิดสิทธิ์',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 140,
                      height: 160,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 253, 169, 100),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          bottomLeft: Radius.circular(50),
                        ),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            "images/bookid.png",
                            height: 120,
                            width: 120,
                          ),
                          Text(
                            'BookId',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      //  appBar: AppBar(
      //   backgroundColor: Colors.blueAccent,
      //   title: Padding(
      //     padding: const EdgeInsets.only(right: 35),
      //     child: Center(
      //       child: Text(
      //         'แก้ไขถังดับเพลิงรหัส 222',
      //         // _gleaveModel.LEAVE_PERSON_FULLNAME,
      // style: TextStyle(
      //     fontSize: 17,
      //     fontFamily: 'Kanit-Regular',
      //     color: Colors.white),
      //       ),
      //     ),
      //   ),
      // ),
      // body: screens[currentIndex],
    );
  }
}
