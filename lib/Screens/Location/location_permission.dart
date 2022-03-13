import 'package:flutter/material.dart';
import 'package:maan_food/GlobalComponents/button_global.dart';
import 'package:maan_food/Screens/Location/location_access.dart';
import 'package:maan_food/constant.dart';
import 'package:nb_utils/nb_utils.dart';

class LocationPermission extends StatefulWidget {
  const LocationPermission({Key? key}) : super(key: key);

  @override
  _LocationPermissionState createState() => _LocationPermissionState();
}

class _LocationPermissionState extends State<LocationPermission> {
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
                  height: 80.0,
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
                        Image.asset('images/mapsmall.png'),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                          child: Text(
                            'Find restaurants and your Favorite food',
                            textAlign: TextAlign.center,
                            style: kTextStyle.copyWith(
                              color: kTitleColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nec enim pellentesque aliquam auctor fringilla risus. ',
                            textAlign: TextAlign.center,
                            style: kTextStyle.copyWith(
                              color: kGreyTextColor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        ButtonGlobal(
                          buttontext: 'Allow Location Access',
                          buttonDecoration:
                          kButtonDecoration.copyWith(color: kMainColor),
                          onPressed: (){
                            const LocationAccess().launch(context);
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Enter My Location',
                            textAlign: TextAlign.center,
                            style: kTextStyle.copyWith(
                              color: kGreyTextColor,
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
