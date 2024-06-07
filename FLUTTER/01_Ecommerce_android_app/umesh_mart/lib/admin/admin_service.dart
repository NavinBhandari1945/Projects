import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:umesh_mart/admin/add_product.dart';
import 'package:umesh_mart/admin/admin_orders_history.dart';

import 'package:umesh_mart/admin/remove_product_screen.dart';
import 'package:umesh_mart/admin/update_quantity.dart';
import 'package:umesh_mart/common_widget/toast.dart';
import 'package:velocity_x/velocity_x.dart';

import '../consts/consts.dart';
import '../consts/styles.dart';
import 'addofferscreen.dart';


class AdminServicePage extends StatefulWidget {
  const AdminServicePage({super.key});

  @override
  State<AdminServicePage> createState() => _AdminServicePageState();
}

class _AdminServicePageState extends State<AdminServicePage> {
  @override
  Widget build(BuildContext context) {
    var widthval=MediaQuery.of(context).size.width;
    var heightval=MediaQuery.of(context).size.height;
    var shortestval=MediaQuery.of(context).size.shortestSide;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title:Text("Admin service page"),
        ),
        body:
        Container(
          child: Column(
            children:
            [

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
                        child: Text("Add product",style:
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
                            child: Icon(Icons.add)),
                      ),
                    ],
                  )
              ).onTap(()  {
                Navigator.push(context,
                    MaterialPageRoute(
                      builder:(context) {
                        return Add_product_screen();
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
                        child: Text("Remove product",style:
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
                            child: Icon(Icons.remove)),
                      ),
                    ],
                  )
              ).onTap(() {
                Navigator.push(context,
                    MaterialPageRoute(
                      builder:(context) {
                        return Remove_product_screen();
                      },
                    )
                );
              }),

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
                        child: Text("Orders",style:
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
              ).onTap (() {

                Navigator.push(context,MaterialPageRoute(builder: (context) {
                  return AdminOrderHistory();
                },));

              }
              ),

              Container (
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
                        child: Text("Add offer",style:
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
                            child: Icon(Icons.local_offer)),
                      ),
                    ],
                  )
              ).onTap (() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                      return AddOfferScreen();
                    },
                    )
                );

              }
              ),

              Container (
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
                        child: Text("Remove offer",style:
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
                            child: Icon(Icons.local_offer)),
                      ),
                    ],
                  )
              ).onTap (() async
              {

                print("initializing delete offer");

                // await firestorage_ref.child("offers").child("images").delete();
                // print("firestorage offer image child images delete ");


                final makefile1_value=FirebaseStorage.instance.ref().child("offers").child('images');

                try {
                  // List all items (files) in the 'images' folder
                  final items = await makefile1_value.listAll();

                  // Iterate through each item (file) and delete them
                  await Future.forEach(items.items, (Reference item) async {
                    await item.delete();
                  });

                  print('All files inside the images folder deleted successfully');
                } catch (e) {
                  print('Error deleting files: $e');
                }
                print("firestorage offer images files delete success");

                await FirebaseFirestore.instance.collection("offers").doc("images").update({
                  "oi_url":"",
                });
                print("firestore offer image url update to empty ");

                Toastget().Toastmsg("Offer delete successfull");

              }
              ),


              Container (
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
                        child: Text("Update quantity",style:
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
                            child: Icon(Icons.local_offer)),
                      ),
                    ],
                  )
              ).onTap (() async
              {

                Navigator.push(context,MaterialPageRoute(builder: (context) {
                  return UpdateQuantity();
                },));



              }
              ),

            ],
          ),
        ),

    );
  }
}
