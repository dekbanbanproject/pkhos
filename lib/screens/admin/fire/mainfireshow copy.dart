
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pkhos/utility/my_constant.dart';

class MainFireshow extends StatefulWidget {
  const MainFireshow({super.key});

  @override
  State<MainFireshow> createState() => _MainFireshowState();
}

class _MainFireshowState extends State<MainFireshow> {
  bool statusRedEye = true;
  final formKey = GlobalKey<FormState>();
  String? fire_green,
      fire_red,
      fire_green_all,
      fire_red_all,
      fire_red_rep,
      fire_green_rep;

  @override
  void initState() {
    super.initState();
    countfiregreenall();
    countfiregreen();
    countfireredall();
    countfirered();
    countfireredrepaire();
    countfiregreenrepaire();
  }

  Future<void> countfiregreenall() async {
    final urlcount = '${MyConstant.countfiregreenall}';
    await Dio().get(urlcount).then((values) async {
      var fireid_ = values.toString();
      print('######## pull countfiregreenall = $fireid_');
      setState(() {
        fire_green_all = fireid_;
      });
    });
  }

  Future<void> countfiregreen() async {
    final urlcount = '${MyConstant.countfiregreen}';
    await Dio().get(urlcount).then((values) async {
      var fireid = values.toString();
      print('######## pull countfiregreen = $fireid');
      setState(() {
        fire_green = fireid;
      });
    });
  }

  Future<void> countfireredall() async {
    final urlcount = '${MyConstant.countfirered}';
    await Dio().get(urlcount).then((values) async {
      var fireid_all = values.toString();
      print('######## pull countfireredall = $fireid_all');
      setState(() {
        fire_red_all = fireid_all;
      });
    });
  }

  Future<void> countfireredrepaire() async {
    final urlcount = '${MyConstant.countfireredrepaire}';
    await Dio().get(urlcount).then((values) async {
      var fireid_rep = values.toString();
      print('######## pull countfireredrepaire = $fireid_rep');
      setState(() {
        fire_red_rep = fireid_rep;
      });
    });
  }

  Future<void> countfiregreenrepaire() async {
    final urlcount = '${MyConstant.countfiregreenrepaire}';
    await Dio().get(urlcount).then((values) async {
      var fireid_grep = values.toString();
      print('######## pull countfiregreenrepaire = $fireid_grep');
      setState(() {
        fire_green_rep = fireid_grep;
      });
    });
  }

  Future<void> countfirered() async {
    final urlcount = '${MyConstant.countfirered}';
    await Dio().get(urlcount).then((values) async {
      var fireid_ = values.toString();
      print('######## pull countfirered = $fireid_');
      setState(() {
        fire_red = fireid_;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Center(
                        child: Text(
                          'Fire Extinguisher',
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
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 10, bottom: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 170,
                      height: 180,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 252, 201, 201),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFe8e8e8),
                            blurRadius: 5.0,
                            offset: Offset(0, 5),
                          ),
                           BoxShadow(
                            color: Color.fromARGB(255, 255, 255, 255), 
                            offset: Offset(-5, 0),
                          ),
                          BoxShadow(
                            color: Color.fromARGB(255, 255, 255, 255), 
                            offset: Offset(5, 0),
                          ),
                        ],
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          bottomLeft: Radius.circular(50),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          children: [
                            Image.asset(
                              "images/FGREEN.png",
                              height: 110,
                              width: 110,
                            ),
                            Text(
                              'F-Green All',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '$fire_green_all',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 8, 180, 137),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 170,
                      height: 180,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 85, 236, 199),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          children: [
                            Image.asset(
                              "images/FRED.png",
                              height: 110,
                              width: 110,
                            ),
                            Text(
                              'F-Red All',
                              //  '$vn',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '$fire_red_all',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 10, bottom: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 170,
                      height: 180,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 136, 202, 255),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                          bottomLeft: Radius.circular(50),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          children: [
                            Image.asset(
                              "images/FGREEN.png",
                              height: 110,
                              width: 110,
                            ),
                            Text(
                              'F-Green ใช้ได้',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '$fire_green',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 170,
                      height: 180,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 85, 236, 199),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          topLeft: Radius.circular(50),
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          children: [
                            Image.asset(
                              "images/FRED.png",
                              height: 110,
                              width: 110,
                            ),
                            Text(
                              'F-Red ใช้ได้',
                              //  '$vn',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '$fire_red',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 10, bottom: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 170,
                      height: 180,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 182, 79),
                        borderRadius: BorderRadius.only(
                          // topRight: Radius.circular(50),
                          // bottomLeft: Radius.circular(50),
                          topLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          children: [
                            Image.asset(
                              "images/FGREEN.png",
                              height: 110,
                              width: 110,
                            ),
                            Text(
                              'F-Green ส่งซ่อม',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '$fire_green_rep',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 170,
                      height: 180,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 182, 79),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          bottomLeft: Radius.circular(50),
                          // topLeft: Radius.circular(50),
                          // bottomRight: Radius.circular(50),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          children: [
                            Image.asset(
                              "images/FRED.png",
                              height: 110,
                              width: 110,
                            ),
                            Text(
                              'F-Red ส่งซ่อม',
                              //  '$vn',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '$fire_red_rep',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
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
