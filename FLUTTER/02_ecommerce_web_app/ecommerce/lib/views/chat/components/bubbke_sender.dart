import 'package:ecommerce_1/consts/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
Widget Bubble(){
  return  Container(
    margin: EdgeInsets.only(bottom: 5.0),
    padding: EdgeInsets.all(10.0),
    decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(5.0))
    ),
    child: Column(
      children: [
        "message here".text.size(20).color(Colors.black).make(),
        10.heightBox,
        "11:45 pm".text.size(20).color(Colors.black).make(),
      ],
    ),
  );
}