import 'package:flutter/material.dart';
import 'package:maan_food/constant.dart';
import 'package:maan_food/widgets/social_sign_in.dart';
import 'package:nb_utils/nb_utils.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 30.0),
                  child: SizedBox(
                      width: context.width() / 2,
                      child: Text(
                        'Sign Up & Log In to Maan Food',
                        style: kTextStyle.copyWith(
                            color: kTitleColor,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      )),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                const SocialSignIn(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
