import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:umesh_mart/authentication/authenticationscreen.dart';
import 'package:umesh_mart/common_widget/commonbutton.dart';
import 'package:umesh_mart/common_widget/commontextfield.dart';
import 'package:umesh_mart/common_widget/toast.dart';
import 'package:velocity_x/velocity_x.dart';

import '../consts/consts.dart';

class Change_pwd_screen extends StatefulWidget {
  const Change_pwd_screen({Key? key}) : super(key: key);

  @override
  State<Change_pwd_screen> createState() => _Change_pwd_screenState();
}

class _Change_pwd_screenState extends State<Change_pwd_screen> {
  final email_send_cont=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var widthval=MediaQuery.of(context).size.width;
    var heightval=MediaQuery.of(context).size.height;
    var shortestval=MediaQuery.of(context).size.shortestSide;
    return Scaffold(
      appBar: AppBar(
        title: Text("Change password screen"),
      ),
      body: Container(
        width:widthval ,
        height: heightval,
        color: Colors.red,
        child: Column(
          children: [

            Commontextfield("Enter email","xxxxx@gmail.com", false, email_send_cont, context),

              (shortestval*0.01).heightBox,

            Commonbutton("Send", (){
              try{
                auth.sendPasswordResetEmail(email: email_send_cont.text).
              then((value) {
                  Toastget().Toastmsg("Password change link was sent to your email.Go and check email");
                }).
              then((value) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder:(context) {
                      return Authenticationscreen();
                    },
                    )
                );
                }).onError((error, stackTrace) {
                  Toastget().Toastmsg("Link was not send to your email\n"
                      "${error.toString()}");
                });
              }catch(o){
                Toastget().Toastmsg("Link was not send to your email\n"
                    "${o.toString()}");
              }
            },
                context)

          ],
        ),
      ),

    );
  }
}
