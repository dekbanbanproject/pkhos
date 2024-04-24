import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pkhos/models/article_model.dart';
import 'package:http/http.dart' as http;

class Detail extends StatefulWidget {
  // const Detail({super.key});
  final String code;
  Detail(this.code);
  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  late ArticleModel article;

  // Future<ArticleModel> getArticle() async {
  //   await http
  //       .get(
  //           "http://smarthos-phukieohos.moph.go.th/pkhos/api/getArticle.php?isAdd=true&article_num=${widget.code}")
  //       .then(
  //     (response) {
  //       if (jsonDecode(response.body) != null) {}
  //     },
  //   );
  // }

  @override
  void initState() {
    // getArticle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
