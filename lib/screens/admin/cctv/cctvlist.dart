import 'package:flutter/material.dart';
import 'package:pkhos/models/article_model.dart';
import 'package:pkhos/utility/my_constant.dart';

class CctvList extends StatelessWidget {
  final ArticleModel articleModel;
  const CctvList({super.key, required this.articleModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: MyConstant.kprimaryColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Image.asset(
                      "images/cctv2.png",
                      // width: 130,
                      // height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        articleModel.articleNum!,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ),
                     Padding(
                      padding: EdgeInsets.only(left: 2),
                      child: Text(
                        articleModel.cctvType!,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ),
                    
                    Row(
                      children: [
                       
                        Padding(
                          padding: EdgeInsets.only(right: 5),
                          child: Text(
                            articleModel.articleName!,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                // Padding(
                //   padding: EdgeInsets.only(left: 10),
                // ),
                // SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
