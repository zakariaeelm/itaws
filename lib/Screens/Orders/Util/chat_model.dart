import 'package:flutter/material.dart';
class RiderModel {
  String? title;
  String? subTitle;
  String? image;
  IconData? icon;
  bool? isCheckList;
  Color? color;

  RiderModel({this.title, this.subTitle, this.image, this.color, this.isCheckList = false, this.icon});
}

class RiderInboxData {
  int? id;
  String? message;

  RiderInboxData({this.id, this.message});
}