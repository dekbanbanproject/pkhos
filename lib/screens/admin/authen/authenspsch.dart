import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pkhos/utility/my_constant.dart';
import 'package:pkhos/utility/my_dialog.dart';
import 'package:http/http.dart' as http;

class Authenspsch extends StatefulWidget {
  const Authenspsch({super.key});

  @override
  State<Authenspsch> createState() => _AuthenspschState();
}

class _AuthenspschState extends State<Authenspsch> {
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
          MyDialog().normalDialog(context, 'Pull Success', 'Success');
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      style: IconButton.styleFrom(
                          backgroundColor: MyConstant.kprimaryColor,
                          padding: const EdgeInsets.all(20)),
                      onPressed: () {}, iconSize: 30, color: Colors.lightBlue,
                      icon: Icon(Icons.dashboard),
                      // icon: Image.asset(
                      //   "images/cctv2.jpg",
                      //   height: 20,
                      // ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: IconButton(
                            style: IconButton.styleFrom(
                                backgroundColor: MyConstant.kprimaryColor,
                                padding: const EdgeInsets.all(20)),
                            iconSize: 30,
                            icon: const Icon(Icons.download),
                            color: Colors.red,
                            tooltip: 'Pull Hos',
                            onPressed: () {
                              setState(() {
                                Pull_hos();
                              });
                            },
                          ),
                        ),
                        IconButton(
                          style: IconButton.styleFrom(
                              backgroundColor: MyConstant.kprimaryColor,
                              padding: const EdgeInsets.all(20)),
                          onPressed: () {
                            setState(() {
                              Pull_authen();
                            });
                          },
                          iconSize: 30,
                          icon: Icon(Icons.download),
                          color: Color.fromARGB(255, 4, 197, 193),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 10),
                        //   child: IconButton(
                        //     style: IconButton.styleFrom(
                        //         backgroundColor: MyConstant.kprimaryColor,
                        //         padding: const EdgeInsets.all(20)),
                        //     iconSize: 30,
                        //     icon: const Icon(Icons.logout), color: Colors.red,
                        //     tooltip: 'Logout', onPressed: () {},
                        //     // onPressed: () => signoutProcess(context),
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
