import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pkhos/models/usersModel.dart';
import 'package:pkhos/utility/my_constant.dart';
import 'package:pkhos/utility/my_dialog.dart';
import 'package:pkhos/widgets/show_image.dart';
import 'package:pkhos/widgets/show_title.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool statusRedEye = true;
  final formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passappController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          behavior: HitTestBehavior.opaque,
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                buildImage(size),
                builAppname(),
                buildUser(size),
                buildPassword(size),
                buildSubmitlogin(size),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildSubmitlogin(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 18),
          width: size * 0.6,
          child: ElevatedButton(
            style: MyConstant().mybuttonStyle(),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                String username = usernameController.text;
                String passapp = passappController.text;
                print('## username = $username, passapp = $passapp');
                checkLogin(username: username, passapp: passapp);
                // checkAuthen();
              }
            },
            child: Text('Login',style: MyConstant().h2White(),),
            // child:  ElevatedButton(
            //                 onPressed: () => scanQR(),
            //              child: Text('Start QR scan'))

          ),
        ),
      ],
    );
  }

  Future<Null> checkLogin({String? username, String? passapp}) async {
    String apicheckLogin =
        '${MyConstant.domain}/pkhos/api/signin.php?isAdd=true&username=$username';
    await Dio().get(apicheckLogin).then((value) async {
      print('## value for API  ==>  $value');
     
      if (value.toString() == 'null') {
        MyDialog().normalDialog(
            context, 'ไม่มี $username ในฐานข้อมูล', 'Username ผิด');
      } else {
        for (var item in json.decode(value.data!)) {
          UsersModel model = UsersModel.fromMap(item);
          if (passapp == model.passapp) {
            String type = model.type;
            print('## value for API ===> $type');
            SharedPreferences preferences = await SharedPreferences.getInstance();
            preferences.setString('type', type);
            preferences.setString('username', model.username);
            preferences.setString('id', model.id);

             switch (type) {
              case 'ADMIN':
                Navigator.pushNamedAndRemoveUntil(
                    context, MyConstant.routeAdminnewPage, (route) => false);
                break;
              case 'USER':
                Navigator.pushNamedAndRemoveUntil(
                    context, MyConstant.routeUserPage, (route) => false);
                break;
           
              default:
            }
          } else {
            
             MyDialog().normalDialog(
            context, 'ไม่มี $passapp ในฐานข้อมูล', 'Password ผิด');
          }
        }
      }
    });

    // await Dio().get{apicheckLogin}.then((value){
  }

  Row buildPassword(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 15),
          width: size * 0.6,
          child: TextFormField(
            controller: passappController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอก Password';
              } else {
                return null;
              }
            },
            obscureText: statusRedEye,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      statusRedEye = !statusRedEye;
                    });
                  },
                  icon: statusRedEye
                      ? Icon(
                          Icons.remove_red_eye,
                          color: MyConstant.info,
                        )
                      : Icon(
                          Icons.remove_red_eye_outlined,
                          color: MyConstant.info,
                        )),
              labelStyle: MyConstant().h2(),
              labelText: 'Password ',
              prefixIcon: Icon(
                Icons.lock_open,
                color: MyConstant.info,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.primary),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.warning),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row buildUser(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 25),
          width: size * 0.6,
          child: TextFormField(
            controller: usernameController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอก username';
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              labelStyle: MyConstant().h2(),
              labelText: 'Username ',
              prefixIcon: Icon(
                Icons.account_circle,
                color: MyConstant.info,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.primary),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.warning),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row builAppname() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 25),
          child: ShowTitle(
            title: MyConstant.appName,
            textStyle: MyConstant().h1(),
          ),
        ),
      ],
    );
  }

  Row buildImage(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 90),
          width: size * 0.4,
          child: ShowImage(path: MyConstant.img_logo),
        ),
      ],
    );
  }
}
