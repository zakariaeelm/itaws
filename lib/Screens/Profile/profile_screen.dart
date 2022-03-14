import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maan_food/Screens/Profile/edit_profile.dart';
import 'package:maan_food/Screens/Profile/notification_screen.dart';
import 'package:maan_food/Screens/Profile/wish_list.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../constant.dart';
import '../Authentication/auth_services.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _photoUrl = FirebaseAuth.instance.currentUser != null
      ? FirebaseAuth.instance.currentUser!.photoURL
      : '';
  final _userName = FirebaseAuth.instance.currentUser != null
      ? FirebaseAuth.instance.currentUser!.displayName
      : 'uknown';

  double getListHeight(context) {
    if (Platform.isAndroid) {
      return MediaQuery.of(context).size.width * 0.2;
    } else if (Platform.isIOS) {
      return MediaQuery.of(context).size.width * 0.24;
    }
    return 50.0;
  }

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
                  SizedBox(
                    height: getListHeight(context),
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
                        CircleAvatar(
                          radius: 40.0,
                          child: ClipOval(
                            child: Image.network(
                              _photoUrl.toString(),
                              width: 100.0,
                              height: 100.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          _userName.toString(),
                          style: kTextStyle.copyWith(
                              color: kTitleColor, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  color: Color(0xFFF5F5F5),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30.0),
                                      topRight: Radius.circular(30.0)),
                                ),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          color: Colors.white,
                                        ),
                                        child: ListTile(
                                          onTap: () {
                                            const EditProfile().launch(context);
                                          },
                                          leading: const CircleAvatar(
                                            backgroundColor: Color(0xFFF5F5F5),
                                            child: Icon(
                                              Icons.person_outline_rounded,
                                              color: kMainColor,
                                            ),
                                          ),
                                          title: Text(
                                            'My Profile',
                                            style: kTextStyle.copyWith(
                                                color: kGreyTextColor),
                                          ),
                                          trailing: const Icon(
                                            Icons.arrow_forward_ios,
                                            color: kGreyTextColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          color: Colors.white,
                                        ),
                                        child: ListTile(
                                          leading: const CircleAvatar(
                                            backgroundColor: Color(0xFFF5F5F5),
                                            child: Icon(
                                              Icons.payment_rounded,
                                              color: kMainColor,
                                            ),
                                          ),
                                          title: Text(
                                            'Payment Settings',
                                            style: kTextStyle.copyWith(
                                                color: kGreyTextColor),
                                          ),
                                          trailing: const Icon(
                                            Icons.arrow_forward_ios,
                                            color: kGreyTextColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          color: Colors.white,
                                        ),
                                        child: ListTile(
                                          onTap: () {
                                            const NotificationScreen()
                                                .launch(context);
                                          },
                                          leading: const CircleAvatar(
                                            backgroundColor: Color(0xFFF5F5F5),
                                            child: Icon(
                                              Icons.notifications_none,
                                              color: kMainColor,
                                            ),
                                          ),
                                          title: Text(
                                            'Notification',
                                            style: kTextStyle.copyWith(
                                                color: kGreyTextColor),
                                          ),
                                          trailing: const Icon(
                                            Icons.arrow_forward_ios,
                                            color: kGreyTextColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          color: Colors.white,
                                        ),
                                        child: ListTile(
                                          onTap: () {
                                            const WishList().launch(context);
                                          },
                                          leading: const CircleAvatar(
                                            backgroundColor: Color(0xFFF5F5F5),
                                            child: Icon(
                                              Icons.favorite_border_outlined,
                                              color: kMainColor,
                                            ),
                                          ),
                                          title: Text(
                                            'Wishlist',
                                            style: kTextStyle.copyWith(
                                                color: kGreyTextColor),
                                          ),
                                          trailing: const Icon(
                                            Icons.arrow_forward_ios,
                                            color: kGreyTextColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          color: Colors.white,
                                        ),
                                        child: ListTile(
                                          leading: const CircleAvatar(
                                            backgroundColor: Color(0xFFF5F5F5),
                                            child: Icon(
                                              Icons.shopping_cart_outlined,
                                              color: kMainColor,
                                            ),
                                          ),
                                          title: Text(
                                            'Order Tracking',
                                            style: kTextStyle.copyWith(
                                                color: kGreyTextColor),
                                          ),
                                          trailing: const Icon(
                                            Icons.arrow_forward_ios,
                                            color: kGreyTextColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          color: Colors.white,
                                        ),
                                        child: ListTile(
                                          onTap: () async {
                                            await signOut(context);
                                          },
                                          leading: const CircleAvatar(
                                            backgroundColor: Color(0xFFF5F5F5),
                                            child: Icon(
                                              Icons.logout,
                                              color: kMainColor,
                                            ),
                                          ),
                                          title: Text(
                                            'Logout',
                                            style: kTextStyle.copyWith(
                                                color: kGreyTextColor),
                                          ),
                                          trailing: const Icon(
                                            Icons.arrow_forward_ios,
                                            color: kGreyTextColor,
                                          ),
                                        ),
                                      ),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
