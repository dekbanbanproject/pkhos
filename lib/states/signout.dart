import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pkhos/states/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
 

Future<Null> signoutProcess(BuildContext context) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
    // exit(0);
  MaterialPageRoute route = MaterialPageRoute(
    builder: (context) => Login(),
  );
  Navigator.pushAndRemoveUntil(context, route, (route) => false);
}
