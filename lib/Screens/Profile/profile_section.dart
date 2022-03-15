import 'package:flutter/material.dart';

import '../../constant.dart';

class ProfileSection extends StatelessWidget {
  final IconData iconSection;
  final String text;
  final VoidCallback onTap;

  const ProfileSection(
      {Key? key, required this.iconSection, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
        ),
        child: ListTile(
          onTap: onTap,
          leading: CircleAvatar(
            backgroundColor: const Color(0xFFF5F5F5),
            child: Icon(
              iconSection,
              color: kMainColor,
            ),
          ),
          title: Text(
            text,
            style: kTextStyle.copyWith(color: kGreyTextColor),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: kGreyTextColor,
          ),
        ),
      ),
    );
  }
}
