import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pkhos/utility/my_constant.dart';
import 'package:pkhos/utility/my_dialog.dart';

class MainAuthpidsit extends StatefulWidget {
  const MainAuthpidsit({super.key});

  @override
  State<MainAuthpidsit> createState() => _MainAuthpidsitState();
}

class _MainAuthpidsitState extends State<MainAuthpidsit> {
  Future<void> LoginMini() async {
    try {
      final url = '${MyConstant.fdh_mini_auth}';

      await Dio().get(url).then((values) async {
        String ddd = values.toString();

        print('######## pull = $ddd');
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

        print('######## pull = $ddd');
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
      final url = '${MyConstant.fdh_mini_pullhosnoinv}';

      await Dio().get(url).then((values) async {
        String ddd = values.toString();

        print('######## pull = $ddd');
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

  Future<void> fdh_mini_pidsit() async {
    try {
      final url = '${MyConstant.fdh_mini_pidsit}';

      await Dio().get(url).then((values) async {
        String ddd = values.toString();

        print('######## pull = $ddd');
        if (values.toString() == '200') {
          MyDialog().normalDialog(context, 'ปิดสิทธิ์สำเร็จ', 'Success');
        } else {
          MyDialog().normalDialog(context, 'ปิดสิทธิ์ไม่สำเร็จ', 'UnSuccess');
        }
      });
      // print('## value for API ===> $status');
    } on PlatformException {}
    if (!mounted) return;
  }

  Future<void> fdh_mini_pullbookid() async {
    try {
      final url = '${MyConstant.fdh_mini_pullbookid}';

      await Dio().get(url).then((values) async {
        String ddd = values.toString();

        print('######## pull = $ddd');
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
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Padding(
                  padding: const EdgeInsets.only(top: 35),
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
