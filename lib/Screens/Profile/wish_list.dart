import 'package:flutter/material.dart';
import 'package:maan_food/GlobalComponents/product_data.dart';
import 'package:maan_food/Screens/Home/home_screen.dart';
import 'package:maan_food/Screens/Home/product_details.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../constant.dart';
 class WishList extends StatefulWidget {
   const WishList({Key? key}) : super(key: key);

   @override
   _WishListState createState() => _WishListState();
 }

 class _WishListState extends State<WishList> {
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
             SingleChildScrollView(
               child: Column(
                 children: [
                   Row(
                     children: [
                       Padding(
                         padding: const EdgeInsets.all(20.0),
                         child: const Icon(
                           Icons.arrow_back,
                           color: kTitleColor,
                         ).onTap(() {
                           Navigator.pop(context);
                         }),
                       ),
                       Text(
                         'WishList',
                         style: kTextStyle.copyWith(
                             color: kTitleColor, fontSize: 18.0),
                       ),
                     ],
                   ),
                   const SizedBox(
                     height: 40.0,
                   ),
                   Container(
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
                           shrinkWrap: true,
                           physics: const NeverScrollableScrollPhysics(),
                           childAspectRatio: 0.85,
                           crossAxisCount: 2,
                           children: List.generate(
                             productList.length,
                                 (index) => Center(
                               child: FoodCard(
                                 productData: productList[index],
                               ).onTap(() {
                                 ProductDetails(product: productList[index])
                                     .launch(context);
                               }),
                             ),
                           ),
                         ),
                       ],
                     ),
                   ),
                 ],
               ),
             ),
           ],
         ),
       ),
     );
   }
 }
