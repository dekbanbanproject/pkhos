import 'package:flutter/material.dart';
import 'package:pkhos/states/admin.dart';
import 'package:pkhos/states/home.dart';
import 'package:pkhos/states/login.dart';
import 'package:pkhos/utility/my_constant.dart';
 

final Map<String, WidgetBuilder> map = {
  '/login': (BuildContext context) => const Login(),
  '/home': (BuildContext context) => const Home(),
  '/admin': (BuildContext context) => const AdminPage(),
};

String? initlalRoute;

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SharedPreferences preferences = await SharedPreferences.getInstance();
   initlalRoute = MyConstant.routeLogin;
    runApp(MyApp());
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
