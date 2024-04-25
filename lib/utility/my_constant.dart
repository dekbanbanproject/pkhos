import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MyConstant {
  static String appName = 'PK-OFFice';
  // static String domain = 'http://27.254.191.157/';
  static String domain = 'http://smarthos-phukieohos.moph.go.th';

  static String routeLogin = '/login';
  static String routeHome = '/home';
  static String routeUserPage = '/user';
  static String routeCameracctv = '/cameracctv';
  static String routeCctvhome = '/cctvhome';
  // static String routePoPage = '/po';
  static String routeAdminPage = '/admin';
  static String routeAdminnewPage = '/adminnew';

  // static String routeResetPage = '/reset';
  // static String routeGleavePage = '/gleave';
  // static String routeTdbPage = '/tdb';
  // static String routeTdbSPage = '/tdbS';
  // static String routeTGleaveDetailPage = '/gleavedetail';

  var version = Text(
      // 'V.641105', style: TextStyle(color: Colors.white),
      'V.660917',
      style: TextStyle(
        color: Colors.orange,
        fontSize: 17,
      )
      // style: MyConstant().h2back(),
      );

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    return '?token=$token';
  }

  var apiUrl = '/gtw/api/signin.php?isAdd=true';

  getDataauth(apiUrl) async {
    var fullUrl = domain + apiUrl + await _getToken();
    return await http.get(Uri.parse(fullUrl), headers: _setHeaders());
  }

  static List<String> menus = [
    ' Dashboard  ',
    ' หนังสือราชการ  ',
    '    การลา    ',
    ' ประชุม/อบรม/ดูงาน  ',
    '  จัดซื้อจัดจ้าง  ',
    '  คลังวัสดุ  ',
  ];

  static List<Color> colors = [
    Colors.blueAccent.shade700,
    Colors.blueAccent.shade700,
    Colors.blueAccent.shade700,
    Colors.blueAccent.shade700,
    Colors.blueAccent.shade700,
    Colors.blueAccent.shade700,
  ];

  static List<Image> image = [
    Image.asset('images/logo.png'),
  ];

  // Image
  static String img1 = 'images/Job.png';
  static String img2 = 'images/logo.png';
  static String img3 = 'images/Payment.png';
  static String img_logo = 'images/logo.png';
  static String img5 = 'images/logogtw.png';

  //Color
  static Color primary = Color(0xff3065f7);
  static Color danger = Color(0xffff0000);
  static Color warning = Color(0xffff3b00);
  static Color success = Color(0xff3af75d);
  static Color info = Color(0xff32bcf7);
  static Color dark = Color(0xffa3a18c);
  static Color white = Color(0xFFFFFFFF);
  static Color back = Color(0xFF020202);
  static const kprimaryColor = Color(0xffF5F5F5);
   static const searchColor = Color.fromARGB(255, 252, 234, 224);
  static const kcontentColor = Color(0xffff660e);
  static const cctvhomeColor = Color.fromARGB(255, 253, 128, 44);
  static const cctvaddColor = Color.fromARGB(255, 14, 167, 255);
  static const kcctvtColor = Color.fromARGB(255, 14, 167, 255);
  static const cctvprofileColor = Color.fromARGB(255, 253, 49, 127);
  static const cctvtreportColor = Color.fromARGB(255, 10, 174, 196);
  //Style
  TextStyle h1() =>
      TextStyle(fontSize: 24, color: primary, fontWeight: FontWeight.bold);

  TextStyle h1dark() =>
      TextStyle(fontSize: 22, color: back, fontWeight: FontWeight.normal);

  TextStyle h1White() =>
      TextStyle(fontSize: 24, color: white, fontWeight: FontWeight.bold);

  TextStyle h2() =>
      TextStyle(fontSize: 17, color: primary, fontWeight: FontWeight.bold);

  TextStyle h2White() =>
      TextStyle(fontSize: 17, color: white, fontWeight: FontWeight.bold);

  TextStyle h2info() =>
      TextStyle(fontSize: 17, color: info, fontWeight: FontWeight.bold);

  TextStyle h2dan() =>
      TextStyle(fontSize: 17, color: danger, fontWeight: FontWeight.bold);

  TextStyle h22dark() =>
      TextStyle(fontSize: 17, color: dark, fontWeight: FontWeight.bold);

  TextStyle h2dark() =>
      TextStyle(fontSize: 15, color: dark, fontWeight: FontWeight.bold);
  TextStyle h3dark() =>
      TextStyle(fontSize: 17, color: dark, fontWeight: FontWeight.bold);
  TextStyle h4dark() =>
      TextStyle(fontSize: 15, color: dark, fontWeight: FontWeight.bold);
  TextStyle h5dark() =>
      TextStyle(fontSize: 13, color: dark, fontWeight: FontWeight.bold);

  TextStyle h3() =>
      TextStyle(fontSize: 14, color: primary, fontWeight: FontWeight.bold);

  TextStyle h3white() =>
      TextStyle(fontSize: 14, color: white, fontWeight: FontWeight.bold);

  TextStyle h1back() =>
      TextStyle(fontSize: 24, color: back, fontWeight: FontWeight.bold);
  TextStyle h2back() =>
      TextStyle(fontSize: 20, color: back, fontWeight: FontWeight.bold);
  TextStyle h3back() =>
      TextStyle(fontSize: 17, color: back, fontWeight: FontWeight.bold);
  TextStyle h4back() =>
      TextStyle(fontSize: 15, color: back, fontWeight: FontWeight.bold);

  TextStyle h1whit24() =>
      TextStyle(fontSize: 24, color: white, fontWeight: FontWeight.bold);
  TextStyle h1whit20() =>
      TextStyle(fontSize: 20, color: white, fontWeight: FontWeight.bold);
  TextStyle h1whit17() =>
      TextStyle(fontSize: 17, color: white, fontWeight: FontWeight.bold);
  TextStyle h1cctv17() => TextStyle(
      fontSize: 17,
      color: Color.fromARGB(255, 248, 143, 143),
      fontWeight: FontWeight.bold);

  Text showTitle(String title) => Text(
        title,
        style: h3white(),
      );

//Button
  ButtonStyle mybuttonStyle() => ElevatedButton.styleFrom(
        // iconColor: Colors.orange,
        backgroundColor: Color.fromARGB(255, 54, 186, 247),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      );

  BoxDecoration myBoxDecoration(String namePic) {
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage('images/$namePic'),
        fit: BoxFit.cover,
      ),
    );
  }

  Container showlogo2() {
    return Container(
      width: 360.0,
      child: Image.asset('images/logo.png'),
    );
  }
  // Mydialog()
}
