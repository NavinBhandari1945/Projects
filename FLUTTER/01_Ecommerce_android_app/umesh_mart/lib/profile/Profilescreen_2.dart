import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:umesh_mart/Home/changenamescreen.dart';
import 'package:umesh_mart/admin/admin_service.dart';
import 'package:umesh_mart/common_widget/toast.dart';
import 'package:umesh_mart/consts/consts.dart';
import 'package:umesh_mart/profile/admin_user.dart';
import 'package:umesh_mart/profile/changepasswordscreen.dart';
import 'package:umesh_mart/profile/user_order_details_screen.dart';
import 'package:umesh_mart/profile/users_get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../authentication/authenticationscreen.dart';
import '../consts/styles.dart';
import 'change_photo_getx.dart';
import 'fs_user_p_i.dart';
import 'fstore_save_method.dart';

// 1 user
// anjan123@gmail.com
// anjan123

class Profilescreen extends StatefulWidget {
  const Profilescreen({Key? key}) : super(key: key);

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  final changeimcont=Get.put(Changephoto());
  final u_p_i_cont=Get.put(U_p_i());
  
  @override
  Widget build(BuildContext context) {
    var widthval=MediaQuery.of(context).size.width;
    var heightval=MediaQuery.of(context).size.height;
    var shortestval=MediaQuery.of(context).size.shortestSide;
    return Scaffold (
      appBar: AppBar(
        title: Text("profilescreen"),
      ),
      body:
              Container (
                width:widthval,
                height: heightval,
                color: Colors.green,
                child:
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [

                      (shortestval*0.01).heightBox,

                      StreamBuilder (
                        stream: user_details().getUser(current_u!.uid),
                        builder: (context,AsyncSnapshot<QuerySnapshot> snapshot) {
                        if(!snapshot.hasData)
                        {
                          return Center(
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(
                                Colors.red,
                              ),
                            ),
                          );
                        }else{
                          var data=snapshot.data!.docs[0];
                          return    Container (
                                    width: widthval*0.603,
                                    height: heightval*0.303,
                                    decoration: BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                    ),
                                    child:
                                    ClipOval(
                                    child: data["image_url"]==""?
                                    Image.asset(
                                    u_p_p_3,
                                    fit: BoxFit.fill,
                                    ):
                                    Image.network(
                                    data["image_url"],
                                    fit: BoxFit.fill,
                                    ),
                                    )
                                    ,
                                    );
                          }
                        },
                      ),

                      (shortestval*0.01).heightBox,

                      Container(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(shortestval*0.03), // Border radius here
                            ),
                          ),
                          onPressed: ()async{
                            await changeimcont.imagepick();
                            await u_p_i_cont.u_p_i_url();
                            await Save_fstore().save_fstore_i_url(current_u!.uid);
                          },
                          child: Text("Change photo",style:
                          TextStyle(
                              fontFamily: semibold,
                              color: Colors.black,
                              fontSize: shortestval*0.05
                          ),
                          ),
                        ),
                      ),

                      (shortestval*0.03).heightBox,

                      StreamBuilder(
                          stream: user_details().getUser(current_u!.uid),
                          builder:(context,AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (!snapshot.hasData) {
                              return Center(
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation(
                                    Colors.red,
                                  ),
                                ),
                              );
                            } else {
                              var data = snapshot.data!.docs[0];
                              return Container (
                                child: Column(
                                  children: [
                                    Text("Name:${data["name"]}",style: TextStyle(
                                        fontFamily: semibold,
                                        color: Colors.white,
                                        fontSize: shortestval*0.05
                                    ),
                                    ),
                                    Text("Email:${data["email"]}",style: TextStyle(
                                        fontFamily: semibold,
                                        color: Colors.white,
                                        fontSize: shortestval*0.05
                                    ),
                                    ),
                                  ],
                                ),
                              );
                            }
                          }
                      ),

                      (shortestval*0.03).heightBox,

                      Container (
                        color: Colors.black,
                        child: Column(
                          children: [

                            Container (
                                width: widthval,
                                height: heightval*0.06,
                                decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                                  border: Border.all(
                                    color: Colors.blue,
                                    width: shortestval*0.0080,
                                    style: BorderStyle.solid,
                                  ),
                                  borderRadius: BorderRadius.circular(shortestval*0.03),
                                ),
                                child:
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text("Change name",style:
                                      TextStyle(
                                          fontFamily: semibold,
                                          color: Colors.black,
                                          fontSize: shortestval*0.06
                                      ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: shortestval*0.05),
                                      child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Icon(Icons.change_circle)),
                                    ),
                                  ],
                                )
                            ).onTap(() {
                              Navigator.push(context,
                                  MaterialPageRoute(
                                    builder:(context) {
                                      return Changenamescreen();
                                    },
                                  )
                              );

                            }),


                            Container(
                                margin: EdgeInsets.only(top: shortestval*0.01,bottom: shortestval*0.01),
                                width: widthval,
                                height: heightval*0.06,
                                decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                                  border: Border.all(
                                    color: Colors.blue,
                                    width: shortestval*0.0080,
                                    style: BorderStyle.solid,
                                  ),
                                  borderRadius: BorderRadius.circular(shortestval*0.03),
                                ),
                                child:
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text("Change password",style:
                                      TextStyle(
                                          fontFamily: semibold,
                                          color: Colors.black,
                                          fontSize: shortestval*0.06
                                      ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: shortestval*0.05),
                                      child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Icon(Icons.key)),
                                    ),
                                  ],
                                )
                            ).onTap(() {
                              Navigator.push(context,
                                  MaterialPageRoute(
                                    builder:(context) {
                                      return Change_pwd_screen();
                                    },
                                  )
                              );
                            }),

                            StreamBuilder(
                                stream:Admin_user().getAdmin(),
                                builder:(context,AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (!snapshot.hasData) {
                                return Center(
                                child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation(
                                Colors.red,
                                ),
                                ),
                                );
                                } else {
                                  var data = snapshot.data!.docs[0];
                                  return Container(
                                      width: widthval,
                                      height: heightval*0.06,
                                      decoration: BoxDecoration(
                                        color: Colors.blueGrey,
                                        border: Border.all(
                                          color: Colors.blue,
                                          width: shortestval*0.0080,
                                          style: BorderStyle.solid,
                                        ),
                                        borderRadius: BorderRadius.circular(shortestval*0.03),
                                      ),
                                      child:
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text("Admin",style:
                                            TextStyle(
                                                fontFamily: semibold,
                                                color: Colors.black,
                                                fontSize: shortestval*0.06
                                            ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(right: shortestval*0.05),
                                            child: Align(
                                                alignment: Alignment.centerRight,
                                                child: Icon(Icons.admin_panel_settings)),
                                          ),
                                        ],
                                      )
                                  ).onTap(() {

                                    if(current_u!.uid.toString()==data['admin_uid'].toString())
                                    {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                            return AdminServicePage();
                                          },
                                          )
                                      );
                                    }else
                                    {
                                      Toastget().Toastmsg("only admin can navigate");
                                    }
                                  }
                                  );
                                }
                                },
                            ),

                            Container(
                                margin: EdgeInsets.only(top: shortestval*0.01),
                                width: widthval,
                                height: heightval*0.06,
                                decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                                  border: Border.all(
                                    color: Colors.blue,
                                    width: shortestval*0.0080,
                                    style: BorderStyle.solid,
                                  ),
                                  borderRadius: BorderRadius.circular(shortestval*0.03),
                                ),
                                child:
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text("Your orders",style:
                                      TextStyle(
                                          fontFamily: semibold,
                                          color: Colors.black,
                                          fontSize: shortestval*0.06
                                      ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: shortestval*0.05),
                                      child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Icon(Icons.pending_actions)),
                                    ),
                                  ],
                                )
                            ).onTap(() {

                             Navigator.push(context, MaterialPageRoute(builder: (context) {
                               return User_order_history();
                             },
                             )
                             );

                            }
                            ),



                          ],
                        ),
                      ),

                      (shortestval*0.03).heightBox,



                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          child: ElevatedButton(
                            onPressed:
                                () async{
                              await auth.signOut();
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                    return Authenticationscreen();
                                  },
                                  )
                              );
                            }
                            ,
                            child: Text("Log Out",style:
                            TextStyle(
                                fontFamily: semibold,
                                color: Colors.blue,
                                fontSize: shortestval*0.05
                            ),
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(shortestval*0.03),
                                )
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
    );
}
}




