import 'package:ecommerce_1/consts/colors.dart';
import 'package:ecommerce_1/consts/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget custom_textfield(String? title,String hint,controller,ispass){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
       title!.text.color(redColor).fontFamily(semibold).size(16).make(),
      5.heightBox,
      TextFormField(
        obscureText: ispass,
        controller: controller,
        decoration: InputDecoration(
          hintText:hint,
          hintStyle: TextStyle(
            color: fontGrey,
            fontFamily: semibold,
          ),
          isDense: true,
          fillColor: lightGrey,
          filled: true,
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: redColor),
          )

        ),
      ),
      5.heightBox,

    ],
  );
}