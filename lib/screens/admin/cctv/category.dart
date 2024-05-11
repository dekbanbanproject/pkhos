import 'package:flutter/material.dart';
import 'package:pkhos/models/category.dart';
import 'package:pkhos/screens/admin/authen/authenspsch.dart';
import 'package:pkhos/screens/admin/cctv/maincctvreq.dart';
import 'package:pkhos/screens/admin/electric/mainelectric.dart';
import 'package:pkhos/screens/admin/fire/mainfirereq.dart';
import 'package:pkhos/screens/admin/phone/mainPhone.dart';
import 'package:pkhos/screens/admin/plumbing/mainplumbing.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int currentSlidebar = 0;
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("images/cctv1.png"),
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  "CCTV",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      ('/firemainpage'),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(50.0),
                    ),
                    backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("images/fire.png"),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Fire",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("images/electrice.png"),
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Electric",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("images/Plumbing.png"),
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Plumbing",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("images/tel_1.png"),
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Phone",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
      //   child: Column(
      //     children: [
      //       Row(
      //         children: [
      //           Container(
      //             width: 150,
      //             margin: EdgeInsets.only(right: 20),
      //             height: 150,
      // decoration: BoxDecoration(
      //   color: Colors.blue.shade400,
      //   borderRadius: BorderRadius.all(
      //     Radius.circular(24),
      //   ),
      // ),
      //             child: Padding(
      //               padding: const EdgeInsets.all(12.0),
      //               child: Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   Text(
      //                     'Leave System /\nmonth',
      //                     style: TextStyle(fontSize: 20, color: Colors.white),
      //                   ),
      //                   SizedBox(
      //                     height: 5,
      //                   ),
      //                   Text(
      //                     '12 itms',
      //                     style: TextStyle(fontSize: 15, color: Colors.white),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ),
      //           Container(
      //             width: 150,
      //             margin: EdgeInsets.only(right: 20),
      //             height: 150,
      //             decoration: BoxDecoration(
      //               color: Colors.blue.shade400,
      //               borderRadius: BorderRadius.all(
      //                 Radius.circular(24),
      //               ),
      //             ),
      //             child: Padding(
      //               padding: const EdgeInsets.all(12.0),
      //               child: Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   Text(
      //                     'Leave System /\nmonth',
      //                     style: TextStyle(fontSize: 20, color: Colors.white),
      //                   ),
      //                   SizedBox(
      //                     height: 5,
      //                   ),
      //                   Text(
      //                     '12 itms',
      //                     style: TextStyle(fontSize: 15, color: Colors.white),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ),
      //           Container(
      //             width: 150,
      //             margin: EdgeInsets.only(right: 20),
      //             // height: chartHeight,
      //             height: 150,
      //             decoration: BoxDecoration(
      //               color: Colors.blue.shade400,
      //               borderRadius: BorderRadius.all(
      //                 Radius.circular(24),
      //               ),
      //             ),
      //             child: Padding(
      //               padding: const EdgeInsets.all(12.0),
      //               child: Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   Text(
      //                     'Leave System /\nmonth',
      //                     style: TextStyle(fontSize: 20, color: Colors.white),
      //                   ),
      //                   SizedBox(
      //                     height: 5,
      //                   ),
      //                   Text(
      //                     '12 itms',
      //                     style: TextStyle(fontSize: 15, color: Colors.white),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ),
      //           // Container(
      //           //   height: 65,
      //           //   width: 65,
      //           //   decoration: BoxDecoration(
      //           //     shape: BoxShape.circle,
      //           //     image: DecorationImage(
      //           //         image: AssetImage("images/cctv1.png"),
      //           //         fit: BoxFit.cover),
      //           //   ),
      //           // ),
      //           // SizedBox(height: 5),
      //           // Text(
      //           //   "CCTV",
      //           //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      //           // ),
      //           //  Container(
      //           //   height: 65,
      //           //   width: 65,
      //           //   decoration: BoxDecoration(
      //           //     shape: BoxShape.circle,
      //           //     image: DecorationImage(
      //           //         image: AssetImage("images/fire.png"),
      //           //         fit: BoxFit.cover),
      //           //   ),
      //           // ),
      // SizedBox(height: 5),
      // Text(
      //   "Fire",
      //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      // ),
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
      // child: ListView.separated(
      //     scrollDirection: Axis.horizontal,
      //     itemBuilder: (context, index) {
      //       return Column(
      //         children: [
      // Container(
      //   height: 65,
      //   width: 65,
      //   decoration: BoxDecoration(
      //     shape: BoxShape.circle,
      //     image: DecorationImage(
      //         image: AssetImage(categories[index].image),
      //         fit: BoxFit.cover),
      //   ),
      // ),
      // SizedBox(height: 5),
      // Text(
      //   categories[index].title,
      //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      // ),
      //         ],
      //       );
      //     },
      //     separatorBuilder: (context, index) => const SizedBox(
      //           width: 20,
      //         ),
      //     itemCount: categories.length),
    );
  }
}
