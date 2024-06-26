
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
    final urlcount = '${MyConstant.countfireredall}';
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue[500],
      appBar: AppBar(
        elevation: 0,
        title: Text('Fire Extinguisher'),
        centerTitle: false,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: IconButton(
              style: IconButton.styleFrom(
                  backgroundColor: MyConstant.kprimaryColor,
                  padding: const EdgeInsets.all(15)),
              onPressed: () {},
              iconSize: 25,
              color: Colors.lightBlue,
              icon: Icon(Icons.notifications),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
                child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 70),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 243, 237, 237),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                ),
                SingleChildScrollView( 
                  child: Container(
                    // padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        
                        Container(
                          height: 300,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 30, top: 30, right: 10),
                                child: Container(
                                  height: 160,
                                  width: 340,
                                  child: Stack(
                                    children: <Widget>[
                                      Container(
                                        height: 300,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(40),
                                           color: Color.fromARGB(255, 18, 196, 181),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0xFFe8e8e8),
                                              blurRadius: 5.0,
                                              offset: Offset(0, 5),
                                            ),
                                          ],
                                        ),
                                        child: Container(
                                          margin: EdgeInsets.only(right: 10),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(40),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: Container(
                                          height: 300,
                                          width: 220,
                                          child: Image.asset(
                                            "images/FGREEN.png",
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        child: SizedBox(
                                          height: 300,
                                          // width: size.width - 200,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Spacer(), // ล่าง
                                              Padding(
                                                padding: const EdgeInsets.all(10),
                                                child: Text(
                                                  'F-Green All',
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 28, 29, 29),
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              Spacer(), // ล่าง
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal:
                                                        kDefaultFontSize * 1.0,
                                                    vertical:
                                                        kDefaultFontSize / 10),
                                                decoration: BoxDecoration(
                                                  color: Colors.orange[300],
                                                  borderRadius: BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(40),
                                                      topRight:
                                                          Radius.circular(40)),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(10.0),
                                                  child: Text(
                                                    '$fire_green_all ถัง',
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 28, 29, 29),
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, top: 30, right: 10),
                                child: Container(
                                  height: 160,
                                  width: 340,
                                  child: Stack(
                                    children: <Widget>[
                                      Container(
                                        height: 400,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(40),
                                           color: Color.fromARGB(255, 18, 196, 181),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0xFFe8e8e8),
                                              blurRadius: 5.0,
                                              offset: Offset(0, 5),
                                            ),
                                            // BoxShadow(
                                            //   color: Color(0xFFe8e8e8),
                                            //   blurRadius: 5.0,
                                            //   offset: Offset(-10, -10,),
                                            // ),
                                          ],
                                        ),
                                        child: Container(
                                          margin: EdgeInsets.only(right: 10),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(40),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: Container(
                                          height: 300,
                                          width: 220,
                                          child: Image.asset(
                                            "images/FGREEN.png",
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        child: SizedBox(
                                          height: 400,
                                          // width: size.width - 200,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Spacer(), // ล่าง
                                              Padding(
                                                padding: const EdgeInsets.all(10),
                                                child: Text(
                                                  'F-Green ใช้งานได้',
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 28, 29, 29),
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              Spacer(), // ล่าง
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal:
                                                        kDefaultFontSize * 1.0,
                                                    vertical:
                                                        kDefaultFontSize / 10),
                                                decoration: BoxDecoration(
                                               color: Color.fromARGB(255, 6, 231, 213),
                                                  borderRadius: BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(40),
                                                      topRight:
                                                          Radius.circular(40)),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(10.0),
                                                  child: Text(
                                                    '$fire_green ถัง',
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 28, 29, 29),
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, top: 30, right: 10),
                                child: Container(
                                  height: 160,
                                  width: 340,
                                  child: Stack(
                                    children: <Widget>[
                                      Container(
                                        height: 300,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(40),
                                          color: Color.fromARGB(255, 18, 196, 181),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0xFFe8e8e8),
                                              blurRadius: 5.0,
                                              offset: Offset(0, 5),
                                            ),
                                          ],
                                        ),
                                        child: Container(
                                          margin: EdgeInsets.only(right: 10),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(40),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: Container(
                                          height: 300,
                                          width: 220,
                                          child: Image.asset(
                                            "images/FGREEN.png",
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        child: SizedBox(
                                          height: 300,
                                          // width: size.width - 200,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Spacer(), // ล่าง
                                              Padding(
                                                padding: const EdgeInsets.all(10),
                                                child: Text(
                                                  'F-Green เสีย',
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 28, 29, 29),
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              Spacer(), // ล่าง
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal:
                                                        kDefaultFontSize * 1.0,
                                                    vertical:
                                                        kDefaultFontSize / 10),
                                                decoration: BoxDecoration(
                                                  color: Color.fromARGB(255, 243, 41, 15),
                                                  borderRadius: BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(40),
                                                      topRight:
                                                          Radius.circular(40)),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(10.0),
                                                  child: Text(
                                                    '$fire_green_rep ถัง',
                                                    style: TextStyle(
                                                        color: Color.fromARGB(255, 250, 250, 250),
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    
                    
                        Container(
                          height: 300,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 30, top: 30, right: 10),
                                child: Container(
                                  height: 160,
                                  width: 340,
                                  child: Stack(
                                    children: <Widget>[
                                      Container(
                                        height: 300,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(40),
                                          color: Color.fromARGB(255, 245, 60, 14),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0xFFe8e8e8),
                                              blurRadius: 5.0,
                                              offset: Offset(0, 5),
                                            ),
                                          ],
                                        ),
                                        child: Container(
                                          margin: EdgeInsets.only(right: 10),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(40),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: Container(
                                          height: 270,
                                          width: 170,
                                          child: Image.asset(
                                            "images/FRED.png",
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        child: SizedBox(
                                          height: 300,
                                          // width: size.width - 200,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Spacer(), // ล่าง
                                              Padding(
                                                padding: const EdgeInsets.all(10),
                                                child: Text(
                                                  'F-Red All',
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 28, 29, 29),
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              Spacer(), // ล่าง
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal:
                                                        kDefaultFontSize * 1.0,
                                                    vertical:
                                                        kDefaultFontSize / 10),
                                                decoration: BoxDecoration(
                                                  color: Colors.orange[300],
                                                  borderRadius: BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(40),
                                                      topRight:
                                                          Radius.circular(40)),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(10.0),
                                                  child: Text(
                                                    '$fire_red_all ถัง',
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 28, 29, 29),
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, top: 30, right: 10),
                                child: Container(
                                  height: 160,
                                  width: 340,
                                  child: Stack(
                                    children: <Widget>[
                                      Container(
                                        height: 300,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(40),
                                          color: Color.fromARGB(255, 245, 60, 14),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0xFFe8e8e8),
                                              blurRadius: 5.0,
                                              offset: Offset(0, 5),
                                            ),
                                          ],
                                        ),
                                        child: Container(
                                          margin: EdgeInsets.only(right: 10),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(40),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: Container(
                                          height: 270,
                                          width: 170,
                                          child: Image.asset(
                                            "images/FRED.png",
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        child: SizedBox(
                                          height: 300,
                                          // width: size.width - 200,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Spacer(), // ล่าง
                                              Padding(
                                                padding: const EdgeInsets.all(10),
                                                child: Text(
                                                  'F-Red ใช้งานได้',
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 28, 29, 29),
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              Spacer(), // ล่าง
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal:
                                                        kDefaultFontSize * 1.0,
                                                    vertical:
                                                        kDefaultFontSize / 10),
                                                decoration: BoxDecoration(
                                                 color: Color.fromARGB(255, 28, 224, 208),
                                                  borderRadius: BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(40),
                                                      topRight:
                                                          Radius.circular(40)),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(10.0),
                                                  child: Text(
                                                    '$fire_red ถัง',
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 28, 29, 29),
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, top: 30, right: 10),
                                child: Container(
                                  height: 160,
                                  width: 340,
                                  child: Stack(
                                    children: <Widget>[
                                      Container(
                                        height: 300,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(40),
                                        color: Color.fromARGB(255, 245, 60, 14),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0xFFe8e8e8),
                                              blurRadius: 5.0,
                                              offset: Offset(0, 5),
                                            ),
                                          ],
                                        ),
                                        child: Container(
                                          margin: EdgeInsets.only(right: 10),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(40),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: Container(
                                          height: 270,
                                          width: 170,
                                          child: Image.asset(
                                            "images/FRED.png",
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        child: SizedBox(
                                          height: 300,
                                          // width: size.width - 200,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Spacer(), // ล่าง
                                              Padding(
                                                padding: const EdgeInsets.all(10),
                                                child: Text(
                                                  'F-Red เสีย',
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 28, 29, 29),
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              Spacer(), // ล่าง
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal:
                                                        kDefaultFontSize * 1.0,
                                                    vertical:
                                                        kDefaultFontSize / 10),
                                                decoration: BoxDecoration(
                                                  color: Color.fromARGB(255, 245, 60, 14),
                                                  borderRadius: BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(40),
                                                      topRight:
                                                          Radius.circular(40)),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(10.0),
                                                  child: Text(
                                                    '$fire_red_rep ถัง',
                                                    style: TextStyle(
                                                        color: Color.fromARGB(255, 238, 243, 243),
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
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
              ],
            ))
          ],
        ),
      ),
    );
    // return SafeArea(
    //   child: Column(
    //     children: <Widget>[
    //       Expanded(
    //           child: Stack(
    //         children: <Widget>[
    //           Container(
    //             decoration: BoxDecoration(
    //               color: Colors.lightBlue,
    //               borderRadius: BorderRadius.only(
    //                 topLeft: Radius.circular(40),
    //                 topRight: Radius.circular(40),
    //               ),
    //             ),
    //           )
    //         ],
    //       ))
    //     ],
    //   ),
    // );
  }
}
