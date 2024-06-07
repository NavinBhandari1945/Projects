
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:umesh_mart/common_widget/toast.dart';
import 'package:umesh_mart/consts/styles.dart';
import 'package:umesh_mart/product/pay_function.dart';
import 'package:velocity_x/velocity_x.dart';

import '../cart/add_cart_items_fstore.dart';
class Item_detail_screen extends StatefulWidget {
  final List p_url;
  final String p_name;
  final String p_price;
  final String p_id;
  final String p_color;
  final String p_description;
  final String p_quantity;

  const Item_detail_screen(
      {
        super.key,
        required this.p_url,
        required this.p_name,
        required this.p_price,
        required this.p_id,
        required this.p_color,
        required this.p_description,
        required this.p_quantity,
      }
      );

  @override
  State<Item_detail_screen> createState() => _Item_detail_screenState();
}

class _Item_detail_screenState extends State<Item_detail_screen> {
  final select_quantity_cont=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var widthval=MediaQuery.of(context).size.width;
    var heightval=MediaQuery.of(context).size.height;
    var shortestval=MediaQuery.of(context).size.shortestSide;
    return Scaffold(
      appBar: AppBar(
        title: Text('Item detail screen'),
      ),
      body:
      Container(
        height: heightval,
        width: widthval,
        color: Colors.green,
        child:
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            children:
            [

              //1st child
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  child: Column(
                    children:
                    [

                      Container(
                        color: Colors.grey,
                        margin:const EdgeInsets.only(top:5,bottom: 5),
                        height:heightval*0.29,
                        width: widthval*0.70,
                        child:
                        PageView.builder(
                          itemCount:  widget.p_url.length,
                          itemBuilder:(context, index) {
                            return
                            // rough 1
                              Image.network(
                                  widget.p_url[index],
                                  fit: BoxFit.fill,
                               // Replace imageUrl with your actual image URL
                                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) {
                                    // Image is fully loaded
                                    return child;
                                  } else if (loadingProgress.cumulativeBytesLoaded == loadingProgress.expectedTotalBytes) {
                                    // Image is still loading
                                    return
                                      Center(
                                        child: Container(
                                          width: widthval*0.10,
                                          height: heightval*0.10,
                                          child: Center(
                                            child: CircularProgressIndicator(
                                            valueColor: AlwaysStoppedAnimation(
                                              Colors.red
                                            ),
                                    ),
                                          ),
                                        ),
                                      ); // Show a loading indicator while the image is loading
                                  } else {
                                    // If there's an error loading the image, display a placeholder or error message
                                    return
                                      Center(
                                        child: Container(
                                        // You can replace this Container with any widget you prefer as a fallback
                                        width: widthval*0.10,
                                        height: heightval*0.10,
                                        color: Colors.grey, // Placeholder color
                                        child: Center(
                                          child: Icon(Icons.error), // Display an error icon or any other message
                                        ),
                                    ),
                                      );
                                  }
                                },
                                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                  // Handle any specific error when loading the image
                                  return
                                    Center(
                                      child: Container(
                                      // Fallback widget when there's an error loading the image
                                      width: widthval*0.10,
                                      height: heightval*0.10,
                                      color: Colors.grey, // Placeholder color
                                      child: Center(
                                        child: Icon(Icons.error), // Display an error icon or any other message
                                      ),
                                  ),
                                    );
                                },
                              );

                          },
                        ),
                      ),


                      (shortestval*0.01).heightBox,

                      Container(child: Text("${widget.p_name}",
                        style: TextStyle(
                          fontFamily: semibold,
                          fontSize: shortestval*0.05,
                        ),
                      )
                      ),

                      (shortestval*0.01).heightBox,

                      Container(
                        child: Text("Price:Nrs ${widget.p_price}",
                          style: TextStyle(
                            fontFamily: semibold,
                            fontSize: shortestval*0.05,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //column 2nd child

              (shortestval*0.01).heightBox,

              //column 3rd child
              Container(
                // color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  [

                    Container(
                      child: Text("Product ID:${widget.p_id}",
                        style: TextStyle(
                          fontFamily: semibold,
                          fontSize: shortestval*0.05,
                        ),
                      ),
                    ),

                    (shortestval*0.01).heightBox,

                    Container(
                      child: Text("Quantity:${widget.p_quantity}",
                        style: TextStyle(
                          fontFamily: semibold,
                          fontSize: shortestval*0.05,
                        ),
                      ),
                    ),

                    (shortestval*0.01).heightBox,

                    Container(
                      // color: Colors.red,
                      width: widthval,
                      child: Text("Available color:${widget.p_color}",
                        style: TextStyle(
                          fontFamily: semibold,
                          fontSize: shortestval*0.05,
                        ),
                      ),
                    ),

                    Text("Enter the product quantity you want to buy.",
                      style: TextStyle(
                        fontFamily: semibold,
                        fontSize: shortestval*0.05,
                      ),
                    ),

                    TextFormField(
                      controller:select_quantity_cont ,
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

                    (shortestval*0.03).heightBox,

                    Container(
                      width: widthval,
                      child:
                      Center(
                        child: Text("Product description",
                          style: TextStyle(
                            fontFamily: semibold,
                            fontSize: shortestval*0.05,
                          ),
                        ),
                      ),
                    ),

                    (shortestval*0.01).heightBox,

                    SingleChildScrollView (
                      scrollDirection: Axis.vertical,
                      physics: BouncingScrollPhysics(),
                      child: Container(
                        width: widthval,
                        height: heightval*0.30,
                        child: Text("${widget.p_description}",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontFamily: semibold,
                            fontSize: shortestval*0.05,
                          ),
                        ),
                      ),
                    ),

                    (shortestval*0.01).heightBox,

                    Container (
                      width: widthval,
                      height: heightval*0.035,
                      child: Row(
                        children:
                        [

                          Container(
                            height: heightval*0.035,
                            width: widthval/2,
                            color: Colors.black45,
                            child: Center(child: Text("Add to cart",
                                style: TextStyle(
                                  fontFamily: semibold,
                                  fontSize: shortestval*0.05,
                                )
                            ),
                            ),
                          ).onTap(()async {
                            if(select_quantity_cont.text.toString().trim().isEmpty){
                              Toastget().Toastmsg("Please provide quantity to add to cart");
                            }
                            else{
                              String select_quantity=select_quantity_cont.text.toString();
                              String available_quantity=widget.p_quantity.toString();
                              double seleect_quantity_1=double.parse(select_quantity);
                              double available_quantity_1=double.parse(available_quantity);
                              if(seleect_quantity_1<=available_quantity_1) {
                                await Add_item_fstore().add_i_fstore(
                                  p_url: widget.p_url,
                                  p_name:widget.p_name,
                                  p_price: widget.p_price,
                                  p_id: widget.p_id,
                                  p_color: widget.p_color,
                                  p_description: widget.p_description,
                                  p_quantity: select_quantity_cont.text.toString(),
                                );
                                Toastget().Toastmsg("${widget.p_name}"+" is added to cart");
                              }
                              else{
                                Toastget().Toastmsg("Not sufficient available quantity.");
                                Toastget().Toastmsg("Item not added to cart.Failed");
                              }
                            }
                          }),

                          Expanded(
                            child: Container(
                              height: heightval*0.035,
                              color: Colors.black38,
                              child: Center(child: Text("Buy",
                                  style: TextStyle(
                                    fontFamily: semibold,
                                    fontSize: shortestval*0.05,
                                  )
                              ),
                              ),
                            ).onTap(() {

                                  if(select_quantity_cont.text.toString().trim().isEmpty) {
                                  Toastget().Toastmsg("Please provide quantity to buy");
                                  }
                                  else {
                                    String select_quantity = select_quantity_cont.text.toString();
                                    String available_quantity = widget.p_quantity.toString();
                                    double seleect_quantity_1 = double.parse(select_quantity);
                                    double available_quantity_1 = double.parse(available_quantity);
                                    if(seleect_quantity_1<=available_quantity_1) {
                                      Pay_functiion().do_pay(
                                          context: context,
                                          p_url: widget.p_url,
                                          p_name: widget.p_name,
                                          p_price: widget.p_price,
                                          p_id: widget.p_id,
                                          p_color: widget.p_color,
                                          p_description: widget.p_description,
                                          p_quantity:select_quantity_cont.text.toString().trim(),
                                      );
                                      double decrease_p_q_a_b=double.parse(widget.p_quantity)-seleect_quantity_1;
                                      FirebaseFirestore.instance.collection("Products").doc(widget.p_id).update({
                                        "p_quantity":decrease_p_q_a_b.toString(),
                                      });
                                      print("After buying item from item detal screen product quantity decrease");
                                    }
                                    else{
                                      Toastget().Toastmsg("Not sufficient available quantity.");
                                      Toastget().Toastmsg("Item failed to buy");
                                    }
                                  }

                            }
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
