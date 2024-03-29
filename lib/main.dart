import 'package:flutter/material.dart';
import 'package:pkhos/states/admin.dart';
import 'package:pkhos/states/home.dart';
import 'package:pkhos/states/login.dart';
import 'package:pkhos/states/user.dart';
import 'package:pkhos/utility/my_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

final Map<String, WidgetBuilder> map = {
  '/login': (BuildContext context) => const Login(),
  '/home': (BuildContext context) => const Home(),
  '/admin': (BuildContext context) => const AdminPage(),
  '/user': (BuildContext context) => const UserPage(),
};

String? initlalRoute;

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SharedPreferences preferences = await SharedPreferences.getInstance();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String? type = preferences.getString('type');
  String? username = preferences.getString('username');
 String? id = preferences.getString('id');

  if (type?.isEmpty ?? true) {
    initlalRoute = MyConstant.routeLogin;
    runApp(MyApp());
  } else {
    switch (type) {
      case 'ADMIN':
              initlalRoute = MyConstant.routeAdminPage;
              runApp(MyApp());
            break;
          case 'USER':
              initlalRoute = MyConstant.routeUserPage;
              runApp(MyApp());
            break;
      default:
    }
  }
  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MyConstant.appName,
      debugShowCheckedModeBanner: false,
      routes: map,
      initialRoute: initlalRoute,
    );
  }
}
