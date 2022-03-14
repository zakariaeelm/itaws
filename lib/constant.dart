import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// const kMainColor = Color(0xFF3F8CFF);
const kMainColor = Color(0xFFF88808);
const kSecondaryColor = Color(0xFFFFEAD1);
const kGreyTextColor = Color(0xFF707070);
const kBorderColorTextField = Color(0xFFC2C2C2);
const kDarkWhite = Color(0xFFF1F7F7);
const kTitleColor = Color(0xFF333333);
final kTextStyle = GoogleFonts.montserrat(
  color: Colors.white,
);
const kButtonDecoration = BoxDecoration(
  color: kMainColor,
  borderRadius: BorderRadius.all(
    Radius.circular(40.0),
  ),
);

const kInputDecoration = InputDecoration(
  hintStyle: TextStyle(color: kBorderColorTextField),
  filled: true,
  fillColor: Colors.white70,
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
    borderSide: BorderSide(color: kBorderColorTextField, width: 2),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(6.0)),
    borderSide: BorderSide(color: kBorderColorTextField, width: 2),
  ),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: const BorderSide(color: kBorderColorTextField),
  );
}
final otpInputDecoration = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

List<String> genderList = [
  'Male',
  'Female'
];
List<String> tableList = [
  'Table 1',
  'Table 2',
  'Table 3',
  'Table 4',
  'Table 5',
  'Table 6'
];

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

