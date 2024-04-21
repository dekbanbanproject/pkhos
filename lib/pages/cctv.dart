// import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pkhos/models/article_model.dart';
import 'package:pkhos/utility/my_constant.dart';
import 'package:pkhos/utility/my_dialog.dart';
import 'package:http/http.dart' as http;

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
  List<ArticleModel> articleList = [];
  @override
  void initState() {
    super.initState();
    // readdatacctv();
    listcctv();
  }

  // Future<Null> readdatacctv() async {
  //   var apireaData = '${MyConstant.domain}/pkhos/api/article.php?isAdd=true';
  //   await Dio().get(apireaData).then((value) async {
  //     if (value.toString() == 'null') {
  //       MyDialog()
  //           .normalDialog(context, 'ไม่มีข้อมูล', 'ไม่มีข้อมูลกล้องวงจรปิด');
  //     } else {
  //       for (var item in json.decode(value.data!)) {
  //         ArticleModel model = ArticleModel.fromJson(item);
  //         String cctv_code = model.cctvCode.toString();
  //         print('### ==>>>$cctv_code');
  //         setState(() {
  //           articleModel.add(model);
  //           searcharticleModel = articleModel;
  //         });
  //       }
  //     }
  //   });
  // }

  Future<List<ArticleModel>> getarticleApi() async {
    final response = await http.get(Uri.parse(
        'http://smarthos-phukieohos.moph.go.th/pkhos/api/article.php?isAdd=true'));
    var data = jsonDecode(response.body.toString());

    // print(data);
    if (response.statusCode == 200) {
      for (Map i in data) {
        // print(i['cctv_location']);
        articleList.add(ArticleModel.fromJson(data));
      }
      return articleList;
    } else {
      return articleList;
    }
  }

  Future<Null> listcctv() async {
    final apicctv = '${MyConstant.domain}/pkhos/api/article.php?isAdd=true';
    await Dio().get(apicctv).then((value) async {
      // print('## value for API  ==>  $value');
      for (var item in json.decode(value.data!)) {
        ArticleModel model = ArticleModel.fromJson(item);
        var cctvname = model.articleName!.toString();
        print('### ==>>>$cctvname');
        setState(() {
          articleModel.add(model);
          searcharticleModel = articleModel;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: articleModel.length == 0
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
        children: [
          // Expanded(
          //   child: FutureBuilder(
          //     future: getarticleApi(),
          //     builder: (context, AsyncSnapshot<List<ArticleModel>> snapshot) {
          //       if (snapshot.hasData) {
          //         return CircularProgressIndicator();
          //       } else {
          //         return ListView.builder(
          //             itemCount: articleList.length,
          //             itemBuilder: (context, index) {
          //               return Card(
          //                 child: Padding(
          //                   padding: const EdgeInsets.all(8.0),
          //                   child: Column(
          //                     children: [
          //                       Row(
          //                         mainAxisAlignment:
          //                             MainAxisAlignment.spaceBetween,
          //                         children: [
          //                           Text('data'),
          //                           Text(snapshot.data![index].cctvCode
          //                               .toString()),
          //                         ],
          //                       )
          //                     ],
          //                   ),
          //                 ),
          //               );
          //             });
          //       }
          //     },
          //   ),
          // ),

          // Text('CCTV Page'),
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
          buildSearch(),
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
                  .where((element) => element.cctvCode!
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
                  searcharticleModel[index].cctvCode!,
                  // searcharticleModel[index].articleBuyId,
                  // searcharticleModel[index].cctv_code,
                  style: MyConstant().h5dark(),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text( 
                       searcharticleModel[index].articleName!,
                        style: MyConstant().h5dark(),
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
