import 'package:ecommerce_1/consts/consts.dart';
import 'package:ecommerce_1/views/account%20screen/profilescreen.dart';
import 'package:ecommerce_1/views/cartscreen/cartscreen.dart';
import 'package:ecommerce_1/views/categoryscreen/categoryscreen.dart';
import 'package:ecommerce_1/views/homescreen/homegetx.dart';
import 'package:ecommerce_1/views/homescreen/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:

      Column(
         children: [
          Obx(
          ()=> Expanded(
                child:navbody.elementAt(homescreengetx.currentnavindex.value),
            ),
          ),
        ],
      ),

      bottomNavigationBar:
      Obx(
        ()=> BottomNavigationBar(
          currentIndex: homescreengetx.currentnavindex.value,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.red,
          selectedLabelStyle: TextStyle(fontFamily: semibold),
          items:navbaritem,
          onTap: (value)
          {
          homescreengetx.currentnavindexvalue(value);
          },
        ),
      ),

    );
  }
  
  var navbody=[
   Homescreen(),
    Cartscreen(),
    Categoryscreen(),
    Profilescreen(),
  ];
  
  var navbaritem=[
    BottomNavigationBarItem(
      icon:Image.asset(icHome,width: 26),
      label: home
    ),
    BottomNavigationBarItem(
        icon:Image.asset(icCart,width: 26),
        label: cart
    ),
    BottomNavigationBarItem(
        icon:Image.asset(icCategories,width: 26),
        label: categories
    ),
    BottomNavigationBarItem(
        icon:Image.asset(icProfile,width: 26),
        label: account
    ),
  ];
  Homescreengetx homescreengetx=Get.put(Homescreengetx());
}
