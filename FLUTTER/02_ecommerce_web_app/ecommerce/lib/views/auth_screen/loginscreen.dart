import 'package:ecommerce_1/consts/consts.dart';
import 'package:ecommerce_1/consts/lists.dart';
import 'package:ecommerce_1/views/auth_screen/signup.dart';
import 'package:ecommerce_1/views/homescreen/home.dart';
import 'package:ecommerce_1/widgets_common/applogo_widget.dart';
import 'package:ecommerce_1/widgets_common/bg_widget.dart';
import 'package:ecommerce_1/widgets_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../controller/auth_controller.dart';
import '../../widgets_common/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailcontroller=TextEditingController();
  var passwordcontroller=TextEditingController();
  final controller=Get.put(Authcontroller());
  @override
  Widget build(BuildContext context) {
    final widthval=MediaQuery.of(context).size.width;
    final heightval=MediaQuery.of(context).size.height;
    return
      Scaffold(
        appBar: AppBar(
            title: Text("login screen"),
        ),
        body: Center(
          child: Column(
              children: [
                (context.screenHeight*0.1).heightBox,
                applogoWidget(),
                10.heightBox,
                "Log in to ${appname}".text.fontFamily(bold).size(18).make(),
                10.heightBox,
                Column(
                  children: [
                    custom_textfield(email,emailhint,emailcontroller,false),
                    custom_textfield(password,passwordhint,passwordcontroller,true),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(onPressed: ()
                      {

                      }, child:Text("${forgetpassword}")),
                    ),
                    5.heightBox,
                    Obx(
                        ()=>
                      Container(
                          width: double.infinity,
                          height: widthval*0.05,
                          color: Colors.red,
                          child:
                          Center(
                            child: controller.isloading.value?CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(
                                Colors.red,
                              ),
                            ):
                            ourbutton( redColor,whiteColor,"Login",()
                            async
                            {
                              if(emailcontroller.text.toString().isEmpty || passwordcontroller.text.toString().isEmpty){
                                VxToast.show(context,
                                    msg: "fill the datat properly and try agaian");
                              }
                              else{
                                await controller.loading(true);
                                await controller.loginmethod(
                                    emailcontroller.text.toString(),
                                    passwordcontroller.text.toString(),
                                    context)
                                    .then((value)
                                {
                                  controller.loading(false);
                                  VxToast.show(context,
                                      msg: loggedin);
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                        return Home();
                                      },) );
                                }
                                ).onError((error, stackTrace)
                                {
                                  controller.loading(false);
                                  VxToast.show(context,
                                      msg: loggedout);
                                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) {
                                    return LoginScreen();
                                  },));
                                }
                                );

                              }
                            },widthval
                            ),
                          )
                      ),
                    ),
                    5.heightBox,
                    createnewaccount.text.color(Colors.grey).make(),
                    5.heightBox,
                    Container(
                        width: double.infinity,
                        child: ourbutton(Colors.orange,Colors.white,"Sign Up",()
                        {
                         Navigator.push(context, MaterialPageRoute(builder:(context) =>
                             Signupscreen(),
                           ));
                        },widthval
                        )
                    ),
                    10.heightBox,
                    loginwith.text.color(Colors.black).fontFamily(bold).make(),
                    5.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          child: Image.asset(sociallogo[0]),
                        ),
                        Container(width: 10,),
                        CircleAvatar(
                          child: Image.asset(sociallogo[1]),
                        ),
                        Container(width: 10,),
                        CircleAvatar(
                          child: Image.asset(sociallogo[2]),
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
  //manoj123@gmail.com
}
