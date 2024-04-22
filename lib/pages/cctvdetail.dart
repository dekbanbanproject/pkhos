import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pkhos/models/article_model.dart';
import 'package:pkhos/utility/my_constant.dart';

class CctvDetail extends StatefulWidget {
  // final ArticleModel article;
  // const CctvDetail({super.key});
  // const CctvDetail(String article_num, {Key? key, required this.article}) : super(key: key);

  final String articlenum;
  CctvDetail(this.articlenum);

  @override
  State<CctvDetail> createState() => _CctvDetailState();
}

class _CctvDetailState extends State<CctvDetail> {
  late ArticleModel article;
  // String? articlenum;
// List<ArticleModel> articleList = [];
  @override
  void initState() {
    // article = widget.article;
    super.initState();
    getArticle();
  }

  Future<Null> getArticle() async {
    // String? articlenum = article.articleNum;
    // print(articlenum);
    // String url =
    //  final url = 
     await http.get(Uri.parse(
        '${MyConstant.domain}/pkhos/api/getArticle.php?isAdd=true&article_num=${widget.articlenum}'))
             .then(
      (response) {
        if (jsonDecode(response.body) != null) {
          setState(() {
            article = ArticleModel.fromJson(jsonDecode(response.body));
             print(article);
          });
          return article;
        }
      },
    );
// var data = jsonDecode(response.body.toString());
    // await Dio().get(url).then((response) {
    //   if (response.toString() == 'true') {
    //     // print(value);
    //      print('### ==>>>$response');
    //      if (response.statusCode ==200) {
    //        for (var map in collection) {
             
    //        }
    //      } else {
           
    //      }
    //     // Navigator.pop(context);
    //     // readdatagleave();
    //   } else {
    //     Navigator.pop(context);
    //   }
    // });
    //  final response = await http.get(Uri.parse(
    // 'http://smarthos-phukieohos.moph.go.th/pkhos/api/article.php?isAdd=true'));
    // var data = jsonDecode(response.body.toString());
    //  if (response.statusCode == 200) {
    //   for (Map i in data) {
    //     // print(i['cctv_location']);
    //     article.add(ArticleModel.fromJson(data));
    //   }
    //   return article;
    // } else {
    //   return articleList;
    // }
    // var url = 'http://smarthos-phukieohos.moph.go.th/pkhos/api/article.php?article_num=${widget.articlenum}';
    // final response = await http.get(Uri.parse(
    //     'http://smarthos-phukieohos.moph.go.th/pkhos/api/article.php?isAdd=true&article_num=${widget.articlenum}'));
    // var data = jsonDecode(response.body.toString());
    // // print(data);
    // if (response.statusCode == 200) {
    //   for (Map i in data) {
    //     // print(i['cctv_location']);
    //     article.add(ArticleModel.fromJson(data));
    //     print(article);
    //   }
    //   return article;
    // } else {
    //   return article;
    // }
    //  await http.get("http://smarthos-phukieohos.moph.go.th/pkhos/api/article.php?article_num")
    // await http.get(url as Uri)
    //     .then(
      // (response) {
      //   if (jsonDecode(response.body) != null) {
      //     setState(() {
      //       article = ArticleModel.fromJson(jsonDecode(response.body));
      //       //  print(article);
      //     });
      //     // return article;
      //   }
      // },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("data,${widget.articlenum}"),
      // body: article == null
      //     ? Text(
      //         "data,${widget.articlenum}",
      //         style: TextStyle(fontSize: 20),
      //       )
      //     : Container(
      //         child: Column(
      //           children: <Widget>[
      //             Text("data,${article.articleNum}",
      //                 style: TextStyle(fontSize: 20)),
      //             Text("data,${article.articleName}",
      //                 style: TextStyle(fontSize: 20)),
      //             Text("data,${article.cctvCode}",
      //                 style: TextStyle(fontSize: 20)),
      //             Text("data,${article.cctvType}",
      //                 style: TextStyle(fontSize: 20)),
      //             Text("data,${article.cctvMonitor}",
      //                 style: TextStyle(fontSize: 20)),
      //           ],
      //         ),
      //       ),
    );
  }
}
