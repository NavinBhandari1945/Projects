import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:umesh_mart/Home/home_1.dart';
import 'package:umesh_mart/Home/home_2.dart';
import 'package:umesh_mart/authentication/signin.dart';
import 'package:umesh_mart/common_widget/toast.dart';
import 'package:velocity_x/velocity_x.dart';
import '../common_widget/circularprogressind.dart';
import '../common_widget/commonbutton.dart';
import '../common_widget/commontextfield.dart';
import '../consts/consts.dart';
import '../consts/styles.dart';
import 'circular_pro_ind_getx.dart';
import 'forgotpasswordscreen.dart';

class Authenticationscreen extends StatefulWidget {
  const Authenticationscreen({Key? key}) : super(key: key);
  @override
  State<Authenticationscreen> createState() => _AuthenticationscreenState();
}
class _AuthenticationscreenState extends State<Authenticationscreen> {
  @override
  Widget build(BuildContext context) {
    var shortestval=MediaQuery.of(context).size.shortestSide;
    var widthval=MediaQuery.of(context).size.width;
    var heightval=MediaQuery.of(context).size.height;
    var sizeval=MediaQuery.of(context).size.shortestSide;
    var emailcontrollerval_auth_screen=TextEditingController();
    var passwordcont_auth_scr=TextEditingController();
    var isloading_cont=Get.put(Isloading());
    return Scaffold(
      appBar: AppBar(
        title: Text("Authentication screen"),
      ),
      body:
      Container(
        width:widthval,
        height:heightval,
        color: Colors.red,
        child:Center(
          child: Container(
            width: 350,
            height: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white
            ),
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Commontextfield("Email","abcd123@gmail.com",false, emailcontrollerval_auth_screen, context),
                (5).heightBox,
                "Enter password".text.color(CupertinoColors.black).fontFamily(bold).size(25).make(),
                Container(
                  height:heightval*0.08,
                  child:
                  TextFormField(
                    controller: passwordcont_auth_scr,
                    obscureText:true,
                    style: TextStyle(fontSize: shortestval*0.07),
                    decoration: InputDecoration (
                        contentPadding: EdgeInsets.symmetric(vertical:shortestval*0.03, horizontal:shortestval*0.03),
                        hintText: "xxxxx",
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: shortestval*0.07,
                          fontFamily: semibold,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: CupertinoColors.black,
                            width: shortestval*0.006,
                          ),
                          borderRadius: BorderRadius.circular(shortestval*0.04),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(shortestval*0.04),
                          borderSide: BorderSide(
                            color: CupertinoColors.black,
                            width: shortestval*0.006,
                          ),
                        )
                    ),
                  ),
                ),

                // Commontextfield("Password", "Xxx123@", true, passwordcont_auth_scr, context),
                (10).heightBox,
                Obx(
                  ()=> Container(
                    width: double.infinity,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                    ),
                    child: isloading_cont.isloading.value==true?
                        Circularproind(context):
                    Align(
                      alignment: Alignment.center,
                      child: Commonbutton("Login ",
                              ()async {
                        //login method real
                        isloading_cont.isloading.value=true;
                        if(emailcontrollerval_auth_screen.text.toString().isEmpty || passwordcont_auth_scr.text.toString().isEmpty){
                          isloading_cont.isloading.value=false;
                          VxToast.show(context, msg: "Login failed\nPlease fill all the field properly");
                        }
                        else{


                       try {
                         isloading_cont.isloading.value = true;
                         await auth.signInWithEmailAndPassword(
                             email: emailcontrollerval_auth_screen.text.toString(),
                             password: passwordcont_auth_scr.text.toString())
                             .then((value) {
                           // isloading_cont.isloading.value == false;
                           // VxToast.show(context, msg: "Login Successful");
                           Toastget().Toastmsg( "Login Successful");
                           isloading_cont.isloading.value = false;
                           Navigator.pushReplacement(context,
                               MaterialPageRoute(builder:(context) {
                                 return Home_1();
                               },
                               )
                               );
                         }
                         )
                             .onError((error, stackTrace) {
                           isloading_cont.isloading.value = false;
                           // VxToast.show(context,
                           //     msg: "Login failed\n" + error.toString());
                            Toastget().Toastmsg("Login failed\n" + error.toString());
                         }
                         );
                       }catch(o){
                         isloading_cont.isloading.value = false;
                         Toastget().Toastmsg("${o.toString()}");
                       }
                        }

                          // fake login method
                          // Navigator.pushReplacement(context,
                          //     MaterialPageRoute(builder: (context) {
                          //       return Home_1();
                          //     },));



                      },context
                      ),
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(onPressed:(){
                    Navigator.push(context, MaterialPageRoute(
                        builder:(context) {
                          return Forgetpwdscrn();
                        }, )
                    );
                  },
                      child:Text("Forgot password",style: TextStyle(fontSize: 20),),
                ),
                ),
                Container(
                  width: double.infinity,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Commonbutton("Signup",(){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Signupscreen(),));
                    },context),
                  ),
                ),
                (sizeval*0.03).heightBox,
                Text("Don't have an account Signup",
                  style: TextStyle(color: Colors.black,fontSize:20,fontFamily: bold),
                )

              ],
            ),
          ),
        ),
      ),

    );
  }
}
