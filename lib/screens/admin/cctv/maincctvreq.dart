import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pkhos/models/article_model_check.dart';
import 'package:pkhos/screens/admin/cctv/maincctv.dart';
import 'package:pkhos/screens/admin/cctv/maincctvadd.dart';
import 'package:pkhos/screens/admin/cctv/maincctvedit.dart';
import 'package:pkhos/utility/my_constant.dart';
import 'package:pkhos/utility/my_dialog.dart';

class MaincctvReq extends StatefulWidget {
  const MaincctvReq({Key? key}) : super(key: key);

  @override
  State<MaincctvReq> createState() => _MaincctvReqState();
}

class _MaincctvReqState extends State<MaincctvReq> {
  int currentIndex = 0;

  int currentSlider = 0;
  List<ArticleCheckModel> articlecheckModel = [];
  List<ArticleCheckModel> searcharticlecheckModel = [];
  final debouncer = Debouncer(millisecond: 500);
  bool loadStatus = true;

  @override
  void initState() {
    super.initState();
    // readdatacctv();
    listcctv();
  }

  Future<Null> listcctv() async {
    if (articlecheckModel.length != 0) {
      articlecheckModel.clear();
    } else {}
    final apicctv =
        '${MyConstant.domain}/pkhos/api/getcctv_lastsave.php?isAdd=true';
    await Dio().get(apicctv).then((value) async {
      print('## value for API  ==>  $value');
      for (var item in json.decode(value.data!)) {
        ArticleCheckModel model = ArticleCheckModel.fromJson(item);
        var cctvname = model.articleNum!.toString();
        print('### ==>>>$cctvname');
        setState(() {
          articlecheckModel.add(model);
          searcharticlecheckModel = articlecheckModel;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // body: screens[currentIndex],
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    style: IconButton.styleFrom(
                        backgroundColor: MyConstant.kprimaryColor,
                        padding: const EdgeInsets.all(20)),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MaincctvReq(),
                      ),
                    ),
                    iconSize: 30,
                    icon: Icon(Icons.photo_camera_front,
                        color: Colors.lightBlueAccent),
                  ),
                  IconButton(
                    style: IconButton.styleFrom(
                        backgroundColor: MyConstant.kprimaryColor,
                        padding: const EdgeInsets.all(20)),
                    onPressed: () {},
                    iconSize: 30,
                    icon: Icon(Icons.photo_camera_back,
                        color: Colors.lightBlueAccent),
                  ),
                  IconButton(
                    style: IconButton.styleFrom(
                        backgroundColor: MyConstant.kprimaryColor,
                        padding: const EdgeInsets.all(20)),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainCctvAdd(),
                      ),
                    ),
                    iconSize: 30,
                    icon: Icon(Icons.qr_code_scanner_rounded,
                        color: Colors.lightBlueAccent),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: buildSearch(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: buildListView(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildSearch() {
    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
        color: MyConstant.searchColor,
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: Colors.grey,
            size: 30,
          ),
          SizedBox(
            width: 10,
          ),
          Flexible(
            flex: 4,
            child: TextField(
              onChanged: (value) {
                debouncer.run(() {
                  setState(() {
                    searcharticlecheckModel = articlecheckModel
                        .where((element) => element.articleNum!
                            .toLowerCase()
                            .contains(value.toLowerCase()))
                        .toList();
                  });
                });
              },
              decoration: InputDecoration(
                  hintText: "Search....", border: InputBorder.none),
            ),
          ),
        ],
      ),
    );
  }

  buildListView() {
    return ListView.builder(
      padding: EdgeInsets.only(top: 2),
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: searcharticlecheckModel.length,
      itemBuilder: (context, index) => Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            Container(
              child: SlidableAction(
                onPressed: ((context) {
                  MaterialPageRoute route = MaterialPageRoute(
                    builder: (context) => Maincctvedit(
                      articlecheckModeledit: searcharticlecheckModel[index],
                    ),
                  );
                  Navigator.push(context, route).then((value) => listcctv());
                }),
                backgroundColor: Color.fromARGB(255, 62, 210, 255),
                icon: Icons.edit_rounded,
              ),
            ),
            Container(
              child: SlidableAction(
                // onPressed: () => deletCheck(searcharticlecheckModel[index].cctv_check_id),
                onPressed: (context) =>
                    delectCheck(searcharticlecheckModel[index]),
                backgroundColor: Color.fromARGB(255, 253, 23, 23),
                icon: Icons.delete,
              ),
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 0, right: 0, top: 3, bottom: 3),
              child: Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Color.fromARGB(255, 102, 217, 252)),
                    left: BorderSide(color: Color.fromARGB(255, 102, 217, 252)),
                    right:
                        BorderSide(color: Color.fromARGB(255, 102, 217, 252)),
                    bottom:
                        BorderSide(color: Color.fromARGB(255, 102, 217, 252)),
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
                child: Center(
                  child: ListTile(
                    leading: Text(
                      searcharticlecheckModel[index].articleNum!,
                      style: MyConstant().h5dark(),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          searcharticlecheckModel[index].cctv_check_date!,
                          style: MyConstant().h5dark(),
                        ),
                        Text(
                          searcharticlecheckModel[index].cctv_camera_corner!,
                          style: MyConstant().h5dark(),
                        ),
                        Text(
                          searcharticlecheckModel[index].cctv_camera_drawback!,
                          style: MyConstant().h5dark(),
                        ),
                        Text(
                          searcharticlecheckModel[index]
                              .cctv_camera_power_backup!,
                          style: MyConstant().h5dark(),
                        ),
                        Text(
                          searcharticlecheckModel[index].cctv_camera_save!,
                          style: MyConstant().h5dark(),
                        ),
                        Text(
                          searcharticlecheckModel[index].cctv_camera_screen!,
                          style: MyConstant().h5dark(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<Null> delectCheck(ArticleCheckModel searcharticlecheckModel) async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text(
            'ต้องการลบข้อมูล ${searcharticlecheckModel.articleNum} ใช่ไหม ?'),
        children: [
          Center(
            child: OutlinedButton(
              onPressed: () async {
                Navigator.pop(context);
                String path =
                    '${MyConstant.domain}/pkhos/api/deletcctv.php?isAdd=true&article_num=${searcharticlecheckModel.articleNum}';
                await Dio().get(path).then((value) => listcctv()); 
              },
              child: Text('ใช่ ต้องการลบข้อมูล'),
            ),
          )
        ],
      ),
    );
  }
}

//     ListView buildListView() {
//     return ListView.builder(
//       padding: EdgeInsets.symmetric(horizontal: 6),
//       shrinkWrap: true,
//       physics: const ScrollPhysics(),
//       itemCount: searcharticlecheckModel.length,
//       itemBuilder: (context, index) => GestureDetector(
//         child: Padding(
//           padding: EdgeInsets.only(left: 0, right: 0, top: 3, bottom: 3),
//           child: Container(
//             height: 55,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(15.0),
//               boxShadow: const [
//                 BoxShadow(
//                   color: Colors.black26,
//                   offset: Offset(0, 2),
//                   blurRadius: 6.0,
//                 ),
//               ],
//             ),
//             child: Card(
//               elevation: 1,
//               child: ListTile(
//                 leading: Text(
//                   searcharticlecheckModel[index].articleNum!,
//                   style: MyConstant().h5dark(),
//                 ),
//                 title: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
//   Text(
//     searcharticlecheckModel[index].cctv_check_date!,
//     style: MyConstant().h5dark(),
//   ),
//   Text(
//     searcharticlecheckModel[index].cctv_camera_corner!,
//     style: MyConstant().h5dark(),
//   ),
//   Text(
//     searcharticlecheckModel[index].cctv_camera_drawback!,
//     style: MyConstant().h5dark(),
//   ),
//   Text(
//     searcharticlecheckModel[index].cctv_camera_power_backup!,
//     style: MyConstant().h5dark(),
//   ),
//   Text(
//     searcharticlecheckModel[index].cctv_camera_save!,
//     style: MyConstant().h5dark(),
//   ),
//   Text(
//     searcharticlecheckModel[index].cctv_camera_screen!,
//     style: MyConstant().h5dark(),
//   ),
// ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class Debouncer {
  final int millisecond;
  Timer? timer;
  VoidCallback? callback;

  Debouncer({required this.millisecond});

  run(VoidCallback callback) {
    if (null != timer) {
      timer!.cancel();
    }
    timer = Timer(Duration(milliseconds: millisecond), callback);
  }
}
