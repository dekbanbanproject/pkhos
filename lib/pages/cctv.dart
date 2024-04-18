// import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pkhos/models/article_model.dart';
import 'package:pkhos/utility/my_constant.dart';
import 'package:pkhos/utility/my_dialog.dart';

class CctvPage extends StatefulWidget {
  const CctvPage({Key? key}) : super(key: key);

  @override
  State<CctvPage> createState() => _CctvPageState();
}

class _CctvPageState extends State<CctvPage> {
  List<ArticleModel> articleModel = [];
  List<ArticleModel> searcharticleModel = [];
  final debouncer = Debouncer(millisecond: 500);
  bool loadStatus = true;

  @override
  void initState() {
    super.initState();
    readdatacctv();
  }

  Future<Null> readdatacctv() async {
    var apireaData = '${MyConstant.domain}/pkhos/api/article.php?isAdd=true';
    await Dio().get(apireaData).then((value) async {
      if (value.toString() == 'null') {
        MyDialog()
            .normalDialog(context, 'ไม่มีข้อมูล', 'ไม่มีข้อมูลกล้องวงจรปิด');
      } else {
        for (var item in json.decode(value.data!)) {
          ArticleModel model = ArticleModel.fromJson(item);
           String cctv_code = model.cctv_code;
          print('### ==>>>$cctv_code');
          setState(() {
            articleModel.add(model);
            searcharticleModel = articleModel;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // padding: const EdgeInsets.all(24.0),
      child: articleModel.length == 0
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  Text('CCTV Page'),
                  // Center(
                  //     child: SizedBox(
                  //   height: 150,
                  // )),
                  // CircleAvatar(
                  //   radius: 70,
                  //   child: Icon(
                  //     Icons.photo_camera_front,
                  //     size: 120,
                  //   ),
                  // ),
                  // buildSearch(),
                  buildListView(),
                ],
              ),
            ),
    );
  }

  Container buildSearch() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: TextFormField(
        onChanged: (value) {
          debouncer.run(() {
            setState(() {
              searcharticleModel = articleModel
                  .where((element) => element.cctv_code!
                      .toLowerCase()
                      .contains(value.toLowerCase()))
                  .toList();
            });
          });
        },
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          labelText: 'ค้นหากล้องวงจรปิด',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  ListView buildListView() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 6),
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: searcharticleModel.length,
      itemBuilder: (context, index) => GestureDetector(
        child: Padding(
          padding: EdgeInsets.only(left: 0, right: 0, top: 3, bottom: 3),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              // border: Border.all(
              //     width: 2.0, color: Color.fromARGB(255, 224, 191, 255)),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 2),
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: Card(
              elevation: 1,
              child: ListTile(
                leading: Text(
                  searcharticleModel[index].cctv_location,
                  // searcharticleModel[index].articleBuyId,
                  // searcharticleModel[index].cctv_code,
                  // style: MyConstant().h5dark(),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('3'
                        // searcharticleModel[index].cctv_code,
                        // style: MyConstant().h5dark(),
                        ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

// class CctvPage extends StatelessWidget {
//   const CctvPage({Key? key}) : super(key: key);
//  List<ArticleModel> articleModel = [];
//   @override
//   Widget build(BuildContext context) {

//      return Padding(
//       padding: const EdgeInsets.all(24.0),
//       child: Column(
//         children: [
//           Text('CCTV Page'),
//           Center(child: SizedBox(height: 150,)),
//           CircleAvatar(
//             radius: 70,
//             child: Icon(Icons.photo_camera_front,size: 120,),
//           ),
//           Icon(Icons.add),
//         ],
//       ),
//     );
//   }
// }
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
