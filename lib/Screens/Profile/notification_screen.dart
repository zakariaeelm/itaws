import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../constant.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  // ignore: non_constant_identifier_names

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
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
                      'Notification',
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
                          padding: const EdgeInsets.all(20.0),
                          child: Text('Today',style: kTextStyle.copyWith(color: kTitleColor,fontSize: 20.0,fontWeight: FontWeight.bold),),
                        ),
                        Column(
                          children:[
                            SettingItemWidget(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              title: 'Theresa Webb',
                              subTitle: '5 min ago',
                              leading: Image.asset('images/round_logo.png', height: 50, width: 50, fit: BoxFit.cover).cornerRadiusWithClipRRect(25),
                              trailing: Container(
                                height: 10.0,
                                width: 10.0,
                                decoration: BoxDecoration(
                                  color: kMainColor,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              onTap: () {
                              },
                            ),
                            SettingItemWidget(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              title: 'Theresa Webb',
                              subTitle: '5 min ago',
                              leading: Image.asset('images/round_logo.png', height: 50, width: 50, fit: BoxFit.cover).cornerRadiusWithClipRRect(25),
                              trailing: Container(
                                height: 10.0,
                                width: 10.0,
                                decoration: BoxDecoration(
                                  color: kMainColor,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              onTap: () {
                              },
                            ),
                            SettingItemWidget(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              title: 'Theresa Webb',
                              subTitle: '5 min ago',
                              leading: Image.asset('images/round_logo.png', height: 50, width: 50, fit: BoxFit.cover).cornerRadiusWithClipRRect(25),
                              trailing: Container(
                                height: 10.0,
                                width: 10.0,
                                decoration: BoxDecoration(
                                  color: kMainColor,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              onTap: () {
                              },
                            ),
                            SettingItemWidget(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              title: 'Theresa Webb',
                              subTitle: '5 min ago',
                              leading: Image.asset('images/round_logo.png', height: 50, width: 50, fit: BoxFit.cover).cornerRadiusWithClipRRect(25),
                              trailing: Container(
                                height: 10.0,
                                width: 10.0,
                                decoration: BoxDecoration(
                                  color: kMainColor,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              onTap: () {
                              },
                            ),
                            SettingItemWidget(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              title: 'Theresa Webb',
                              subTitle: '5 min ago',
                              leading: Image.asset('images/round_logo.png', height: 50, width: 50, fit: BoxFit.cover).cornerRadiusWithClipRRect(25),
                              trailing: Container(
                                height: 10.0,
                                width: 10.0,
                                decoration: BoxDecoration(
                                  color: kMainColor,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              onTap: () {
                              },
                            ),
                            SettingItemWidget(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              title: 'Theresa Webb',
                              subTitle: '5 min ago',
                              leading: Image.asset('images/round_logo.png', height: 50, width: 50, fit: BoxFit.cover).cornerRadiusWithClipRRect(25),
                              trailing: Container(
                                height: 10.0,
                                width: 10.0,
                                decoration: BoxDecoration(
                                  color: kMainColor,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              onTap: () {
                              },
                            ),
                            SettingItemWidget(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              title: 'Theresa Webb',
                              subTitle: '5 min ago',
                              leading: Image.asset('images/round_logo.png', height: 50, width: 50, fit: BoxFit.cover).cornerRadiusWithClipRRect(25),
                              trailing: Container(
                                height: 10.0,
                                width: 10.0,
                                decoration: BoxDecoration(
                                  color: kMainColor,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              onTap: () {
                              },
                            ),
                          ],
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


