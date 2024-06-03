import 'package:ecommerce_1/consts/consts.dart';
import 'package:ecommerce_1/consts/lists.dart';
import 'package:ecommerce_1/views/categoryscreen/categorydetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Categoryscreen extends StatefulWidget {
  const Categoryscreen({Key? key}) : super(key: key);

  @override
  State<Categoryscreen> createState() => _CategoryscreenState();
}

class _CategoryscreenState extends State<Categoryscreen> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: Text("Category SCREEN"),
        ),
        body: Container(
          padding: EdgeInsets.all(12),
          child: GridView.builder(
            itemCount: 9,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisExtent: 200,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
              itemBuilder:(context, index) =>
             Column(
               children: [
                 Image.asset(
                     categoriesimages[index],
                   width: 200,
                   height: 120,
                   fit: BoxFit.fill,
                 ),
                 10.heightBox,
                 categorieslist[index].text.color(darkFontGrey).align(TextAlign.center).make(),
               ],
             ).box.white.rounded.clip(Clip.antiAlias).outerShadowSm.make().onTap(() {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Categorydetails(title: categorieslist[index]);
              },));
             })
            ,),
        ),
      );
  }
}
