import 'package:ecommerce_1/consts/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget Homebutton(String title,icon,height,width,onpress){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(icon),
      10.heightBox,
      title.text.black.fontFamily(semibold).make(),
    ],
  ).box.rounded.color(Colors.grey).shadowSm.size(width, height).make();
}