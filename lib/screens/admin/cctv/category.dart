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
  // List screens = const [
  //   MaincctvReq(), // 0
  //   Mainfirereq(), // 1
  //   MainElectric(), // 2
  //   MainPlumbing(), // 3
  //   MainPhone(), // 4
  //   Authenspsch() // 5
  // ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(categories[index].image),
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  categories[index].title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                width: 20,
              ),
          itemCount: categories.length),
    );
  }
}
