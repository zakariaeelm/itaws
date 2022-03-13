import 'package:flutter/material.dart';
import 'package:maan_food/GlobalComponents/product_data.dart';
import 'package:maan_food/Screens/Orders/order_details.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../constant.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  List<String> tabTitle = ['All Order', 'Pending','Confirmed', 'Processing', 'Delivered'];
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
                        'Orders',
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
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: HorizontalList(
                            spacing: 10,
                            itemCount: tabTitle.length,
                            itemBuilder: (_, i) {
                              return Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  border: Border.all(color: kGreyTextColor),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Center(
                                  child: Text(tabTitle[i],style: kTextStyle.copyWith(color: kTitleColor),),
                                ),
                              );
                            },
                          ),
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                            itemCount: productList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(color: kGreyTextColor.withOpacity(0.1)),
                                  ),
                                  child: Row(
                                    children: [
                                      Image(image: AssetImage(productList[index].productImage),height: 60.0, width: 60.0,),
                                      const SizedBox(width: 4.0,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                         Text(productList[index].productTitle,style: kTextStyle.copyWith(color: kTitleColor,fontWeight: FontWeight.bold),),
                                          Text(
                                            '\$${productList[index].productPrice}',style: kTextStyle.copyWith(color: kTitleColor,fontWeight: FontWeight.bold),),
                                          const SizedBox(width: 4.0,),
                                          Row(
                                            children: [
                                              Container(
                                                padding: const EdgeInsets.all(4.0),
                                                decoration: BoxDecoration(
                                                  color: kMainColor.withOpacity(0.1),
                                                  borderRadius: BorderRadius.circular(1.0),
                                                ),
                                                child: Text('Confirmed',style: kTextStyle.copyWith(color: kMainColor,fontSize: 10.0),),
                                              ),
                                              const SizedBox(width: 50.0,),
                                              Text('23 Jan, 2021',style: kTextStyle.copyWith(color: kGreyTextColor),),
                                            ],
                                          ),
                                        ],
                                      ),

                                    ],
                                  ),
                                ).onTap((){
                                  const OrderDetails().launch(context);
                                }),
                              );
                            }),
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
