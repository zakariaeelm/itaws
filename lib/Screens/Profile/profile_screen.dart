import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maan_food/Screens/Profile/edit_profile.dart';
import 'package:maan_food/Screens/Profile/notifications/notification_screen.dart';
import 'package:maan_food/Screens/Profile/profile_section.dart';
import 'package:maan_food/Screens/Profile/wish_list.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../constant.dart';
import '../../services/auth_services.dart';

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
                                    ProfileSection(
                                        iconSection:
                                            Icons.person_outline_rounded,
                                        text: 'My Profile',
                                        onTap: () {
                                          const EditProfile().launch(context);
                                        }),
                                    ProfileSection(
                                        iconSection: Icons.payment_rounded,
                                        text: 'Payment Settings',
                                        onTap: () {
                                          const EditProfile().launch(context);
                                        }),
                                    ProfileSection(
                                        iconSection: Icons.notifications_none,
                                        text: 'Notification',
                                        onTap: () {
                                          const NotificationScreen().launch(context);
                                        }),
                                    ProfileSection(
                                        iconSection:
                                            Icons.favorite_border_outlined,
                                        text: 'Wishlist',
                                        onTap: () {
                                          const WishList().launch(context);
                                        }),
                                    ProfileSection(
                                        iconSection:
                                            Icons.shopping_cart_outlined,
                                        text: 'Order Tracking',
                                        onTap: () {
                                          print('order tracking section');
                                        }),
                                    ProfileSection(
                                        iconSection: Icons.logout,
                                        text: 'Logout',
                                        onTap: () async {
                                          await signOut(context);
                                        }),
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
