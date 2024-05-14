import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pkhos/models/article_model.dart';
import 'package:pkhos/screens/admin/authen/authenspsch.dart';
import 'package:pkhos/screens/admin/cctv/category.dart';
import 'package:pkhos/screens/admin/cctv/maincctvreq.dart';
import 'package:pkhos/screens/admin/electric/mainelectric.dart';
import 'package:pkhos/screens/admin/fdh/fdhcategory.dart';
import 'package:pkhos/screens/admin/fire/mainfirereq.dart';
import 'package:pkhos/screens/admin/phone/mainPhone.dart';
import 'package:pkhos/screens/admin/plumbing/mainplumbing.dart';
import 'package:pkhos/utility/my_constant.dart';
import 'package:pkhos/widgets/home_app_bar.dart';
import 'package:pkhos/widgets/search_bar.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  List<ArticleModel> articleModel = [];
  List<ArticleModel> searcharticleModel = [];
  final debouncer = Debouncer(millisecond: 500);
  bool loadStatus = true;
  int currentSlider = 0;
  int selectIndex = 0;
  int index = 0;
  List<String>? menus;
  final List<Widget> screentTab = [
    const MaincctvReq(), // 0
    const Mainfirereq(), // 1
    const MainElectric(), // 2
    const MainPlumbing(), // 3
    const MainPhone(), // 4
    const Authenspsch(), // 5
  ];

  // List<List<Categories>> selectCategories = [];

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
              // const SizedBox(height: 15),
              // ImageSlider(
              //   currentSlide: currentSlider,
              //   onChang: (value) {
              //     setState(() {
              //       currentSlider = value;
              //     });
              //   },
              // ),
              const SizedBox(height: 20),
              const Categories(),
              const SizedBox(height: 20),
              const FdhCategory(),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                ],
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}

Widget getSelectedWidget({required int index}) {
  Widget widget;
  switch (index) {
    case 0:
      widget = const MaincctvReq();
      break;
    case 1:
      widget = const Mainfirereq();
      break;
    case 2:
      widget = const MainElectric();
      break;
    case 3:
      widget = const MainPlumbing();
      break;
    case 4:
      widget = const MainPhone();
      break;
    case 5:
      widget = const Authenspsch();
      break;
    default:
      widget = const MaincctvReq();
  }
  return widget;
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
