import 'package:ecommerce_1/consts/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget Featuredbutton(BuildContext context,String title,icon){
  return Row(
    children: [
      Container(
          child: Image.asset(
            icon,
            width:MediaQuery.of(context).size.width*0.15,
            height: MediaQuery.of(context).size.width*0.06,
            fit: BoxFit.fill,)),
      Container(
          width:MediaQuery.of(context).size.width*0.15,
          height: MediaQuery.of(context).size.width*0.06,
          child: Align(
              alignment: Alignment.center,
              child: title.text.fontFamily(semibold).color(Colors.black).make())),
    ],
  ).box.white.margin(EdgeInsets.symmetric(horizontal: 4)).padding(EdgeInsets.all(4)).make();
}