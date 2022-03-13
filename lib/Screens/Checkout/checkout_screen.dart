import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:maan_food/GlobalComponents/button_global.dart';
import 'package:maan_food/Screens/Checkout/track_order.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../constant.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  // ignore: prefer_typing_uninitialized_variables
  var dialogContext;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  List<String> data = ["Paypal", "Debit Card", "Bkash", "Cash On Delivery"];
  List<String> userChecked = [];
  List<String> icons = [
    'images/paypal.png',
    'images/card.png',
    'images/bkash.png',
    'images/cod.png',
  ];

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }

  void _onSelected(bool selected, String dataName) {
    if (selected == true) {
      setState(() {
        userChecked.add(dataName);
      });
    } else {
      setState(() {
        userChecked.remove(dataName);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Card(
          elevation: 0.0,
          color: Colors.white,
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
                Expanded(
                  child: Text(
                    'Total: \$129.99',
                    style: kTextStyle.copyWith(
                        color: kTitleColor, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 55.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: kMainColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                dialogContext = context;
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  // ignore: sized_box_for_whitespace
                                  child: Container(
                                    padding: const EdgeInsets.all(20.0),
                                    height: MediaQuery.of(context).size.height /
                                        2,
                                    width:
                                        MediaQuery.of(context).size.width - 80,
                                    child: Center(
                                      child: Column(
                                        children: [
                                          const CircleAvatar(
                                            radius: 50,
                                            backgroundColor: kMainColor,
                                            child: CircleAvatar(
                                              radius: 48,
                                              backgroundColor: Colors.white,
                                              child: Icon(
                                                Icons.done_rounded,
                                                size: 45.0,
                                                color: kMainColor,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 30.0),
                                          Text(
                                            'Order successful',
                                            style: kTextStyle.copyWith(
                                                color: kTitleColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(height: 10.0),
                                          Text(

                                            'Your order #15462 is successfully placed',
                                            style: kTextStyle.copyWith(
                                                color: kGreyTextColor),
                                            textAlign: TextAlign.center,
                                          ),
                                          const SizedBox(height: 10.0),
                                          ButtonGlobal(
                                              buttontext: 'Track Your Order',
                                              buttonDecoration:
                                                  kButtonDecoration.copyWith(
                                                      color: kMainColor),
                                              onPressed: () {
                                                const TrackOrder().launch(context);
                                              }),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              const Icon(
                                                Icons.arrow_back,
                                                color: Colors.red,
                                              ),
                                              Text(
                                                "Go Back",
                                                style: kTextStyle.copyWith(
                                                    color: kGreyTextColor),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                          child: Text(
                            'Checkout',
                            style: kTextStyle.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                        ),
                      ],
                    ),
                  ),
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
                        'Checkout',
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
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: [
                              Text(
                                'Address',
                                style: kTextStyle.copyWith(
                                    color: kTitleColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              GestureDetector(
                                  onTap: () => showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        dialogContext = context;
                                        return SingleChildScrollView(
                                          child: Dialog(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            // ignore: sized_box_for_whitespace
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.all(20.0),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  1.3,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  80,
                                              child: Center(
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      'Add New Address',
                                                      style:
                                                          kTextStyle.copyWith(
                                                              color:
                                                                  kTitleColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                    Text(
                                                      'Please Enter Your Current Address Here',
                                                      style:
                                                          kTextStyle.copyWith(
                                                        color: kGreyTextColor,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 10.0,
                                                              bottom: 10.0),
                                                      child: Image.asset(
                                                          'images/mapsmall.png'),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 10.0,
                                                              bottom: 10.0),
                                                      child: AppTextField(
                                                        textFieldType:
                                                            TextFieldType
                                                                .ADDRESS,
                                                        decoration:
                                                            const InputDecoration(
                                                          labelText:
                                                              'Street Address & City',
                                                          hintText:
                                                              '112/3 Kolatola Ave',
                                                          border:
                                                              OutlineInputBorder(),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 10.0,
                                                              bottom: 10.0),
                                                      child: AppTextField(
                                                        textFieldType:
                                                            TextFieldType
                                                                .ADDRESS,
                                                        decoration:
                                                            const InputDecoration(
                                                          labelText: 'Road No',
                                                          hintText: '112/3',
                                                          border:
                                                              OutlineInputBorder(),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 10.0,
                                                              bottom: 10.0),
                                                      child: AppTextField(
                                                        textFieldType:
                                                            TextFieldType.PHONE,
                                                        decoration:
                                                            const InputDecoration(
                                                          labelText:
                                                              'Post Code',
                                                          hintText: '1205',
                                                          border:
                                                              OutlineInputBorder(),
                                                        ),
                                                      ),
                                                    ),
                                                    ButtonGlobal(
                                                        buttontext:
                                                            'Save Address',
                                                        buttonDecoration:
                                                            kButtonDecoration
                                                                .copyWith(
                                                                    color:
                                                                        kMainColor),
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              dialogContext);
                                                        }),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                  child: Text(
                                    'Add New',
                                    style: kTextStyle.copyWith(
                                      color: kGreyTextColor,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.orangeAccent.withOpacity(0.2)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor:
                                    Colors.orangeAccent.withOpacity(0.2),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.location_on,
                                    color: Colors.orangeAccent,
                                  ),
                                ),
                              ),
                              title: Text(
                                'Home',
                                style: kTextStyle.copyWith(
                                    color: kTitleColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                '34 North Sulphur Springs Dr. Alexandria, VA 22304',
                                style:
                                    kTextStyle.copyWith(color: kGreyTextColor),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.purpleAccent.withOpacity(0.2)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor:
                                    Colors.purpleAccent.withOpacity(0.2),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.badge,
                                    color: Colors.purpleAccent,
                                  ),
                                ),
                              ),
                              title: Text(
                                'Office',
                                style: kTextStyle.copyWith(
                                    color: kTitleColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                '34 North Sulphur Springs Dr. Alexandria, VA 22304',
                                style:
                                    kTextStyle.copyWith(color: kGreyTextColor),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        Container(
                          width: context.width(),
                          padding: const EdgeInsets.all(20.0),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.0),
                                topRight: Radius.circular(30.0)),
                            color: Color(0xFFF5F5F5),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20.0,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Payment Method',
                                    style: kTextStyle.copyWith(
                                        color: kTitleColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height,
                                child: ListView.builder(
                                  itemCount: data.length,
                                  itemBuilder: (context, i) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: CheckboxListTile(
                                          title: GestureDetector(
                                            onTap: () => showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  dialogContext = context;
                                                  return SingleChildScrollView(
                                                    child: Dialog(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      // ignore: sized_box_for_whitespace
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 20.0,
                                                                bottom: 20.0),
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        child: Center(
                                                          child: Column(
                                                            children: [
                                                              Text(
                                                                'Add New Card',
                                                                style: kTextStyle.copyWith(
                                                                    color:
                                                                        kTitleColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              CreditCardWidget(
                                                                textStyle: kTextStyle.copyWith(
                                                                    fontSize:
                                                                        10.0,
                                                                    color: Colors
                                                                        .white),
                                                                cardNumber:
                                                                    cardNumber,
                                                                expiryDate:
                                                                    expiryDate,
                                                                cardHolderName:
                                                                    cardHolderName,
                                                                cvvCode:
                                                                    cvvCode,
                                                                showBackView:
                                                                    isCvvFocused,
                                                                obscureCardNumber:
                                                                    true,
                                                                obscureCardCvv:
                                                                    true,
                                                                isHolderNameVisible:
                                                                    true,
                                                                cardBgColor:
                                                                    kMainColor,
                                                                isSwipeGestureEnabled:
                                                                    true,
                                                                onCreditCardWidgetChange:
                                                                    (CreditCardBrand
                                                                        creditCardBrand) {},
                                                              ),
                                                              CreditCardForm(
                                                                formKey:
                                                                    formKey,
                                                                // Required
                                                                onCreditCardModelChange:
                                                                    onCreditCardModelChange,
                                                                // Required
                                                                obscureCvv:
                                                                    true,
                                                                obscureNumber:
                                                                    true,
                                                                cardNumber:
                                                                    cardNumber,
                                                                cvvCode:
                                                                    cvvCode,
                                                                isHolderNameVisible:
                                                                    true,
                                                                isCardNumberVisible:
                                                                    true,
                                                                isExpiryDateVisible:
                                                                    true,
                                                                cardHolderName:
                                                                    cardHolderName,
                                                                expiryDate:
                                                                    expiryDate,
                                                                themeColor:
                                                                    Colors.blue,
                                                                textColor:
                                                                    kTitleColor,
                                                                cardNumberDecoration:
                                                                    const InputDecoration(
                                                                  border:
                                                                      OutlineInputBorder(),
                                                                  labelText:
                                                                      'Number',
                                                                  hintText:
                                                                      'XXXX XXXX XXXX XXXX',
                                                                ),
                                                                expiryDateDecoration:
                                                                    const InputDecoration(
                                                                  border:
                                                                      OutlineInputBorder(),
                                                                  labelText:
                                                                      'Expired Date',
                                                                  hintText:
                                                                      'XX/XX',
                                                                ),
                                                                cvvCodeDecoration:
                                                                    const InputDecoration(
                                                                  border:
                                                                      OutlineInputBorder(),
                                                                  labelText:
                                                                      'CVV',
                                                                  hintText:
                                                                      'XXX',
                                                                ),
                                                                cardHolderDecoration:
                                                                    const InputDecoration(
                                                                  border:
                                                                      OutlineInputBorder(),
                                                                  labelText:
                                                                      'Card Holder',
                                                                ),
                                                              ),
                                                              ButtonGlobal(
                                                                  buttontext:
                                                                      'Save Address',
                                                                  buttonDecoration:
                                                                      kButtonDecoration.copyWith(
                                                                          color:
                                                                              kMainColor),
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.pop(
                                                                        dialogContext);
                                                                  }),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }),
                                            child: Text(data[i]),
                                          ),
                                          secondary: Image.asset(icons[i]),
                                          value: userChecked.contains(data[i]),
                                          onChanged: (val) {
                                            _onSelected(val!, data[i]);
                                          },
                                        ),
                                      ),
                                    );
                                  },
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
          ],
        ),
      ),
    );
  }
}
