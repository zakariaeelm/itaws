import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:maan_food/GlobalComponents/button_global.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../constant.dart';

class OrderReview extends StatefulWidget {
  const OrderReview({Key? key}) : super(key: key);

  @override
  _OrderReviewState createState() => _OrderReviewState();
}

class _OrderReviewState extends State<OrderReview> {
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
            Column(
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
                      'Order Details',
                      style: kTextStyle.copyWith(
                          color: kTitleColor, fontSize: 18.0),
                    ),
                  ],
                ),
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
                        const CircleAvatar(
                          radius: 40.0,
                          child: Image(
                            image: AssetImage('images/round_logo.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text('Ibne Riead', style: kTextStyle.copyWith(color: kTitleColor,fontWeight: FontWeight.bold),),
                        Text('147 Reviews', style: kTextStyle.copyWith(color: kMainColor),),

                        const SizedBox(
                          height: 20.0,
                        ),
                        RatingBar.builder(
                          initialRating: 3,
                          itemCount: 5,
                            itemBuilder: (context, index) {
                              switch (index) {
                                case 0:
                                  return const Icon(
                                    Icons.sentiment_very_dissatisfied,
                                    color: Colors.red,
                                  );
                                case 1:
                                  return const Icon(
                                    Icons.sentiment_dissatisfied,
                                    color: Colors.redAccent,
                                  );
                                case 2:
                                  return const Icon(
                                    Icons.sentiment_neutral,
                                    color: Colors.amber,
                                  );
                                case 3:
                                  return const Icon(
                                    Icons.sentiment_satisfied,
                                    color: Colors.lightGreen,
                                  );
                                case 4:
                                  return const Icon(
                                    Icons.sentiment_very_satisfied,
                                    color: Colors.green,
                                  );
                                default:
                                  return const Icon(
                                    Icons.sentiment_very_satisfied,
                                    color: Colors.green,
                                  );
                              }

                            },
                          onRatingUpdate: (rating) {

                          },),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            controller: TextEditingController(),
                            minLines: 6, // any number you need (It works as the rows for the textarea)
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            decoration: const InputDecoration(
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              labelText: 'Your Review',
                              hintText: 'Write your review here.....',
                              border: OutlineInputBorder(),
                            ),),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        ButtonGlobalWithoutIcon(
                          buttontext: 'Review',
                          buttonDecoration:
                              kButtonDecoration.copyWith(color: kMainColor),
                          onPressed: null,
                          buttonTextColor: Colors.white,
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
