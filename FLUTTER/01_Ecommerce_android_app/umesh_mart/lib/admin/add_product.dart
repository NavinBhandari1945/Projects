
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:umesh_mart/admin/pick_image_getx.dart';
import 'package:umesh_mart/admin/product_id_getx.dart';
import 'package:umesh_mart/common_widget/commontextfield.dart';
import 'package:umesh_mart/common_widget/toast.dart';
import 'package:umesh_mart/consts/consts.dart';
import 'package:velocity_x/velocity_x.dart';

import 'add_p_image_fstorage_getx.dart';

class Add_product_screen extends StatefulWidget {
  const Add_product_screen({super.key});
  @override
  State<Add_product_screen> createState() => _Add_product_screenState();
}
class _Add_product_screenState extends State<Add_product_screen> {
  final product_name_aps_cont=TextEditingController();
  final product_price_aps_cont=TextEditingController();
  final product_color_aps_cont=TextEditingController();
  final product_quantity_aps_cont=TextEditingController();
  final product_id_aps_cont=TextEditingController();
  final product_description_aps_cont=TextEditingController();
  final pick_image_cont_aps=Get.put(Pick_image_aps());
  final p_id_obj=Get.put(Product_id());
  final fstore_cont=Get.put(Fstrg_image());
  @override
  Widget build(BuildContext context) {
    var widthval=MediaQuery.of(context).size.width;
    var heightval=MediaQuery.of(context).size.height;
    var shortestval=MediaQuery.of(context).size.shortestSide;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title:Text("Add product screen"),
        ),
        body:
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Container(
            height: heightval,
            color: Colors.green,
            child: Column(
              children:
              [
                Commontextfield("Entaer product name","xxxxx", false, product_name_aps_cont, context),
                (shortestval*0.03).heightBox,
                Commontextfield("Entaer product price","xxxxx", false, product_price_aps_cont, context),
                (shortestval*0.03).heightBox,
                Commontextfield("Entaer product quantity","xxxxx", false, product_quantity_aps_cont, context),
                (shortestval*0.03).heightBox,
                Commontextfield("Entaer product color","xxxxx", false, product_color_aps_cont, context),
                (shortestval*0.03).heightBox,
                Commontextfield("Entaer product id","xxxxx", false, product_id_aps_cont, context),
                (shortestval*0.03).heightBox,
                Commontextfield("Enter ptoduct description", "xxxxx", false,product_description_aps_cont, context),
                (shortestval*0.03).heightBox,
                ElevatedButton(onPressed:()async
                {
                  await pick_image_cont_aps.Pick_image_m();
                  Toastget().Toastmsg("Image has been picked");
                },
                    child:Text("Pick image")
                ),
                (shortestval*0.03).heightBox,
                ElevatedButton(onPressed:() async
                {
                  if(
                  product_name_aps_cont.text.toString().trim().isEmpty ||
                  product_description_aps_cont.text.toString().trim().isEmpty ||
                  product_price_aps_cont.text.toString().trim().isEmpty ||
                  product_quantity_aps_cont.text.toString().trim().isEmpty ||
                  product_id_aps_cont.text.toString().trim().isEmpty ||
                  product_color_aps_cont.text.toString().trim().isEmpty ||
                  pick_image_cont_aps.images_path.isEmpty
                  ){
                    Toastget().Toastmsg("Please provide all items details and pick images then try again");
                  }
                  else{
                    await p_id_obj.changeid(product_id_aps_cont.text.toString());
                    await fstore_cont.Store_image();
                    await firestoreinst.collection(products_colle).doc(product_id_aps_cont.text.toString())
                        .set(
                        {
                          "p_name":product_name_aps_cont.text.toString().trim(),
                          "p_price":product_price_aps_cont.text.toString().trim(),
                          "p_color":product_color_aps_cont.text.toString().trim(),
                          "p_quantity":product_quantity_aps_cont.text.toString().trim(),
                          "p_id":product_id_aps_cont.text.toString().trim(),
                          "p_url":fstore_cont.image_url.value,
                          "p_description":product_description_aps_cont.text.toString().trim(),
                        }
                    );

                    pick_image_cont_aps.pick_images.clear();
                    pick_image_cont_aps.images_path.clear();
                    fstore_cont.image_url.clear();

                    Toastget().Toastmsg("Prodict "+product_name_aps_cont.text.toString()+" has been added successfully");
                    product_name_aps_cont.clear();
                    product_id_aps_cont.clear();
                    product_quantity_aps_cont.clear();
                    product_color_aps_cont.clear();
                    product_price_aps_cont.clear();
                    product_description_aps_cont.clear();

                  }
                },
                    child: Text("Add")
                ),

              ],
            ),
          ),
        )
    );
  }
}

