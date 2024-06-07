import 'dart:io';
import 'package:ecommerce_1/consts/consts.dart';
import 'package:ecommerce_1/views/account%20screen/profilepicturegetx.dart';
import 'package:ecommerce_1/widgets_common/custom_textfield.dart';
import 'package:ecommerce_1/widgets_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../consts/images.dart';

class Editprofile extends StatefulWidget{
  const Editprofile({Key? key}) : super(key: key);

  @override
  State<Editprofile> createState() => _EditprofileState();
}
class _EditprofileState extends State<Editprofile> {
  final epsnamecontroller = TextEditingController();
  final epspasswordcontroller = TextEditingController();
  final changeprofilecontroller=Get.put(profilechange());
  @override
  Widget build(BuildContext context) {
    final widthval=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("edit profile screen"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: AlwaysScrollableScrollPhysics(),
        child: Container(
          width: widthval,
          color: Colors.grey,
          height: 1000,
          child: Column(
            children: [
              Obx(
              ()=> Container(
                width: widthval,
                  // height: widthval*0.60,
                  color: Colors.blue,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      changeprofilecontroller.imagepath.value.isEmpty?
                      Image.asset(imgProfile2,
                        fit:BoxFit.cover,
                        width:(widthval*(100/1920)),
                      ).box.roundedFull.clip(Clip.antiAlias).make()
                        :
                      CircleAvatar(
                      radius: 100,
                    backgroundImage:
                    FileImage(File(changeprofilecontroller.imagepath.value) ),
                      ),
                      ourbutton(Colors.red, Colors.white, "Change photo",
                              (){
                                changeprofilecontroller.changeimage(context);
                              }, widthval),
                    ],
                  ),
                ),
              ),

              custom_textfield("Name","Ram", epsnamecontroller,false),
              custom_textfield("Password","Abcd123@",epspasswordcontroller,true),
              (widthval*0.03).heightBox,
              Container(
                  color: Colors.red,
                  width: widthval,
                  child:
                  Align(
                      alignment: Alignment.center,
                      child: ourbutton(Colors.red, Colors.white, "save", (){}, widthval))),
            ],
          ),
        ),
      ),
    );
  }
}
