import 'package:flutter/material.dart';
import 'package:pkhos/models/firemodel.dart';

class MainFireedit extends StatefulWidget {
    final Firemodel fireModel;
  const MainFireedit({Key? key, required this.fireModel})
      : super(key: key);

  @override
  State<MainFireedit> createState() => _MainFireeditState();
}

class _MainFireeditState extends State<MainFireedit> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}