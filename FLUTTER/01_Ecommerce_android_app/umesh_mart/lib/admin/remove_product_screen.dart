import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:umesh_mart/admin/remove_product_method.dart';
import 'package:umesh_mart/common_widget/commontextfield.dart';
import 'package:umesh_mart/common_widget/toast.dart';
import 'package:velocity_x/velocity_x.dart';
class Remove_product_screen extends StatefulWidget {
  const Remove_product_screen({super.key});
  @override
  State<Remove_product_screen> createState() => _Remove_product_screenState();
}
class _Remove_product_screenState extends State<Remove_product_screen> {
  final r_p_s_id_cont=TextEditingController();
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
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: Container(
            color: Colors.green,
            height: heightval,
            child: Column(
              children:
              [
                Commontextfield("Enter the product id","pxx",false, r_p_s_id_cont, context),
                (shortestval*0.03).heightBox,
                ElevatedButton(
                    onPressed:
                    (){
                      Remove_product().Fstorage_rp(r_p_s_id_cont.text.toString());
                      Toastget().Toastmsg("Product which id is "+r_p_s_id_cont.text.toString()+" has been removed successfully");
                      r_p_s_id_cont.clear();
                    }
                    , child: Text("Remove")
                )

              ],
            ),

          ),
        )

    );
  }
}
