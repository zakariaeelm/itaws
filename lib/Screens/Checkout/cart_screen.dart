import 'package:flutter/material.dart';
import 'package:maan_food/Screens/Checkout/checkout_screen.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../constant.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Card(
          elevation: 0.0,
          color: const Color(0xFFF5F5F5),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Text('Total: \$129.99',style: kTextStyle.copyWith(color: kTitleColor,fontWeight: FontWeight.bold),),),
                Expanded(
                  child: Container(
                    height: 55.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: kMainColor,
                    ),
                    child: Center(
                      child: Text(
                        'Checkout',
                        style: kTextStyle.copyWith(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                    ),
                  ).onTap((){
                    const CheckoutScreen().launch(context);
                  }),
                ),
              ],
            ),
          ),
        ),
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
                      'Cart',
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
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                  color: kGreyTextColor.withOpacity(0.2)),
                            ),
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  radius: 40.0,
                                  backgroundColor: kMainColor,
                                  child: Image(
                                    image: AssetImage('images/product1.png'),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Delicious Burger',
                                      style:
                                          kTextStyle.copyWith(color: kTitleColor),
                                    ),
                                    Text(
                                      '\$8.99',
                                      style:
                                          kTextStyle.copyWith(color: kMainColor),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          quantity > 1
                                              ? quantity -= 1
                                              : quantity = 1;
                                        });
                                      },
                                      child: const Icon(
                                        Icons.remove,
                                        color: kTitleColor,
                                      ),
                                    ),
                                    Text(
                                      quantity.toString(),
                                      style:
                                          kTextStyle.copyWith(color: kTitleColor),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          quantity > 0
                                              ? quantity += 1
                                              : quantity = 1;
                                        });
                                      },
                                      child: const Icon(
                                        Icons.add,
                                        color: kTitleColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
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
