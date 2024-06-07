import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:umesh_mart/cart/remove_cart_item.dart';
import 'package:umesh_mart/cart/retrieve_cart_items.dart';
import 'package:velocity_x/velocity_x.dart';

import '../product/Item_detail_creen.dart';
import 'cart_item_details.dart';

class Cartscreen extends StatefulWidget {
  const Cartscreen({Key? key}) : super(key: key);

  @override
  State<Cartscreen> createState() => _CartscreenState();
}

class _CartscreenState extends State<Cartscreen> {
  @override
  Widget build(BuildContext context) {
    var widthval=MediaQuery.of(context).size.width;
    var heightval=MediaQuery.of(context).size.height;
    var shortestval=MediaQuery.of(context).size.shortestSide;
    return Scaffold(
      appBar: AppBar(
        title: Text("cart screen"),
      ),
      body:
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        child: Container(
          width: widthval,
          height: heightval,
          color: Colors.green,
          child:StreamBuilder(
            stream: Retrieve_cart_i().get_c_i(),
            builder: (context,AsyncSnapshot<QuerySnapshot>snapshot){
              if(!snapshot.hasData)
              {
                return Center(child: Text('There is not any relevlant data present.'),);
              }else if(snapshot.hasError){
                return Center(child: Text('${snapshot.error}'),);
              }else if(snapshot.connectionState==ConnectionState.waiting){
                return Center(child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(
                    Colors.red,
                  ),
                ),
                );
              }
              else{
                var data=snapshot.data;
                return ListView.separated(
                    itemBuilder:(context, index) {
                      return
                        Container (
                        height: heightval*0.08,
                        width: widthval,
                        color: Colors.black,
                        child: ListTile(
                          leading:Container(
                            height:heightval*0.08,
                            width: widthval*0.20,
                            color: Colors.grey,
                            child:
                            PageView.builder(
                              itemCount: data.docs[index]["p_url"].length,
                              itemBuilder: (context, pageindex) {
                                return
                                  Image.network (
                                  data!.docs[index]["p_url"][pageindex],
                                  fit: BoxFit.fill,
                                  // Replace imageUrl with your actual image URL
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) {
                                      // Image is fully loaded
                                      return child;
                                    } else
                                    if (loadingProgress.cumulativeBytesLoaded ==
                                        loadingProgress.expectedTotalBytes) {
                                      // Image is still loading
                                      return
                                        Center(
                                          child: Container(
                                            width: double.infinity,
                                            height: heightval * 0.02,
                                            child: 
                                            Center(
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
                                      return Center(
                                        child: Container(
                                            height: heightval * 0.04,
                                            width: double.infinity,
                                            child: Icon(Icons.error)), // Display an error icon or any other message
                                      );
                                    }
                                  },
                                  errorBuilder: (BuildContext context,
                                      Object exception,
                                      StackTrace? stackTrace) {
                                    // Handle any specific error when loading the image
                                    return Center(
                                      child: Container(
                                          height: heightval * 0.04,
                                          width: double.infinity,
                                          child: Icon(Icons.error)), // Display an error icon or any other message
                                    );
                                  },
                                );

                              },
                            ),
                          ),

                          title: Text("${data.docs[index]['p_name']}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: shortestval*0.04,
                            ),
                          ),

                          subtitle:Text("${data.docs[index]['p_price']}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: shortestval*0.04,
                            ),
                          ),

                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: (){
                              Remove_cart_items().remove_c_i(p_id: data.docs[index]["p_id"]);
                            },
                            color: Colors.red,
                          ),
                        ),
                      ).onTap(() {
                        Navigator.push(context,
                           MaterialPageRoute(builder: (context) {
                             return
                               Cart_item_details_screen(
                                 p_url: data.docs[index]["p_url"],
                                 p_name: data.docs[index]["p_name"],
                                 p_description: data.docs[index]["p_description"],
                                 p_id: data.docs[index]["p_id"],
                                 p_color: data.docs[index]["p_color"],
                                 p_price: data.docs[index]["p_price"],
                                 p_quantity: data.docs[index]["p_quantity"],

                             );
                           },
                           )
                        );

                        });
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        height: heightval*0.01,
                        thickness: shortestval*0.01,
                        color: Colors.red,
                      );
                    },
                    itemCount: data!.docs.length,
                    scrollDirection: Axis.vertical,
                );
              }

            },
          )

        ),
      )
    );
  }
}
