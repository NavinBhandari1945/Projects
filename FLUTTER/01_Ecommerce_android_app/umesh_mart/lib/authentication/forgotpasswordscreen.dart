import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:umesh_mart/authentication/forget_reset_password.dart';
import 'package:velocity_x/velocity_x.dart';
import '../common_widget/commonbutton.dart';
import '../common_widget/commontextfield.dart';
import '../consts/consts.dart';
class Forgetpwdscrn extends StatefulWidget {
  const Forgetpwdscrn({Key? key}) : super(key: key);
  @override
  State<Forgetpwdscrn> createState() => _ForgetpwdscrnState();
}
class _ForgetpwdscrnState extends State<Forgetpwdscrn> {
  @override
  Widget build(BuildContext context) {
    var widthval=MediaQuery.of(context).size.width;
    var heightval=MediaQuery.of(context).size.height;
    var sizeval=MediaQuery.of(context).size.shortestSide;
    var emailcont_forgetpwd_scrn=TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot password screen"),
      ),
      body: Container(
        width: widthval,
        height: heightval,
        color: Colors.black,
        child:
        Center(
          child: Container(
            width: 300,
            height: 250,
            padding: EdgeInsets.all(10),
            decoration:BoxDecoration (
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: 
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Commontextfield('Email', "Enter your email", false, emailcont_forgetpwd_scrn, context),
                (sizeval*0.03).heightBox,
                Container(
                  width:double.infinity,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(sizeval*0.10),
                    color: Colors.blue,
                  ),
                  child: Commonbutton("Forget", (){
                    Resetpassword().Sendlink(emailcont_forgetpwd_scrn.text);
                  },
                    context
                  ),
                )
              ],
            ),
          ),
        ),

      ),

    );
  }
}
