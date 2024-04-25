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
              children: [
                SizedBox(height: 15),
                Center(
                  child: Image.asset(
                    articleModel.articleImg!,
                    width: 130,
                    height: 130,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    articleModel.articleName!,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                 SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
