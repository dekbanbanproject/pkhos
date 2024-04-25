import 'package:flutter/material.dart';
import 'package:pkhos/utility/my_constant.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [        
        IconButton(
          style: IconButton.styleFrom(
              backgroundColor: MyConstant.kprimaryColor,
              padding: const EdgeInsets.all(20)),
          onPressed: () {},
          icon: Icon(Icons.dashboard),
          // icon: Image.asset(
          //   "images/cctv2.jpg",
          //   height: 20,
          // ),
        ),
        IconButton(
          style: IconButton.styleFrom(
              backgroundColor: MyConstant.kprimaryColor,
              padding: const EdgeInsets.all(20)),
          onPressed: () {},
          iconSize: 30,
          icon: Icon(Icons.notifications_outlined),
        ),
      ],
    );
  }
}