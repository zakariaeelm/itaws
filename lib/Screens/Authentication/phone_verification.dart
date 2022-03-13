
import 'package:flutter/material.dart';
import 'package:maan_food/GlobalComponents/button_global.dart';
import 'package:maan_food/GlobalComponents/otp_form.dart';
import 'package:maan_food/Screens/Location/location_permission.dart';
import 'package:maan_food/constant.dart';
import 'package:nb_utils/nb_utils.dart';

class PhoneVerification extends StatefulWidget {
  const PhoneVerification({Key? key}) : super(key: key);

  @override
  _PhoneVerificationState createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
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
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Icon(
                    Icons.arrow_back,
                    color: kTitleColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset('images/messageicon.png'),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(left: 20.0, top: 10.0, right: 10.0),
                  child: SizedBox(
                      width: context.width(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Verify your mobile number',
                            style: kTextStyle.copyWith(
                                color: kTitleColor,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Enter 4-digit code sent to your mobile number',
                            style: kTextStyle.copyWith(
                              color: kGreyTextColor,
                            ),
                          ),
                          Text(
                            '+8801855671615',
                            style: kTextStyle.copyWith(
                              color: kMainColor,
                            ),
                          ),
                        ],
                      )),
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
                          height: 40.0,
                        ),
                        const OtpForm(),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          'Try again in 28 seconds',
                          style: kTextStyle.copyWith(
                            color: kGreyTextColor,
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        ButtonGlobal(
                          buttontext: 'Continue',
                          buttonDecoration:
                          kButtonDecoration.copyWith(color: kMainColor),
                          onPressed: (){
                            const LocationPermission().launch(context);
                          },
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
