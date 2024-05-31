import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:umesh_mart/common_widget/toast.dart';

import '../cart/getProductTQ.dart';

class UpdateQuantity extends StatefulWidget {
  const UpdateQuantity({super.key});

  @override
  State<UpdateQuantity> createState() => _UpdateQuantityState();
}

class _UpdateQuantityState extends State<UpdateQuantity> {
  final cont_quantity=TextEditingController();
  final cont_id=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var widthval=MediaQuery.of(context).size.width;
    var heightval=MediaQuery.of(context).size.height;
    var shortestval=MediaQuery.of(context).size.shortestSide;
    return Scaffold(
      appBar: AppBar(

        title: Text("Update quantity screen"),

      ),
      body: Container(
        height: heightval,
        width: widthval,
        color: Colors.green,
        child: Container(
          child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: heightval*0.02,
              ),
              Text("Enter the product id ",
              style: TextStyle(
                fontSize: shortestval*0.06,
              ),
              ),
              TextFormField(
                controller: cont_id,
                decoration: InputDecoration(

                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: shortestval*0.01,
                      )
                  ),

                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: shortestval*0.01,
                      )
                  ),

                ),
              ),
              SizedBox(
                height: heightval*0.02,
              ),

              Text("Enter the quantity to update ",
                style: TextStyle(
                  fontSize: shortestval*0.06,
                ),),
              TextFormField(
                controller: cont_quantity,
                decoration: InputDecoration(

                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: shortestval*0.01,
                      )
                  ),

                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: shortestval*0.01,
                      )
                  ),

                ),
              ),

              SizedBox(
                height: heightval*0.02,
              ),

              Container(
                child:
                Center(
                  child: ElevatedButton(
                    onPressed: ()async{

                      double available_quantity=await Get_p_t_q().getProductTotalQuantity(cont_id.text.toString());
                      if(available_quantity==-1){
                        print("Toatal available product  quantity retrieve fail" );
                        Toastget().Toastmsg("Toatal available product  quantity retrieve fail ");
                      }
                      else{
                        double decrease_p_q_a_b=available_quantity+double.parse(cont_quantity.text.toString());
                        FirebaseFirestore.instance.collection("Products").doc(cont_id.text.toString()).update({
                          "p_quantity":decrease_p_q_a_b.toString(),
                        });
                        print("Update quantity =${cont_quantity.text.toString()} of product id =${cont_id.text.toString()}\n success ");
                        Toastget().Toastmsg("Update quantity =${cont_quantity.text.toString()} of product id =${cont_id.text.toString()}\n success ");

                      }


                    },
                    child: Text("Update"),
                  ),
                ),
              )


            ],
          ),

        ),
      ),
    );
  }
}
