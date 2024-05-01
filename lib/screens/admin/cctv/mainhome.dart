import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pkhos/models/article_model.dart';
import 'package:pkhos/screens/admin/cctv/category.dart';
import 'package:pkhos/screens/admin/cctv/cctvlist.dart';
import 'package:pkhos/screens/admin/cctv/image_slide.dart';
import 'package:pkhos/utility/my_constant.dart';
import 'package:pkhos/widgets/home_app_bar.dart';
import 'package:pkhos/widgets/search_bar.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  int currentSlider = 0;
  List<ArticleModel> articleModel = [];
  List<ArticleModel> searcharticleModel = [];
  final debouncer = Debouncer(millisecond: 500);
  bool loadStatus = true;

  @override
  void initState() {
    super.initState();
    listcctv();
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              //for custom appbar
              CustomAppBar(),
              //for searchbar
              const SizedBox(height: 15),
              MySearchBar(),
              const SizedBox(height: 15),
              ImageSlider(
                currentSlide: currentSlider,
                onChang: (value) {
                  setState(() {
                    currentSlider = value;
                  });
                },
              ),
              const SizedBox(height: 15),
              const Categories(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'กล้องวงจรปิด',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    'ดูทั้งหมด',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54),
                  ),
                  // SizedBox(width: 10,)
                ],
              ),
              // GridView.builder(
              //   physics: NeverScrollableScrollPhysics(),
              //   shrinkWrap: true,
              //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //       crossAxisCount: 2,
              //       childAspectRatio: 0.78,
              //       crossAxisSpacing: 20,
              //       mainAxisSpacing: 20),
              //   itemCount: searcharticleModel.length,
              //   itemBuilder: (context, index) {
              //     return CctvList(articleModel: searcharticleModel[index]);
              //   },
              // ),

              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: searcharticleModel.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(right: 2, left: 2, bottom: 10),
                    child: CctvList(articleModel: searcharticleModel[index]),
                  );
                },
              )

            ],
          ),
        ),
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
// class CustomAppBar extends StatelessWidget {
//   const CustomAppBar({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
        
//         IconButton(
//           style: IconButton.styleFrom(
//               backgroundColor: MyConstant.kprimaryColor,
//               padding: const EdgeInsets.all(20)),
//           onPressed: () {},
//           icon: Image.asset(
//             "images/cctv2.jpg",
//             height: 20,
//           ),
//         ),
//         IconButton(
//           style: IconButton.styleFrom(
//               backgroundColor: MyConstant.kprimaryColor,
//               padding: const EdgeInsets.all(20)),
//           onPressed: () {},
//           iconSize: 30,
//           icon: Icon(Icons.notifications_outlined),
//         ),
//       ],
//     );
//   }
// }
