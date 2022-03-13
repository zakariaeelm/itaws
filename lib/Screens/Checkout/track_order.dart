import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:maan_food/Screens/Orders/order_schat.dart';
import 'package:maan_food/constant.dart';
import 'package:nb_utils/nb_utils.dart';

class TrackOrder extends StatefulWidget {
  const TrackOrder({Key? key}) : super(key: key);

  @override
  _TrackOrderState createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Icon(
                    Icons.arrow_back,
                    color: kTitleColor,
                  ),
                ),
                Text(
                  'Track Your Order',
                  style: kTextStyle.copyWith(color: kTitleColor),
                ),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Icon(
                    Icons.location_searching,
                    color: kTitleColor,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 80.0,
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0)),
                      image: DecorationImage(
                        image: AssetImage("images/mapbig.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 100.0,
                    decoration: const BoxDecoration(
                      color: kTitleColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0)),
                    ),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: CircleAvatar(
                            radius: 30.0,
                            child: Image(image: AssetImage('images/round_logo.png'),fit: BoxFit.cover,),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('John Doe',style: kTextStyle.copyWith(color: Colors.white,fontWeight: FontWeight.bold),),
                                Text('Food Courier',style: kTextStyle.copyWith(color: kGreyTextColor),),
                                RatingBarIndicator(
                                  rating: 4.8,
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  itemCount: 5,
                                  itemSize: 10.0,
                                ),
                              ]),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: (){
                            const ChatScreen().launch(context);
                          },
                          child: const CircleAvatar(
                            radius: 20.0,
                            backgroundColor: kMainColor,
                            child: Icon(Icons.messenger_rounded,color: Colors.white,),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: CircleAvatar(
                            radius: 20.0,
                            backgroundColor: kMainColor,
                            child: Icon(Icons.call,color: Colors.white,),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 250.0,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          leading: const CircleAvatar(
                            backgroundColor: Color(0xFFFFF1E1),
                            child: Icon(Icons.location_on,color: kMainColor,),
                          ),
                          title: Text('Address',style: kTextStyle.copyWith(color: kGreyTextColor),),
                          subtitle: Text('421 Duke street, M54ader',style: kTextStyle.copyWith(color: kTitleColor,fontWeight: FontWeight.bold),),
                        ),
                        ListTile(
                          leading: const CircleAvatar(
                            backgroundColor: Color(0xFFECEAFF),
                            child: Icon(Icons.access_time,color: Color(0xFF7165E3),),
                          ),
                          title: Text('Delivery Time',style: kTextStyle.copyWith(color: kGreyTextColor),),
                          subtitle: Text('20-30 minutes',style: kTextStyle.copyWith(color: kTitleColor,fontWeight: FontWeight.bold),),
                        ),
                        ListTile(
                          leading: const CircleAvatar(
                            backgroundColor: Color(0xFFDCF8FF),
                            child: Icon(Icons.system_security_update_good,color: Color(0xFF29C4F0),),
                          ),
                          title: Text('Order# ',style: kTextStyle.copyWith(color: kGreyTextColor),),
                          subtitle: Text('135464',style: kTextStyle.copyWith(color: kTitleColor,fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
