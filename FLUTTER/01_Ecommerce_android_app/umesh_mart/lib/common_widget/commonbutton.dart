import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
Widget Commonbutton(String tittle,onpress_fn,context){
  var sizeval=MediaQuery.of(context).size.shortestSide;
  var widthval=MediaQuery.of(context).size.width;
  return
    ElevatedButton(
      style:ElevatedButton.styleFrom(
        primary: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(sizeval*0.03)
        )
      ),
      onPressed:onpress_fn,
      child: Text("${tittle}",style: TextStyle(
        color: CupertinoColors.black,
        fontSize:20,
      ),
      textAlign:TextAlign.center,
      )
  );
}
