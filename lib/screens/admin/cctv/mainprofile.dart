import 'package:flutter/material.dart';
import 'package:pkhos/utility/my_constant.dart';

class MainProfile extends StatefulWidget {
  const MainProfile({super.key});

  @override
  State<MainProfile> createState() => _MainProfileState();
}

class _MainProfileState extends State<MainProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // leading: Padding(
        //   padding: const EdgeInsets.only(left: 20,top: 5,bottom: 5),
        //   child: IconButton(
        //     style: IconButton.styleFrom(
        //         backgroundColor: MyConstant.kprimaryColor,
        //         padding: const EdgeInsets.all(5)),
        //     onPressed: () {
        //       setState(() {
        //         // Pull_authen();
        //       });
        //     },
        //     iconSize: 30,
        //     icon: Icon(Icons.arrow_back_ios),
        //     color: Color.fromARGB(255, 4, 197, 193),
        //   ),
        // ),
        title: Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Center(
            child: Text(
              'Profile',
              // _gleaveModel.LEAVE_PERSON_FULLNAME,
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Kanit-Regular',
                color: Color.fromARGB(255, 4, 197, 193),
              ),
            ),
          ),
        ),
        // actions: <Widget>[
        //   Padding(
        //     padding: EdgeInsets.only(right: 20.0),
        //     child: IconButton(
        //       style: IconButton.styleFrom(
        //           backgroundColor: MyConstant.kprimaryColor,
        //           padding: const EdgeInsets.all(5)),
        //       onPressed: () {
        //         setState(() {
        //           // Pull_authen();
        //         });
        //       },
        //       iconSize: 30,
        //       icon: Icon(Icons.upload),
        //       color: Color.fromARGB(255, 4, 197, 193),
        //     ),
        //   ),
        // ],
      ),
      body: ListView(
        children: [
          Center(
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: CircleAvatar(
                            radius: 90,
                            child:  Image.asset(
                    "images/technician_1.png",
                      // "images/techserevice.png",
                    fit: BoxFit.cover,
                                    ),
                          ),
                  ),
                 
                  // Image.asset(
                  // "images/technician_1.png",
                  //   // "images/techserevice.png",
                  // fit: BoxFit.cover,
                // ),
                  // SizedBox(height: 5),
                  Text(
                    "Edit Profile",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 5),
                    child: buildListView(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // body: SingleChildScrollView(
      //   child: Padding(
      //     padding: EdgeInsets.all(15),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         const SizedBox(height: 15),
      //         Padding(
      //           padding: const EdgeInsets.only(top: 10),
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               IconButton(
      //                 style: IconButton.styleFrom(
      //                     backgroundColor: MyConstant.kprimaryColor,
      //                     padding: const EdgeInsets.all(20)),
      //                 onPressed: () {}, iconSize: 30, color: Colors.lightBlue,
      //                 icon: Icon(Icons.dashboard),
      //                 // icon: Image.asset(
      //                 //   "images/cctv2.jpg",
      //                 //   height: 20,
      //                 // ),
      //               ),
      //               Row(
      //                 children: [
      // IconButton(
      //   style: IconButton.styleFrom(
      //       backgroundColor: MyConstant.kprimaryColor,
      //       padding: const EdgeInsets.all(20)),
      //   onPressed: () {
      //     setState(() {
      //       // Pull_authen();
      //     });
      //   },
      //   iconSize: 30,
      //   icon: Icon(Icons.upload),
      //   color: Color.fromARGB(255, 4, 197, 193),
      // ),

      //                 ],
      //               ),
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }

  buildListView() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 0, right: 0, top: 3, bottom: 3),
          child: Container(
            height: 55,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Color.fromARGB(255, 102, 217, 252)),
                left: BorderSide(color: Color.fromARGB(255, 102, 217, 252)),
                right: BorderSide(color: Color.fromARGB(255, 102, 217, 252)),
                bottom: BorderSide(color: Color.fromARGB(255, 102, 217, 252)),
              ),
              // color: Color(0xFFBFBFBF),
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: MyConstant.shadowColor.withOpacity(0.05),
                  spreadRadius: 1.5,
                  blurRadius: 1.5,
                  offset: Offset(0, 1),
                  // color: Colors.black26,
                  // offset: Offset(0, 2),
                  // blurRadius: 6.0,
                ),
              ],
            ),
            // child: Center(
            //   child: ListTile(
            //     leading: Text(
            //       searcharticlecheckModel[index].articleNum!,
            //       style: MyConstant().h5dark(),
            //     ),
            //     title: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Text(
            //           searcharticlecheckModel[index].cctv_check_date!,
            //           style: MyConstant().h5dark(),
            //         ),
            //         Text(
            //           searcharticlecheckModel[index].cctv_camera_screen!,
            //           style: MyConstant().h5dark(),
            //         ),
            //         Text(
            //           searcharticlecheckModel[index].cctv_camera_corner!,
            //           style: MyConstant().h5dark(),
            //         ),
            //         Text(
            //           searcharticlecheckModel[index].cctv_camera_drawback!,
            //           style: MyConstant().h5dark(),
            //         ),
            //         Text(
            //           searcharticlecheckModel[index].cctv_camera_save!,
            //           style: MyConstant().h5dark(),
            //         ),
            //         Text(
            //           searcharticlecheckModel[index]
            //               .cctv_camera_power_backup!,
            //           style: MyConstant().h5dark(),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 3),
          child: Container(
            height: 55,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Color.fromARGB(255, 102, 217, 252)),
                left: BorderSide(color: Color.fromARGB(255, 102, 217, 252)),
                right: BorderSide(color: Color.fromARGB(255, 102, 217, 252)),
                bottom: BorderSide(color: Color.fromARGB(255, 102, 217, 252)),
              ),
              // color: Color(0xFFBFBFBF),
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: MyConstant.shadowColor.withOpacity(0.05),
                  spreadRadius: 1.5,
                  blurRadius: 1.5,
                  offset: Offset(0, 1),
                  // color: Colors.black26,
                  // offset: Offset(0, 2),
                  // blurRadius: 6.0,
                ),
              ],
            ),
            
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 3),
          child: Container(
            height: 55,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Color.fromARGB(255, 102, 217, 252)),
                left: BorderSide(color: Color.fromARGB(255, 102, 217, 252)),
                right: BorderSide(color: Color.fromARGB(255, 102, 217, 252)),
                bottom: BorderSide(color: Color.fromARGB(255, 102, 217, 252)),
              ),
              // color: Color(0xFFBFBFBF),
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: MyConstant.shadowColor.withOpacity(0.05),
                  spreadRadius: 1.5,
                  blurRadius: 1.5,
                  offset: Offset(0, 1),
                  // color: Colors.black26,
                  // offset: Offset(0, 2),
                  // blurRadius: 6.0,
                ),
              ],
            ),
            
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 3),
          child: Container(
            height: 55,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Color.fromARGB(255, 102, 217, 252)),
                left: BorderSide(color: Color.fromARGB(255, 102, 217, 252)),
                right: BorderSide(color: Color.fromARGB(255, 102, 217, 252)),
                bottom: BorderSide(color: Color.fromARGB(255, 102, 217, 252)),
              ),
              // color: Color(0xFFBFBFBF),
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: MyConstant.shadowColor.withOpacity(0.05),
                  spreadRadius: 1.5,
                  blurRadius: 1.5,
                  offset: Offset(0, 1),
                  // color: Colors.black26,
                  // offset: Offset(0, 2),
                  // blurRadius: 6.0,
                ),
              ],
            ),
            
          ),
        ),
      ],
    );
  }
}
