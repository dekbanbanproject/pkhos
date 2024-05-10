import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pkhos/screens/admin/fdh/mainfdh.dart';
import 'package:pkhos/utility/my_constant.dart';

class FdhCategory extends StatefulWidget {
  const FdhCategory({super.key});

  @override
  State<FdhCategory> createState() => _FdhCategoryState();
}

class _FdhCategoryState extends State<FdhCategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ('/mainfdh'),);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(50.0),
                    ),
                    backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("images/fdhss.png"),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "FDH",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ElevatedButton(
                   onPressed: () {
                    Navigator.pushNamed(context, ('/authen'),);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(50.0),
                    ),
                    backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("images/authen.png"),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Authen",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(50.0),
                    ),
                    backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("images/spsch_3.png"),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "สปสช.",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(50.0),
                    ),
                    backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("images/30bath.png"),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "30 บาท",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(50.0),
                    ),
                    backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("images/telemed.png"),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "telemedicine",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
