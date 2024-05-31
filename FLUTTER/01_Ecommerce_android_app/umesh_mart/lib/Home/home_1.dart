import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:umesh_mart/Home/home_2.dart';
import 'package:umesh_mart/cart/cartscreen.dart';
import 'package:umesh_mart/product/productscreen.dart';
import '../consts/consts.dart';
import '../consts/styles.dart';
import '../profile/Profilescreen_2.dart';
import 'home_1_getx.dart';
class Home_1 extends StatefulWidget {
  const Home_1({Key? key}) : super(key: key);

  @override
  State<Home_1> createState() => _Home_1State();
}

class _Home_1State extends State<Home_1> {
  final home_1_getxcont=Get.put(Home_1_getx());
  var navbaritem=[
    BottomNavigationBarItem(
      icon:Image.asset(
        iconHome,
        width:26,
      ),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon:Image.asset(iconProduct,width:26,) ,
      label: "Products",
    ),
    BottomNavigationBarItem(
      icon:Image.asset(iconCart,width:26,) ,
      label: "Cart",
    ),
    BottomNavigationBarItem(
      icon:Image.asset(iconProfile,width:26,) ,
      label: "Profile",
    ),
  ];
  var navbody=[
    Home2screen(),
    Productscreen(),
    Cartscreen(),
    Profilescreen(),
  ];
  @override
  Widget build(BuildContext context) {
    var devwidth=MediaQuery.of(context).size.width;
    var devheight=MediaQuery.of(context).size.height;
    var devshortside=MediaQuery.of(context).size.shortestSide;
    return Scaffold(
      body:
          Obx(
              ()=>Container(
              child: navbody.elementAt(home_1_getxcont.currentIndexVal.value),
            ),
          ),
      bottomNavigationBar:
      Obx(
        ()=>BottomNavigationBar(
          items:navbaritem,
          currentIndex:home_1_getxcont.currentIndexVal.value,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.red,
          selectedLabelStyle: TextStyle(fontFamily: semibold),
          onTap: (value){
            home_1_getxcont.changeindexval(value);
          },
        ),
      )
    );
  }
}
