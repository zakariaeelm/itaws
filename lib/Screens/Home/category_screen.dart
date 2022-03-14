import 'package:flutter/material.dart';
import 'package:maan_food/GlobalComponents/category_data.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../constant.dart';
import 'home_screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/authbg.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 40.0,
                ),
                Expanded(
                  child: Container(
                    width: context.width(),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0)),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20.0,
                        ),
                        GridView.count(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          childAspectRatio: 1,
                          crossAxisCount: 4,
                          children: List.generate(
                            catData.length,
                                (index) => CatCard(
                              catList: catData[index],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
