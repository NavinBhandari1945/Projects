import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../common_widget/toast.dart';
import '../consts/styles.dart';
import '../product/pay_function.dart';

class Cart_item_details_screen extends StatefulWidget {
  final List p_url;
  final String p_name;
  final String p_price;
  final String p_id;
  final String p_color;
  final String p_description;
  final String p_quantity;
  const Cart_item_details_screen({
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
  State<Cart_item_details_screen> createState() => _Cart_item_details_screenState();
}

class _Cart_item_details_screenState extends State<Cart_item_details_screen> {

  Future<double> getProductTotalQuantity(String p_id) async {
    // Get a reference to the "Products" collection
    CollectionReference productsCollection = FirebaseFirestore.instance.collection('Products');

    // Get a reference to the specific document "widget"
    DocumentReference widgetDoc = productsCollection.doc(p_id);

    try {
      // Call the get() method on the document reference and wait for the result
      DocumentSnapshot documentSnapshot = await widgetDoc.get();

      if (documentSnapshot.exists) {
        // Access the field value "p_id" from the retrieved document data
        var data = documentSnapshot.data() as Map<String, dynamic>?; // Cast to Map<String, dynamic>
        var p_t_quantity = data?['p_quantity']; // Access 'p_quantity' from the map
        print('Product quantity: ${p_t_quantity}');
        print("document exists and retrieve success of P T Q");
        return double.parse(p_t_quantity.toString());
      } else {
        print('Document does not exist');
        return -1;
      }
    } catch (error) {
      print('Error retrieving document: $error');
      return -1;
    }
  }

  @override
  Widget build(BuildContext context) {
    var widthval=MediaQuery.of(context).size.width;
    var heightval=MediaQuery.of(context).size.height;
    var shortestval=MediaQuery.of(context).size.shortestSide;
    return Scaffold(
      appBar:AppBar(
        title: Text("Cart Item detail screen"),
      ),
      body:Container  (
        height:heightval,
        width: widthval,
        color: Colors.green,
        child:
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Container(
            width: widthval,
            height: heightval*0.92,
            // color: Colors.red,
            child:
            Column(
              children: [
                Expanded(
                  child: Container(
                    child: Stack(
                      children:
                      [

                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            child: Column(
                              children:
                              [

                                Container(
                                  color: Colors.yellow,
                                  margin:const EdgeInsets.only(top:5,bottom: 5),
                                  height:heightval*0.29,
                                  width: widthval*0.70,
                                  child: PageView.builder(
                                    itemCount:  widget.p_url.length,
                                    itemBuilder:(context, index) {
                                      return

                                        // Image.network(
                                        //   widget.p_url[index],
                                        //   fit: BoxFit.fill,
                                        // );

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
                                                    width: 80,
                                                    height: 80,
                                                    child: CircularProgressIndicator(
                                                      valueColor: AlwaysStoppedAnimation(
                                                          Colors.red
                                                      ),
                                                    ),
                                                  ),
                                                ); // Show a loading indicator while the image is loading
                                            } else {
                                              // If there's an error loading the image, display a placeholder or error message
                                              return Container(
                                                // You can replace this Container with any widget you prefer as a fallback
                                                width: 200,
                                                height: 200,
                                                color: Colors.grey, // Placeholder color
                                                child: Center(
                                                  child: Icon(Icons.error), // Display an error icon or any other message
                                                ),
                                              );
                                            }
                                          },
                                          errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                            // Handle any specific error when loading the image
                                            return Container(
                                              // Fallback widget when there's an error loading the image
                                              width: 200,
                                              height: 200,
                                              color: Colors.grey, // Placeholder color
                                              child: Center(
                                                child: Icon(Icons.error), // Display an error icon or any other message
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

                        (shortestval*0.01).heightBox,

                        Positioned(
                          left: shortestval*0.01,
                          top: shortestval*0.80,
                          child: Container(
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

                                SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  physics: BouncingScrollPhysics(),
                                  child: Container(
                                    // color: Colors.red,
                                    width: widthval,
                                    height: heightval*0.06,
                                    child: Text("Available color:${widget.p_color}",
                                      style: TextStyle(
                                        fontFamily: semibold,
                                        fontSize: shortestval*0.05,
                                      ),
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
                                        width: widthval,
                                        color: Colors.black38,
                                        child: Center(child: Text("Buy",
                                            style: TextStyle(
                                              fontFamily: semibold,
                                              fontSize: shortestval*0.05,
                                            )
                                        ),
                                        ),
                                      ).onTap (() async {


                                            Pay_functiion().do_pay(
                                              context: context,
                                              p_url: widget.p_url,
                                              p_name: widget.p_name,
                                              p_price: widget.p_price,
                                              p_id: widget.p_id,
                                              p_color: widget.p_color,
                                              p_description: widget.p_description,
                                              p_quantity:widget.p_quantity,
                                            );

                                            print("purchase item quantity decrease start");


                                            double available_quantity=await getProductTotalQuantity(widget.p_id);
                                            if(available_quantity==-1){
                                            print("Toatal available product  quantity retrieve fail" );
                                            Toastget().Toastmsg("Toatal available product  quantity retrieve fail ");
                                            }
                                            else{
                                              double decrease_p_q_a_b=available_quantity-double.parse(widget.p_quantity);
                                              FirebaseFirestore.instance.collection("Products").doc(widget.p_id).update({
                                                "p_quantity":decrease_p_q_a_b.toString(),
                                              });
                                              print("After buying item from cart screen product quantity decrease");
                                            }


                                          }
                                      ),

                                    ],
                                  ),
                                ),


                              ],
                            ),
                          ),

                        ),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

      ),
    );
  }
}
