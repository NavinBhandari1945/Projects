import 'package:ecommerce_1/consts/consts.dart';
import 'package:ecommerce_1/consts/firebaseconst.dart';
import 'package:ecommerce_1/controller/auth_controller.dart';
import 'package:ecommerce_1/views/auth_screen/checkboxgetx.dart';
import 'package:ecommerce_1/views/auth_screen/loginscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../widgets_common/applogo_widget.dart';
import '../../widgets_common/bg_widget.dart';
import '../../widgets_common/custom_textfield.dart';
import '../../widgets_common/our_button.dart';
import '../homescreen/home.dart';
class Signupscreen extends StatefulWidget {
  const Signupscreen({Key? key}) : super(key: key);
  @override
  State<Signupscreen> createState() => _SignupscreenState();
}
class _SignupscreenState extends State<Signupscreen> {
  var controller=Get.put(Authcontroller());
  var namecontroller=TextEditingController();
  var emailcontroller=TextEditingController();
  var passwordcontroller=TextEditingController();
  var passwordRetypeController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final widthval=MediaQuery.of(context).size.width;
    return
        Scaffold(
          appBar: AppBar(
            title: Text("signup screen"),
          ),
          body: Center(
            child: Column(
              children: [
                (context.screenHeight*0.1).heightBox,
                applogoWidget(),
                10.heightBox,
                "Join to ${appname}".text.fontFamily(bold).size(18).make(),
                10.heightBox,
                Column(
                  children: [
                    custom_textfield(name,namehint,namecontroller,false),
                    custom_textfield(email,emailhint,emailcontroller,false),
                    custom_textfield(password,passwordhint,passwordcontroller,true),
                    custom_textfield(retypepassword,passwordhint,passwordRetypeController,true),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(onPressed: ()
                      {

                      }, child:Text("${forgetpassword}")),
                    ),
                    5.heightBox,
                  Row(
                    children: [
                      Obx(
                      () {
                           return Checkbox(
                              checkColor: Colors.black,
                              value: checkboxvalue.ischeck.value,
                              onChanged: (newvalue) {
                                checkboxvalue.checkvalue(newvalue);
                              },
                            );
                          }
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("${privacypolicy}"),
                    ],
                  ),
                    5.heightBox,
                    Obx(
                        () {
                        return  Container(
                              width: double.infinity,
                              child:
                              ourbutton (
                                    checkboxvalue.ischeck.value == true ? Colors
                                        .green : Colors.red, whiteColor,
                                    "Sign Up",
                                        () async {
                                      if(checkboxvalue.ischeck.value!=false){
                                        try
                                        {
                                          await controller.Signupmethod(
                                              emailcontroller.text.toString(),
                                              passwordcontroller.text.toString(),
                                              context).then((value) {
                                                return
                                            controller.storedata(
                                              namecontroller.text.toString(),
                                              passwordcontroller.text
                                                  .toString(),
                                              emailcontroller.text.toString(),
                                              currentUser!.uid.toString(),
                                            );
                                          }
                                          ).then((value) {
                                            VxToast.show(context,
                                                msg: signedin);
                                            Navigator.pushReplacement(context,
                                                MaterialPageRoute(
                                                  builder: (context) {
                                                    return const LoginScreen();
                                                  },));
                                          }
                                          ).onError
                                            ((error, stackTrace) {
                                            VxToast.show(context, msg: signedout);
                                            VxToast.show(context,
                                                msg: error.toString());
                                          }
                                          );
                                        }
                                            catch(e)
                                            {
                                              VxToast.show(context,
                                                  msg: e.toString());
                                            }
                                      }
                                },widthval),
                          );
                        }
                    ),
                    5.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${alreadyhaveanaccount},"),
                        TextButton(onPressed: () {
                          Get.to(LoginScreen());
                        },
                          child: Text("Log in",
                            style: TextStyle(color: Colors.red,fontFamily: bold,fontSize: 20),
                          ),
                        )
                      ],
                    )
                  ],
                ).box.white.rounded.padding(const EdgeInsets.all(16)).width(context.screenWidth-70).make(),
              ],
            ),
          ),
        );

  }
  Checkboxvalue checkboxvalue=Get.put(Checkboxvalue());
  //rocky123@gmail.com
//ram123@gmail.com
//manoj123@gmail.com

}
