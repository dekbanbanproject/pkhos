import 'package:flutter/material.dart';
import 'package:pkhos/states/login.dart';
 

Future<Null> signoutProcess(BuildContext context) async {
  MaterialPageRoute route = MaterialPageRoute(
    builder: (context) => Login(),
  );
  Navigator.pushAndRemoveUntil(context, route, (route) => false);
}
