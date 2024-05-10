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
  double percent = 20;

  Future<void> Pull_authen() async {
    try {
      String path = '${MyConstant.authenspsch}';
      await Dio().get(path).then((value) async {
        String dd = value.toString();
        print('######## Vaaaaaaaaaa = $dd');
        if (value.toString() == 'true') {
          MyDialog().normalDialog(context, 'Pull Success', 'Success');
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
          if (values.toString() == '200') {
             if (percent >= 100) {
                  setState(() { 
                    percent = 100;
                         MyDialog().normalDialog(context, 'Pull Success', 'Success'); 
                  });
                } else {
                  setState(() {
                    // Pull_hos();
                    percent += 20;
                  });
                }
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

                      // IconButton(
                      //   style: IconButton.styleFrom(
                      //       backgroundColor: MyConstant.kprimaryColor,
                      //       padding: const EdgeInsets.all(20)),
                      //   onPressed: () {}, iconSize: 30, color: Colors.lightBlue,
                      //   icon: Icon(Icons.dashboard),

                      // ),
                      // Row(
                      //   children: [
                      //     Padding(
                      //       padding: const EdgeInsets.only(left: 5, right: 5),
                      //       child: IconButton(
                      //         style: IconButton.styleFrom(
                      //             backgroundColor: MyConstant.kprimaryColor,
                      //             padding: const EdgeInsets.all(20)),
                      //         iconSize: 30,
                      //         icon: const Icon(Icons.download),
                      //         color: Colors.red,
                      //         tooltip: 'Pull Hos',
                      //         onPressed: () {
                      //           setState(() {
                      //             Pull_hos();
                      //           });
                      //         },
                      //       ),
                      //     ),
                      //     IconButton(
                      //       style: IconButton.styleFrom(
                      //           backgroundColor: MyConstant.kprimaryColor,
                      //           padding: const EdgeInsets.all(20)),
                      //       onPressed: () {
                      //         setState(() {
                      //           Pull_authen();
                      //         });
                      //       },
                      //       iconSize: 30,
                      //       icon: Icon(Icons.download),
                      //       color: Color.fromARGB(255, 4, 197, 193),
                      //     ),
                      //   ],
                      // ),
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
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 5, right: 5),
                        //   child: IconButton(
                        //     style: IconButton.styleFrom(
                        //         backgroundColor: MyConstant.kprimaryColor,
                        //         padding: const EdgeInsets.all(10)),
                        //     iconSize: 30,
                        //     icon: const Icon(Icons.fingerprint),
                        //     color: Color.fromARGB(255, 255, 128, 44),
                        //     tooltip: 'Login',
                        //     onPressed: () {
                        //       setState(() {
                        //         // LoginMini();
                        //       });
                        //     },
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(left: 2, right: 2),
                          child: IconButton(
                            style: IconButton.styleFrom(
                                backgroundColor: MyConstant.kprimaryColor,
                                padding: const EdgeInsets.all(10)),
                            iconSize: 30,
                            icon: const Icon(Icons.download),
                            color: Color.fromARGB(255, 44, 149, 235),
                            tooltip: 'Pull Authen',
                            onPressed: () {
                              if (percent >= 100) {
                                setState(() {
                                Pull_hos();
                                    percent = 10;
                                  });
                              } else {
                                setState(() {
                                  // Pull_hos();
                                  percent += 10;
                                });
                              }
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
                                Pull_authen();
                                // fdh_minipullhosnoinv();
                              });
                            },
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 2, right: 2),
                        //   child: IconButton(
                        //     style: IconButton.styleFrom(
                        //         backgroundColor: MyConstant.kprimaryColor,
                        //         padding: const EdgeInsets.all(10)),
                        //     iconSize: 30,
                        //     icon: const Icon(Icons.upload),
                        //     color: Color.fromARGB(255, 252, 64, 111),
                        //     tooltip: 'Pid Sit',
                        //     onPressed: () {
                        //       setState(() {
                        //         // fdh_mini_pidsit();
                        //       });
                        //     },
                        //   ),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 2, right: 2),
                        //   child: IconButton(
                        //     style: IconButton.styleFrom(
                        //         backgroundColor: MyConstant.kprimaryColor,
                        //         padding: const EdgeInsets.all(10)),
                        //     iconSize: 30,
                        //     icon: const Icon(Icons.download),
                        //     color: Color.fromARGB(255, 4, 197, 193),
                        //     tooltip: 'Pull BookID',
                        //     onPressed: () {
                        //       setState(() {
                        //         // fdh_mini_pullbookid();
                        //       });
                        //     },
                        //   ),
                        // ),
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
                  lineWidth: 15,
                  animateFromLastPercent: true,
                  center: Text("${percent.toStringAsFixed(0)}%"),
                  progressColor: Colors.pinkAccent,
                ),
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
