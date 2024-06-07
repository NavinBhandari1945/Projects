import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:umesh_mart/common_widget/toast.dart';
import 'package:velocity_x/velocity_x.dart';

import '../consts/styles.dart';
import 'add_o_i_fstorage.dart';
import 'add_offer_i_pickup_getx.dart';

class AddOfferScreen extends StatefulWidget {
  const AddOfferScreen({super.key});

  @override
  State<AddOfferScreen> createState() => _AddOfferScreenState();
}

class _AddOfferScreenState extends State<AddOfferScreen> {
  final pick_offer_image_cont=Get.put(Pick_offer_image());
  final add_o_i_fstorage_cont=Get.put(Add_o_i_fstorage());

  @override
  Widget build(BuildContext context) {
    var widthval=MediaQuery.of(context).size.width;
    var heightval=MediaQuery.of(context).size.height;
    var shortestval=MediaQuery.of(context).size.shortestSide;
    return Scaffold(
        appBar: AppBar(
          title: Text("AddofferScreen"),
        ),
        body:Container(
          width:widthval ,
          height: heightval,
          color: Colors.green,
          child:Column(
            children:
            [

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
                        child:
                        Padding(
                          padding: EdgeInsets.only(left: shortestval*0.02),
                          child: Text("Pick Offer Image",style:
                          TextStyle(
                              fontFamily: semibold,
                              color: Colors.black,
                              fontSize: shortestval*0.06
                          ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: shortestval*0.05),
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Icon(Icons.image)),
                      ),
                    ],
                  )
              ).onTap (()async {
                await pick_offer_image_cont.pick_o_i();
                if(pick_offer_image_cont.image_paths.isEmpty){
                  Toastget().Toastmsg("Offer image has not been pickked ");

                }
                else{
                  Toastget().Toastmsg("Offer image has been pickked successfully");

                }

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
                        child:
                        Padding(
                          padding: EdgeInsets.only(left: shortestval*0.02),
                          child: Text("Add Offer",style:
                          TextStyle(
                              fontFamily: semibold,
                              color: Colors.black,
                              fontSize: shortestval*0.06
                          ),
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
              ).onTap (() async{


                if(pick_offer_image_cont.image_paths.isEmpty){
                  Toastget().Toastmsg("First pick the offer image then only add");

                }else{
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

                  await add_o_i_fstorage_cont.downloadurl_o_i();
                  print("Offer image added successfully in firestorage");


                  await FirebaseFirestore.instance.collection("offers").doc("images").update({
                    "oi_url":add_o_i_fstorage_cont.o_i_url.value,
                  });

                  print("offer image url added succesfully in firestore");

                  pick_offer_image_cont.image_file.clear();
                  pick_offer_image_cont.image_paths.clear();
                  add_o_i_fstorage_cont.o_i_url.value.clear();



                  Toastget().Toastmsg("Offer image added successfully");

                }



              }
              ),


            ],
          ) ,
        )
    );
  }
}
