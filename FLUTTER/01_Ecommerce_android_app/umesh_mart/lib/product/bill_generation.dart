import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:umesh_mart/Home/home_1.dart';
import 'package:umesh_mart/product/productscreen.dart';

import '../consts/consts.dart';

class Bill_generation extends StatefulWidget {
  final List p_url;
  final String p_name;
  final String p_price;
  final String p_id;
  final String p_color;
  final String p_description;
  final String p_quantity;
  const Bill_generation(
      {super.key,
        required this.p_url,
        required this.p_name,
        required this.p_price,
        required this.p_id,
        required this.p_color,
        required this.p_description,
        required this.p_quantity,
  });

  @override
  State<Bill_generation> createState() => _Bill_generationState();
}

class _Bill_generationState extends State<Bill_generation> {
  @override
  Widget build(BuildContext context) {
    var widthval=MediaQuery.of(context).size.width;
    var heightval=MediaQuery.of(context).size.height;
    var shortestval=MediaQuery.of(context).size.shortestSide;
    print("product url get start");
    print(widget.p_url);
    print("product url get stop");

    return Scaffold(
      appBar: AppBar(
        title:Text('Bill generation screen',
        style: TextStyle(color: Colors.white,fontSize: 25),),
      ),
      body:
      Container(
        width: widthval,
        height: heightval,
        color: Colors.green,
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              width: widthval*0.90,
              height: heightval*0.55,
              color: Colors.grey,
              child:
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  [
                    Container(
                      child: Center(
                        child: FittedBox(
                          child: Center(child: Text("Payment invoice",style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                          ),)),
                        ),
                      ),
                    ),

                    Center(
                      child: Container(
                        color: Colors.grey,
                        margin:const EdgeInsets.only(top:5,bottom: 5),
                        height:heightval*0.10,
                        width: widthval*0.20,
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
                    ),


                    SizedBox(
                      height: 5,
                    ),

                    Container(
                      child: Text("Product name : "+"${widget.p_name}",
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 5,
                    ),

                    Container(
                      child: Text("Product id : "+"${widget.p_id}",
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 5,
                    ),

                    Container(
                      child: Text("Product color : "+"${widget.p_color}",
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 5,
                    ),

                    Container(
                      child: Text("Product price : "+"${widget.p_price}",
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 5,
                    ),

                    Container(
                      child: Text("Product quantity : "+"${widget.p_quantity}",
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 5,
                    ),

                    Container(
                      child: Text("Product description : "+"${widget.p_description}",
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 5,
                    ),

                    Container(
                      child: Text("Note:Take screenshot of invoice",
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),

                  ],
                ),
              ),

            ),

            SizedBox(
              height: 10,
            ),
            
            ElevatedButton(onPressed: (){
              final doc_name=DateTime.now().toString();

              FirebaseFirestore.instance.collection("orders").doc(auth.currentUser!.uid).collection("os").doc(doc_name).set({

                "p_name":widget.p_name.toString().trim(),
                "p_price":widget.p_price.toString().trim(),
                "p_color":widget.p_color.toString().trim(),
                "p_quantity":widget.p_quantity.toString().trim(),
                "p_id":widget.p_id.toString().trim(),
                "p_url":widget.p_url,
                "p_description":widget.p_description.toString().trim(),
                "order_date":doc_name.toString().trim(),
              });

              FirebaseFirestore.instance.collection('admin_orders').doc(doc_name).set({
                "p_name":widget.p_name.toString().trim(),
                "p_price":widget.p_price.toString().trim(),
                "p_color":widget.p_color.toString().trim(),
                "p_quantity":widget.p_quantity.toString().trim(),
                "p_id":widget.p_id.toString().trim(),
                "p_url":widget.p_url,
                "p_description":widget.p_description.toString().trim(),
                "order_date":doc_name.toString().trim(),
                "user_id":auth.currentUser!.uid.toString(),
              }
              );

              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                return Home_1();
              },
              )
              );
              
            }, child:
            FittedBox(
              child: Text("Finish",
              style: TextStyle(
                fontSize: 25
              ),
              ),
            )),


          ],
        ),
      ),
    );
  }
}
