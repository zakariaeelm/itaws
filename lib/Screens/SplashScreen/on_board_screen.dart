import 'package:flutter/material.dart';
import 'package:maan_food/Screens/Authentication/sign_in.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../constant.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  PageController pageController = PageController(initialPage: 0);
  int currentIndexPage = 0;
  String buttonText = 'Next';

  List<Map<String, dynamic>> sliderList = [
    {
      "icon": 'images/onboard1.png',
      "title": 'Welcome to Maan Food Restaurant',
      "description":
          'Lorem ipsum dolor sit amet, conse cte tur adip is cing elit. Sed mattis.',
    },
    {
      "icon": 'images/onboard2.png',
      "title": 'Choose Your Favorite Food',
      "description":
          'Lorem ipsum dolor sit amet, conse cte tur adip is cing elit. Sed mattis.',
    },
    {
      "icon": 'images/onboard3.png',
      "title": 'Get your Parcel More Safely',
      "description":
          'Lorem ipsum dolor sit amet, conse cte tur adip is cing elit. Sed mattis.',
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFCF1F0),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height - 30,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  PageView.builder(
                    itemCount: sliderList.length,
                    controller: pageController,
                    onPageChanged: (int index) =>
                        setState(() => currentIndexPage = index),
                    itemBuilder: (_, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0,
                                right: 10.0,
                                top: 25.0,
                                bottom: 20.0),
                            child: SizedBox(
                              width: context.width() / 2,
                              child: Text(
                                sliderList[index]['title'].toString(),
                                style: kTextStyle.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: kTitleColor,
                                    fontSize: 18.0),
                              ),
                            ),
                          ),
                          // ignore: sized_box_for_whitespace
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                            // ignore: sized_box_for_whitespace
                            child: Text(
                              sliderList[index]['description'].toString(),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 5,
                              style: kTextStyle.copyWith(
                                color: kGreyTextColor,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Image.asset(
                            sliderList[index]['icon'],
                            fit: BoxFit.fill,
                            width: context.width(),
                          ),
                        ],
                      );
                    },
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 200),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap:  () {
                            FirebaseFirestore.instance.collection('maan').snapshots().listen((data) {
                              print(data.docs.first.data());
                            });
                            Fluttertoast.showToast(
                                msg: "This is Center Short Toast",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0
                            );
                            setState(
                                  () {
                                currentIndexPage <2 ?
                                pageController.nextPage(
                                    duration: const Duration(microseconds: 1000),
                                    curve: Curves.bounceInOut) : const SignIn().launch(context);
                              },
                            );
                          },
                          child: Container(
                            width: 90,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: kMainColor,
                            ),
                            child: Center(
                              child: Image.asset(
                                  'images/chevrons-right.png'),
                            ),
                          ),
                        ),
                        const Spacer(),
                        DotIndicator(
                          currentDotSize: 15,
                          dotSize: 6,
                          pageController: pageController,
                          pages: sliderList,
                          indicatorColor: kMainColor,
                          unselectedIndicatorColor: kSecondaryColor,
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
