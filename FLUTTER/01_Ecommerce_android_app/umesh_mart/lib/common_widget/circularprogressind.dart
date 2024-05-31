import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget Circularproind(context){
  var sizeval=MediaQuery.of(context).size.shortestSide;
  var widthval=MediaQuery.of(context).size.width;
  return Container(
    width:widthval*0.06 ,
    height: sizeval*0.06,
    decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(sizeval*0.05),
    ),
    child: Center(
      child:CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(
          Colors.white,
        ),
      )
    ),

  );
}