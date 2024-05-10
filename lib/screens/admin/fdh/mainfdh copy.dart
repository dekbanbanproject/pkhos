import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pkhos/screens/admin/fdh/mainauthpidsit.dart';
import 'package:pkhos/screens/admin/fdh/mainpidsit.dart';
import 'package:pkhos/screens/admin/fdh/mainpidsitreport.dart';
import 'package:pkhos/screens/admin/fdh/mainpullpidsit.dart';
import 'package:pkhos/utility/my_constant.dart';
import 'package:pkhos/utility/my_dialog.dart';

class MainFdh extends StatefulWidget {
  const MainFdh({super.key});

  @override
  State<MainFdh> createState() => _MainFdhState();
}

class _MainFdhState extends State<MainFdh> {
  int currentIndex = 2;
  List screens = const [
    MainAuthpidsit(), // 0
    MainPidsit(), // 1
    MainFdh(), // 2
    MainPullPidsit(), // 3
    MainPidsitReport(), // 4
    // Scaffold()         // 5
  ];
  double percent = 0;
  String downloading = 'InitialiZing......';
  bool _isDownloading = false;

  Future<void> Pull_authen() async {
    try {
      String path = '${MyConstant.authenspsch}';
      await Dio().get(path).then((value) async {
        String dd = value.toString();
        print('######## Vaaaaaaaaaa = $dd');
        const oneSec = const Duration(seconds: 1);
        new Timer.periodic(oneSec, (timer) {
          setState(() {
            percent += 10.0;
            if (percent.toStringAsFixed(1) == '100.0') {
              // _isDownloading = false;
              // timer.cancel();
              // return;
              // MyDialog().normalDialog(context, 'Pull Success', 'Success');
              if (_isDownloading = true) {
                _isDownloading = false;
                timer.cancel();
                MyDialog().normalDialog(context, 'Pull Success', 'Success');
                percent = 0;
              } else {
                MyDialog().normalDialog(context, 'Not Success', 'UnSuccess');
              }
            }
          });
        });
        if (value.toString() == 'true') {
          // MyDialog().normalDialog(context, 'Pull Success', 'Success');
          // Navigator.pop(context, MaincctvReq());
        } else {
          MyDialog().normalDialog(context, 'Not Success', 'UnSuccess');
        }
      });
      print('## value for API ===> ');
    } on PlatformException {}
    if (!mounted) return;
  }

  Future<void> Pull_hos() async {
    try {
      final url = '${MyConstant.pullhos}';
      // var url = Uri.parse('${MyConstant.pullhos}');
      // var res = await http.get(url);
      //  print('## value for API ===> $res');
      // var response = jsonDecode(res.body);
      //  final status = response.statusCode;
      // var response= await json.decode(json.encode(res.body));
      await Dio().get(url).then((values) async {
        String ddd = values.toString();
        // final status = response.statusCode;
        // final isValid = status != null && status >= 200 && status < 300;
        // if (!isValid) {
        //   throw DioException.badResponse(
        //     statusCode: status!,
        //     requestOptions: response.requestOptions,
        //     response: response,
        //   );
        // }

        print('######## pull = $ddd');
        const oneSec = const Duration(seconds: 1);
        new Timer.periodic(oneSec, (timer) {
          setState(() {
            percent += 10.0;
            if (percent.toStringAsFixed(1) == '100.0') {
              // _isDownloading = false;
              // timer.cancel();
              // return;
              // percent = 100.0;
              if (_isDownloading = true) {
                _isDownloading = false;
                timer.cancel();
                MyDialog().normalDialog(context, 'Pull Success', 'Success');
                percent = 0;
              } else {
                MyDialog().normalDialog(context, 'Not Success', 'UnSuccess');
              }
            }
          });
        });
        if (values.toString() == '200') {
          // if (percent >= 100) {
          //   setState(() {
          //     percent = 100;
          // MyDialog().normalDialog(context, 'Pull Success', 'Success');
          // });
          // } else {
          //   setState(() {
          //     // Pull_hos();
          //     percent += 20;
          //   });
          // }
          //  MyDialog().normalDialog(context, 'Pull Success', 'Success');
          // Navigator.pop(context, MaincctvReq());
        } else {
          MyDialog().normalDialog(context, 'Not Success', 'UnSuccess');
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
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(height: 35),
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Center(
                          child: Text(
                            'Authentication',
                            style: TextStyle(
                              fontSize: 35,
                              fontFamily: 'Kanit-Regular',
                              color: Color.fromARGB(255, 4, 197, 193),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 2, right: 10),
                          child: IconButton(
                            style: IconButton.styleFrom(
                                backgroundColor: MyConstant.kprimaryColor,
                                padding: const EdgeInsets.all(10)),
                            iconSize: 70,
                            icon: const Icon(Icons.download),
                            color: Color.fromARGB(255, 44, 149, 235),
                            tooltip: 'Pull Authen',
                            onPressed: () {
                              setState(() {
                                _isDownloading = !_isDownloading;
                              });
                              Pull_hos();
                              // final url = '${MyConstant.pullhos}';
                              // Dio dio = Dio();
                              // dio.get(url).then((value) async {
                              //   downloading = value.toString();
                              //   var percent = downloading * 100;
                              //   print('## value for API ===> $percent');
                              //   setState(() {
                              //     downloading = 'Dowonloading...${percent} %';
                              //   });
                              // });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 2),
                          child: IconButton(
                            style: IconButton.styleFrom(
                                backgroundColor: MyConstant.kprimaryColor,
                                padding: const EdgeInsets.all(10)),
                            iconSize: 70,
                            icon: const Icon(Icons.download),
                            color: Color.fromARGB(255, 201, 20, 218),
                            tooltip: 'Pull NoInvoice',
                            onPressed: () {
                              setState(() {
                                Pull_authen();
                                // fdh_minipullhosnoinv();
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
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Center(
                          child: Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                              // shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage("images/authen.png"),
                                  fit: BoxFit.cover),
                            ),
                          ),
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
                const SizedBox(height: 30),
                CircularPercentIndicator(
                  radius: 100,
                  percent: percent / 100,
                  animation: true,
                  lineWidth: 25,
                  animateFromLastPercent: true,
                  center: Text("${percent.toStringAsFixed(1)}%"),
                  progressColor: Colors.pinkAccent,
                ),
                // const SizedBox(height: 10),
                // Text(downloading ?? '',
                //     style: Theme.of(context).textTheme.headlineLarge),
                // LinearProgressIndicator(
                //   value: percent,
                // ),
                // Text('${(percent * 100).round()} %'),
              ],
            ),
          ),
        ),
      ),
      //  floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     setState(() {
      //       currentIndex = 2;
      //     });
      //   },
      //   shape: const CircleBorder(),
      //   backgroundColor: MyConstant.cctvaddColor,
      //   child: const Icon(
      //     Icons.home,
      //     color: Colors.white,
      //     size: 35,
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: BottomAppBar(
      //   elevation: 1,
      //   height: 60,
      //   color: Colors.white,
      //   shape: CircularNotchedRectangle(),
      //   notchMargin: 10,
      //   clipBehavior: Clip.antiAliasWithSaveLayer,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       IconButton(
      //         onPressed: () {
      //           setState(() {
      //             currentIndex = 0;
      //           });
      //         },
      //         icon: Icon(
      //           Icons.person,
      //           size: 30,
      //           color: currentIndex == 0
      //               ? MyConstant.cctvhomeColor
      //               : Colors.grey.shade400,
      //         ),
      //       ),
      //       IconButton(
      //         onPressed: () {
      //           setState(() {
      //             currentIndex = 1;
      //           });
      //         },
      //         icon: Icon(
      //           Icons.file_download,
      //           size: 30,
      //           color: currentIndex == 1
      //               ? MyConstant.kcctvtColor
      //               : Colors.grey.shade400,
      //         ),
      //       ),
      //       const SizedBox(
      //         width: 15,
      //       ),
      //       IconButton(
      //         onPressed: () {
      //           setState(() {
      //             currentIndex = 3;
      //           });
      //         },
      //         icon: Icon(
      //           Icons.bar_chart,
      //           size: 30,
      //           color: currentIndex == 3
      //               ? MyConstant.cctvtreportColor
      //               : Colors.grey.shade400,
      //         ),
      //       ),
      //       IconButton(
      //         onPressed: () {
      //           setState(() {
      //             currentIndex = 4;
      //           });
      //         },
      //         icon: Icon(
      //           Icons.person,
      //           size: 30,
      //           color: currentIndex == 4
      //               ? MyConstant.cctvprofileColor
      //               : Colors.grey.shade400,
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
