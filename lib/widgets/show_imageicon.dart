import 'package:flutter/material.dart';


class ShowImageIcone extends StatelessWidget {
  final String path;
  const ShowImageIcone({Key? key,required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(path);
  }
}