import 'dart:async';
import 'package:ecommerce_1/consts/consts.dart';
import 'package:ecommerce_1/consts/firebaseconst.dart';
import 'package:ecommerce_1/views/auth_screen/loginscreen.dart';
import 'package:ecommerce_1/views/homescreen/home.dart';
import 'package:ecommerce_1/widgets_common/applogo_widget.dart';
import 'package:flutter/material.dart';
import '../../consts/colors.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  changeScreen()
  {
    Timer(Duration(
      seconds: 1,
    ),() {
      Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) {
        return currentUser==null?LoginScreen():Home();
      },
      )
      );
    },
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    changeScreen();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redColor,
      body: Center(
        child: Column(
          children: [
           Align(
               alignment: Alignment.topLeft,
               child: Image.asset(icSplashBg,width: 300,)
           ),
            20.heightBox,
            applogoWidget(),
            10.heightBox,
            appname.text.fontFamily(bold).size(22).white.make(),
          5.heightBox,
            appversion.text.white.make(),
            Spacer(),
            credits.text.white.fontFamily(semibold).make(),
            30.heightBox,
          ],
        ),
      ),
    );
  }
}
