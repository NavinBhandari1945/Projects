import 'package:ecommerce_1/consts/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../consts/strings.dart';

Widget ourbutton(color,textcolor,String? title,onpress,final widthval)
{

  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: color,
        padding: EdgeInsets.all(12),
      ),
      onPressed:onpress,
      child:title!.text.color(textcolor).fontFamily(bold).size(widthval*(30/1920)).make());
}