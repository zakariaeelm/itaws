import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:maan_food/services/auth_services.dart';
import 'package:maan_food/Screens/Authentication/sign_up.dart';
import 'package:maan_food/constant.dart';
import 'package:nb_utils/nb_utils.dart';

class SocialSignIn extends StatefulWidget {
  const SocialSignIn({Key? key}) : super(key: key);

  @override
  State<SocialSignIn> createState() => _SocialSignInState();
}

class _SocialSignInState extends State<SocialSignIn> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
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
            Padding(
                padding: const EdgeInsets.all(20.0),
                child: GestureDetector(
                  onTap: () {
                    signInWithGoogle(context);
                  },
                  child: Container(
                    width: context.width(),
                    height: 60.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                          color: kGreyTextColor.withOpacity(0.2)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'images/google.png',
                          height: 30.0,
                          width: 30.0,
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'Continue With Google',
                          style: kTextStyle.copyWith(color: kTitleColor),
                        ),
                      ],
                    ),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20.0, bottom: 10.0),
              child: GestureDetector(
                onTap: () {
                  signInWithFacebook(context);
                },
                child: Container(
                  width: context.width(),
                  height: 60.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: kMainColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        FontAwesomeIcons.facebookF,
                        size: 30.0,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        'Continue With Facebook',
                        style: kTextStyle.copyWith(
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Divider(
                        thickness: 1.0,
                        color: kGreyTextColor.withOpacity(0.3),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'or',
                    style:
                    kTextStyle.copyWith(color: kGreyTextColor),
                  ),
                ),
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Divider(
                        thickness: 1.0,
                        color: kGreyTextColor.withOpacity(0.3),
                      ),
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: GestureDetector(
                onTap: () {
                  const SignUp().launch(context);
                },
                child: Container(
                  width: context.width(),
                  height: 60.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(color: Colors.red),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Continue With Email',
                        style:
                        kTextStyle.copyWith(color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.only(left: 10.0, right: 10.0),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'By continuing, you agree to our  ',
                  style: kTextStyle.copyWith(color: kTitleColor),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Terms & conditions',
                        style: kTextStyle.copyWith(
                            fontWeight: FontWeight.bold,
                            color: kMainColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print('Terms & conditions');
                          }),
                    TextSpan(
                      text: '  and ',
                      style:
                      kTextStyle.copyWith(color: kTitleColor),
                    ),
                    TextSpan(
                        text: 'Privacy Policy',
                        style: kTextStyle.copyWith(
                            fontWeight: FontWeight.bold,
                            color: kMainColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print('Privacy Policy');
                          }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
