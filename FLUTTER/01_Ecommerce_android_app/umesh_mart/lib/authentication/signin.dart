import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:umesh_mart/authentication/authenticationscreen.dart';
import 'package:umesh_mart/authentication/checkboxgetx.dart';
import 'package:umesh_mart/common_widget/toast.dart';
import 'package:umesh_mart/firestore/authenticationscreen/datastore.dart';
import 'package:velocity_x/velocity_x.dart';
import '../common_widget/circularprogressind.dart';
import '../common_widget/commonbutton.dart';
import '../common_widget/commontextfield.dart';
import '../consts/consts.dart';
import '../consts/styles.dart';
import 'circular_pro_ind_getx.dart';
class Signupscreen extends StatefulWidget {
  const Signupscreen({Key? key}) : super(key: key);

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  @override
  Widget build(BuildContext context) {
    var shortestval=MediaQuery.of(context).size.shortestSide;
    var widthval=MediaQuery.of(context).size.width;
    var heightval=MediaQuery.of(context).size.height;
    var namecont_sign_scrn=TextEditingController();
    var emailcont_signin_scrn=TextEditingController();
    var passwordcont_signin_scrn=TextEditingController();
    var addresscont_signin_scrn=TextEditingController();
    var isloading_cont=Get.put(Isloading());
    var checkboxcont=Get.put(Checkboxval());
    return Scaffold(
      appBar: AppBar(
        title: Text("Signin form screen"),
      ),
      body: Container(
        width: widthval,
        height: heightval,
        color: Colors.red,
        child: Column(
          children: [

            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection:Axis.vertical,
                  child:
                  Container(
                    padding: EdgeInsets.all(10),
                    width: 350,
                    height: 580,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Commontextfield("Name","Xxxxx Xxxxx", false, namecont_sign_scrn, context),
                        (5).heightBox,
                        Commontextfield("Email","abcd123@gmail.com",false, emailcont_signin_scrn, context),
                        (5).heightBox,
                        "Enter password".text.color(CupertinoColors.black).fontFamily(bold).size(25).make(),
                        Container(
                          height:heightval*0.09,
                          child:
                          TextFormField(
                            controller: passwordcont_signin_scrn,
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


                        // Commontextfield("Password", "Xxx123@", true, passwordcont_signin_scrn, context),


                        (5).heightBox,
                        Commontextfield("Address","Kathmandu,putalisadak-11", false, addresscont_signin_scrn, context),
                        (5).heightBox,
                        Obx(() =>
                        Row(
                          children: [
                            Checkbox(
                              value:checkboxcont.ischeck.value ,
                              onChanged: (value) {
                                checkboxcont.changecbval(value);
                              },
                            ),
                            Text("I agree all the terms and condition",
                              style:TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                                fontFamily: semibold,
                              ) ,)

                          ],
                        )
                        ),
                        10.heightBox,

                        Obx(
                          ()=> Container(
                            width: double.infinity,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: isloading_cont.isloading.value==true?
                              Circularproind(context):
                              Align(
                                alignment: Alignment.center,
                                child: Commonbutton("Signin",()async {
                                  isloading_cont.isloading.value=true;
                                  if(namecont_sign_scrn.text.toString().isEmpty ||
                                      emailcont_signin_scrn.text.toString().isEmpty ||
                                      passwordcont_signin_scrn.text.toString().isEmpty ||
                                      addresscont_signin_scrn.text.toString().isEmpty)
                                  {
                                    isloading_cont.isloading.value=false;
                                    Toastget().Toastmsg("Signin failed\nPlease fill all the field properly");
                                    //VxToast.show(context, msg: "Signin failed\nPlease fill all the field properly");
                                  }
                                  else if (checkboxcont.ischeck.value==false){
                                    isloading_cont.isloading.value=false;
                                    Toastget().Toastmsg("Signin failed\nPlease agree terms and condition");
                                  }
                                  else{

                                    try {
                                      print("before user creation");
                                      await auth.createUserWithEmailAndPassword(
                                        email: emailcont_signin_scrn.text.toString(),
                                        password: passwordcont_signin_scrn.text
                                            .toString(),
                                      ).then((value) {
                                        print("storing data initialized");
                                        Userdata().user_signup_data(
                                          namecont_sign_scrn.text.toString(),
                                          emailcont_signin_scrn.text.toString(),
                                          addresscont_signin_scrn.text.toString(),
                                        );
                                        print("data store succesful");
                                      }).then((value) {
                                        print("created");
                                        isloading_cont.isloading.value = false;
                                        Toastget().Toastmsg("Sign up successful");
                                        namecont_sign_scrn.clear();
                                        emailcont_signin_scrn.clear();
                                        passwordcont_signin_scrn.clear();
                                        addresscont_signin_scrn.clear();
                                        Navigator.pushReplacement(context,
                                            MaterialPageRoute(builder: (context) {
                                              return Authenticationscreen();
                                            },));
                                      }
                                      )
                                          .onError((error, stackTrace) {
                                        print("failed");
                                        isloading_cont.isloading.value = false;
                                        Toastget().Toastmsg(
                                            "Signin failed \n" + error.toString());
                                      }
                                      );
                                    }catch(o){
                                      Toastget().Toastmsg("${o.toString()}");
                                    }





                                  }
                                },context),
                              ),
                            ),
                          ),
                        )



                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  // rupak123@gmail.com
}
