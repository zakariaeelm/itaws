import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../constant.dart';

class NotificationWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final String imageUrl;
  final VoidCallback onTap;

  const NotificationWidget({Key? key, required this.title, required this.subTitle, required this.imageUrl, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SettingItemWidget(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      title: title,
      subTitle: subTitle,
      leading: Image.asset(imageUrl, height: 50, width: 50, fit: BoxFit.cover).cornerRadiusWithClipRRect(25),
      trailing: Container(
        height: 10.0,
        width: 10.0,
        decoration: BoxDecoration(
          color: kMainColor,
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      onTap: onTap,
    );
  }
}
