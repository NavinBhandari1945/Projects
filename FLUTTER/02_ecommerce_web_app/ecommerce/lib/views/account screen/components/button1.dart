import 'package:ecommerce_1/consts/consts.dart';
import 'package:flutter/cupertino.dart';

Widget button1(final widthval,final shortestval,final heightval,String title,String count){
  return Container(
    padding: EdgeInsets.all(shortestval*0.03),
    color:Vx.black,
    width: widthval*0.3,
    // height: heightval*((100/1920)+0.009),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        count.text.fontFamily(semibold).white.size(shortestval*(60/1920)).make(),
        Container(
          height:   (heightval*(20/1920)),
        ),
        title.text.fontFamily(semibold).white.size(shortestval*(60/1920)).make(),
      ],
    ),
  );
}