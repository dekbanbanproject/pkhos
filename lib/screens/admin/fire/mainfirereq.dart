import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pkhos/models/article_model_check.dart';
import 'package:pkhos/models/firemodel.dart';
import 'package:pkhos/screens/admin/cctv/maincctvadd.dart';
import 'package:pkhos/screens/admin/cctv/maincctvdetail.dart';
import 'package:pkhos/screens/admin/cctv/maincctvedit.dart';
import 'package:pkhos/screens/admin/fire/mainfireadd.dart';
import 'package:pkhos/screens/admin/fire/mainfiredetail.dart';
import 'package:pkhos/screens/admin/fire/mainfireedit.dart';
import 'package:pkhos/utility/my_constant.dart';

class Mainfirereq extends StatefulWidget {
  const Mainfirereq({super.key});

  @override
  State<Mainfirereq> createState() => _MainfirereqState();
}

class _MainfirereqState extends State<Mainfirereq> {
  List<Firemodel> fireModel = [];
  List<Firemodel> searchfireModel = [];
  final debouncer = Debouncer(millisecond: 500);
  bool loadStatus = true;

  @override
  void initState() {
    super.initState();
    listFire();
  }

  Future<Null> listFire() async {
    if (fireModel.length != 0) {
      fireModel.clear();
    } else {}
    final apifire = '${MyConstant.domain}/pkhos/api/getfire.php?isAdd=true';
    await Dio().get(apifire).then((value) async {
      print('## value for API  ==>  $value');
      for (var item in json.decode(value.data!)) {
        Firemodel model = Firemodel.fromJson(item);
        var firename = model.fire_num!.toString();
        print('### ==>>>$firename');
        setState(() {
          fireModel.add(model);
          searchfireModel = fireModel;
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
                        builder: (context) => MainfireDetail(),
                      ),
                    ),
                    iconSize: 30,
                    icon: Icon(Icons.qr_code_scanner_rounded,
                        // Icons.photo_camera_front,
                        color: const Color.fromARGB(255, 255, 64, 121)),
                  ),
                  Text('บันทึกข้อมูลถังดับเพลิง', style: MyConstant().h4back()),
                  // IconButton(
                  //   style: IconButton.styleFrom(
                  //       backgroundColor: MyConstant.kprimaryColor,
                  //       padding: const EdgeInsets.all(20)),
                  //   onPressed: () {},
                  //   iconSize: 30,
                  //   icon: Icon(Icons.photo_camera_back,
                  //       color: Colors.lightBlueAccent),
                  // ),
                  IconButton(
                    style: IconButton.styleFrom(
                        backgroundColor: MyConstant.kprimaryColor,
                        padding: const EdgeInsets.all(20)),
                    // onPressed: () => Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => MainFireadd(),
                    //   ),
                    // ),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainFireadd(),
                        )).then((value) => listFire()),
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
                    searchfireModel = fireModel
                        .where((element) => element.fire_num!
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
      itemCount: searchfireModel.length,
      itemBuilder: (context, index) => Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            Container(
              child: SlidableAction(
                onPressed: ((context) {
                  MaterialPageRoute route = MaterialPageRoute(
                    builder: (context) => MainFireedit(
                      fireModeledit: searchfireModel[index],
                    ),
                  );
                  Navigator.push(context, route).then((value) => listFire());
                }),
                backgroundColor: Color.fromARGB(255, 253, 158, 49),
                icon: Icons.edit_rounded,
              ),
            ),
            Container(
              child: SlidableAction(
                // onPressed: () => deletCheck(searcharticlecheckModel[index].cctv_check_id),
                onPressed: (context) => delectCheck(searchfireModel[index]),
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
                      searchfireModel[index].fire_num!,
                      style: MyConstant().h5dark(),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          searchfireModel[index].check_date!,
                          style: MyConstant().h5dark(),
                        ),
                        Text(
                          searchfireModel[index].fire_check_injection!,
                          style: MyConstant().h5dark(),
                        ),
                        Text(
                          searchfireModel[index].fire_check_joystick!,
                          style: MyConstant().h5dark(),
                        ),
                        Text(
                          searchfireModel[index].fire_check_body!,
                          style: MyConstant().h5dark(),
                        ),
                        Text(
                          searchfireModel[index].fire_check_gauge!,
                          style: MyConstant().h5dark(),
                        ),
                        Text(
                          searchfireModel[index].fire_check_drawback!,
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

  Future<Null> delectCheck(Firemodel searchfireModel) async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text('ต้องการลบข้อมูล ${searchfireModel.fire_num} ใช่ไหม ?'),
        children: [
          // Center(
          //   child: OutlinedButton(
              // onPressed: () async {
              //   Navigator.pop(context);
              //   String path =
              //       '${MyConstant.domain}/pkhos/api/deletefire.php?isAdd=true&fire_num=${searchfireModel.fire_num}&check_date=${searchfireModel.check_date}';
              //   await Dio().get(path).then((value) => listFire());
              // },
          //     child: Text('ใช่ ต้องการลบข้อมูล'),
          //   ),
          // )
          Center( 
            child: ElevatedButton.icon( 
              label: Text(
                ' Yes',
                style: MyConstant().h2White(),
              ),
              onPressed: () async {
                Navigator.pop(context);
                String path =
                    '${MyConstant.domain}/pkhos/api/deletefire.php?isAdd=true&fire_num=${searchfireModel.fire_num}&check_date=${searchfireModel.check_date}';
                await Dio().get(path).then((value) => listFire());
              },
              // onPressed: () => comfirmDialog(),
              style: ElevatedButton.styleFrom(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0),
                  ),
                  backgroundColor: Color.fromARGB(255, 255, 80, 103)),
            ),
          )
        ],
      ),
    );
  }
}

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
