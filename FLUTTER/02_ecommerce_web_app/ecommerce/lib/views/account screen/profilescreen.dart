import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_1/consts/consts.dart';
import 'package:ecommerce_1/consts/firebaseconst.dart';
import 'package:ecommerce_1/consts/lists.dart';
import 'package:ecommerce_1/controller/auth_controller.dart';
import 'package:ecommerce_1/views/account%20screen/components/button1.dart';
import 'package:ecommerce_1/views/account%20screen/editprofilescreen.dart';
import 'package:ecommerce_1/views/account%20screen/user_detailsgetx.dart';
import 'package:ecommerce_1/views/auth_screen/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class Profilescreen extends StatefulWidget {
  const Profilescreen({Key? key}) : super(key: key);
  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}
class _ProfilescreenState extends State<Profilescreen> {
  void fetchDataFromFirestore() async {
    try {
      var snapshot = await FirebaseFirestore.instance.collection(usersCollection).get();
      var data =  await snapshot.docs.firstWhereOrNull((doc) => doc.id == currentUser!.uid);
      if (data != null) {
         final user_name = data["name"].toString();
          final user_email=data["email"].toString();
         final cart_count=data["cart_count"].toString();
          final order_count=data["order_count"].toString();
          final wishlist_count=data["wishlist_count"].toString();
          userdetails.detailschange(user_name, user_email, cart_count, order_count, wishlist_count);
      } else {
        print("User document not found.");
      }
    } catch (e) {
      print("Error fetching data: ${e}");
    }
  }
  @override
  void initState() {
    super.initState();
    fetchDataFromFirestore();
  }
  @override
  Widget build(BuildContext context) {
    final widthval=MediaQuery.of(context).size.width;
    final heightval=MediaQuery.of(context).size.height;
    final shortestval=MediaQuery.of(context).size.shortestSide;
    return
      Scaffold(
        appBar: AppBar(
          title: Text("Profile SCREEN"),
        ),
        body:
        SingleChildScrollView(
            scrollDirection: Axis .vertical,
            physics: AlwaysScrollableScrollPhysics(),
            child: Container (
              child:
                        SafeArea(child:
                        Container(
                            width: widthval,
                            color: Colors.blue,
                            height:753.6+5,
                            padding: EdgeInsets.all(shortestval*(5/1920)),
                            child:
                            // 1st parent
                            Column(
                              children: [
                                //1st child of 1 parent
                                Container(
                                  color: Colors.red,
                                  width: widthval,
                                  height: 753.6,
                                  child:
                                  Column (
                                      children:
                                      [
                                        Align(
                                          child: IconButton(
                                            onPressed: ()
                                            {
                                              fetchDataFromFirestore();
                                              Navigator.push(context, MaterialPageRoute(builder:(context)
                                              {
                                                return const Editprofile();
                                              }
                                              ));
                                            },
                                            icon: Icon(Icons.edit),
                                          ),
                                          alignment: Alignment.topRight,
                                        ),
                                        (heightval*(5/1920)).heightBox,
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Image.asset(imgProfile2,
                                              fit:BoxFit.cover,
                                              width:(widthval*(100/1920)),
                                            )
                                                .box.roundedFull.clip(Clip.antiAlias).make(),
                                            Expanded(
                                                child: (widthval*(5/1920)).widthBox),
                                            Obx(
                                              ()=> Expanded(
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      "${userdetails.user_name.value}".text.fontFamily(semibold).white.size(shortestval*(45/1920)).make(),
                                                      (heightval*(5/1920)).heightBox,
                                                      "${userdetails.user_email.value}".text.fontFamily(semibold).white.size(shortestval*(45/1920)).make(),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            (widthval*(10/1920)).widthBox,
                                            OutlinedButton(onPressed: () async {
                                              await controller.signout(context);
                                              Navigator.pushReplacement(context,
                                                  MaterialPageRoute(builder:(context) {
                                                    return LoginScreen();
                                                  }, ) );
                                            },
                                              child:"Log Out".text.size(shortestval*(45/1920)).white.fontFamily(semibold).make(),
                                              style: OutlinedButton.styleFrom(
                                                  side: BorderSide(
                                                    color: Colors.black,
                                                  )
                                              ),
                                            )
                                          ],
                                        ),
                                        (heightval*(40/1920)).heightBox,
                                        Obx(
                                          ()=> Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              button1(widthval, shortestval, heightval,"in your cart",userdetails.cart_count.value),
                                              button1(widthval, shortestval, heightval,"in your wishlist",userdetails.order_count.value),
                                              button1(widthval, shortestval, heightval,"your orders",userdetails.wishlist_count.value),
                                            ],
                                          ),
                                        ),
                                        (heightval*(20/1920)).heightBox,
                                        Container(
                                          width: widthval,
                                          height: heightval*(600/1920),
                                          child: ListView.separated(
                                              itemBuilder: (context, index) =>
                                                  ListTile(
                                                    leading:Image.asset("${profilebuttonicon[index]}") ,
                                                    title: "${profilebuttonlist[index]}".text.size(shortestval*(45/1920)).make(),
                                                  )
                                              ,
                                              separatorBuilder: (context, index) =>
                                                  Divider(
                                                    color: Colors.blue,
                                                  )
                                              ,
                                              itemCount: profilebuttonlist.length),
                                        )
                                      ]
                                  ),
                                ),
                                //2nd child of 1st parent
                              ],
                            )
                        )
                        )
            ),
        ),
      );
  }
  final controller=Get.put(Authcontroller());
  final userdetails=Get.put(Userdetails());
}


