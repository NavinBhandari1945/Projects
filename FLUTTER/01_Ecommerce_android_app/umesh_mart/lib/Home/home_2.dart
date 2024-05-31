// import 'package:flutter/material.dart';
// import 'package:umesh_mart/consts/consts.dart';
// import 'package:umesh_mart/consts/styles.dart';
// import 'package:velocity_x/velocity_x.dart';
//
// class Home2screen extends StatefulWidget {
//   const Home2screen({Key? key}) : super(key: key);
//
//   @override
//   State<Home2screen> createState() => _Home2screenState();
// }
//
// class _Home2screenState extends State<Home2screen> {
//   @override
//   Widget build(BuildContext context) {
//     var widthval=MediaQuery.of(context).size.width;
//     var heightval=MediaQuery.of(context).size.height;
//     var shortestval=MediaQuery.of(context).size.shortestSide;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Homescreen"),
//       ),
//       body: SingleChildScrollView(
//         physics: BouncingScrollPhysics(),
//         scrollDirection: Axis.vertical,
//         child: (
//         Container(
//           color: Colors.black,
//           height:1000,
//           width: widthval,
//           child:
//           Column(
//             children: [
//
//               Container(
//                 // color: Colors.blue,
//                 width: widthval,
//                 height: heightval*0.0393,
//                 child: Center(
//                   child: Text("Enjoy your shopping",
//                     style: TextStyle(
//                         fontFamily: semibold,
//                         color: Colors.white,
//                         fontSize: shortestval*0.05
//                     ),
//                   ),
//                 ),
//               ),
//               (shortestval*0.01).heightBox,
//               Container(
//                 color: Colors.grey,
//                 height: heightval*0.3050,
//                 width: widthval,
//                 child:VxSwiper.builder(
//                     itemCount:swiperimg.length,
//                     autoPlay: true,
//                     aspectRatio: 16/9,
//                     scrollDirection: Axis.horizontal,
//                     itemBuilder: (context, index) {
//                       return Container(
//                         height: double.infinity,
//                         width: double.infinity,
//                         margin: EdgeInsets.only(left: shortestval*0.1216,right: shortestval*0.1216),
//                         child: Image.asset(
//                             swiperimg[index],
//                           fit: BoxFit.fill,
//                         ),
//                       );
//                     },)
//               ),
//               Container(
//                 width: widthval,
//                 height:heightval*0.263,
//                 decoration: BoxDecoration(
//                   color: Colors.green,
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child:Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       child: Center(
//                         child: Text("Raw materials",style: TextStyle(
//                           fontFamily: bold,
//                           fontSize: shortestval*0.06,
//                           color: Colors.white
//                         ),
//                         ),
//                       ),
//                     ),
//
//                     Container(
//                       child: Row(
//                         children: [
//                           Expanded(
//                             child: Container(
//                               margin: EdgeInsets.only(left: shortestval*0.02),
//                               child: Text("Iron:100",style: TextStyle(
//                                   fontFamily: bold,
//                                   fontSize: shortestval*0.06,
//                                   color: Colors.white
//                               )
//                               ),
//                             ),
//                           ),
//
//                           Expanded(
//                             child: Align(
//                               alignment: Alignment.center,
//                               child: Container(
//                                 margin: EdgeInsets.only(right: shortestval*0.02),
//                                 child: Text("Copper:100",style: TextStyle(
//                                     fontFamily: bold,
//                                     fontSize: shortestval*0.06,
//                                     color: Colors.white
//                                 )
//                                 ),
//                               ),
//                             ),
//                           ),
//
//                         ],
//                       ),
//                     ),
//
//                     Container(
//                       child: Row(
//                         children: [
//
//                           Expanded(
//                             child: Container(
//                               margin: EdgeInsets.only(left: shortestval*0.02),
//                               child: Text("Candle:100",style: TextStyle(
//                                   fontFamily: bold,
//                                   fontSize: shortestval*0.06,
//                                   color: Colors.white
//                               )
//                               ),
//                             ),
//                           ),
//                           Expanded(
//                             child: Align(
//                               alignment: Alignment.center,
//                               child: Container(
//                                 margin: EdgeInsets.only(right: shortestval*0.02),
//                                 child: Text("Glaas:100",style: TextStyle(
//                                     fontFamily: bold,
//                                     fontSize: shortestval*0.06,
//                                     color: Colors.white
//                                 )
//                                 ),
//                               ),
//                             ),
//                           ),
//
//                         ],
//                       ),
//                     ),
//
//                     Container(
//                       child: Row(
//                         children: [
//                           Expanded(
//                             child: Container(
//                               margin: EdgeInsets.only(left: shortestval*0.02),
//                               child: Text("Lead:100",style: TextStyle(
//                                   fontFamily: bold,
//                                   fontSize: shortestval*0.06,
//                                   color: Colors.white
//                               )
//                               ),
//                             ),
//                           ),
//                           Expanded(
//                             child: Align(
//                               alignment: Alignment.center,
//                               child: Container(
//                                 margin: EdgeInsets.only(right: shortestval*0.02),
//                                 child: Text("Any1:100",style: TextStyle(
//                                     fontFamily: bold,
//                                     fontSize: shortestval*0.06,
//                                     color: Colors.white
//                                 )
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//
//                     (shortestval*0.01).heightBox,
//
//
//                     Container(
//                       padding: EdgeInsets.only(left: shortestval * 0.02, right: shortestval * 0.02),
//                       child: RichText(
//                         textAlign: TextAlign.justify,
//                         text: TextSpan(
//                           style: TextStyle(
//                             fontFamily: bold,
//                             fontSize: shortestval * 0.05,
//                             color: Colors.white,
//                           ),
//                           children:[
//                             TextSpan(
//                               text: "You can exchange raw materials, old products with your desire item. ",
//                             ),
//                             TextSpan(
//                               text: "You can also repolish your items made of copper, which will take a certain charge.",
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//
//
//
//
//
//
//
//
//                   ],
//                 ) ,
//               )
//
//             ],
//
//
//           ),
//
//         )
//         ),
//       ),
//
//     );
//   }
// }



//rough

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:umesh_mart/consts/consts.dart';
import 'package:umesh_mart/consts/styles.dart';
import 'package:velocity_x/velocity_x.dart';

import '../admin/offer_i_stream_snapshot.dart';
import '../product/Item_detail_creen.dart';
import 'featured_products_snapshot.dart';

class Home2screen extends StatefulWidget {
  const Home2screen({Key? key}) : super(key: key);

  @override
  State<Home2screen> createState() => _Home2screenState();
}

class _Home2screenState extends State<Home2screen> {
  @override
  Widget build(BuildContext context) {
    var widthval=MediaQuery.of(context).size.width;
    var heightval=MediaQuery.of(context).size.height;
    var shortestval=MediaQuery.of(context).size.shortestSide;
    return Scaffold(
      appBar: AppBar(
        title: Text("Homescreen"),
      ),
      body: (
          Container(
            color: Colors.black,
            height:heightval,
            width: widthval,
            child:
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Container(
                width: widthval,
                color: Colors.green,
                height: heightval*0.95,
                child: Column(
                  children: [


                    Container(
                      // color: Colors.blue,
                      width: widthval,
                      height: heightval*0.0393,
                      child: Center(
                        child: Text("Enjoy your shopping",
                          style: TextStyle(
                              fontFamily: semibold,
                              color: Colors.white,
                              fontSize: shortestval*0.05
                          ),
                        ),
                      ),
                    ),

                    (shortestval*0.01).heightBox,


                    StreamBuilder(
                      stream: O_i_stream_snapshot().getsnapshot(),
                      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Container(
                            color: Colors.grey,
                            height: heightval * 0.3050,
                            width: widthval,
                            child: Center(
                              child: Text("Error occurred while retrieving data"),
                            ),
                          );
                        } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                          return Container(
                            color: Colors.grey,
                            height: heightval * 0.3050,
                            width: widthval,
                            child: Center(
                              child: Text("There is no data"),
                            ),
                          );
                        }
                        else if (snapshot.connectionState == ConnectionState.waiting) {
                          return Container(
                            color: Colors.grey,
                            height: heightval * 0.3050,
                            width: widthval,
                            child: Center(
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation(
                                  Colors.red,
                                ),
                              ),
                            ),
                          );
                        }
                        else {
                          var data = snapshot.data!.docs[0].data() as Map<String, dynamic>; // Explicit cast
                          if (data.containsKey('oi_url')) {
                            var oiUrl = data['oi_url'] ; // Explicit cast
                            return
                              oiUrl.isEmpty
                                ? Container(
                              color: Colors.grey,
                              height: heightval * 0.3050,
                              width: widthval,
                              child: const Center(
                                child: Text("Empty offer images URL in Firestore"),
                              ),
                            )
                                : Container(
                              color: Colors.grey,
                              height: heightval * 0.3050,
                              width: widthval,
                              child: VxSwiper.builder(
                                itemCount: oiUrl.length,
                                autoPlay: true,
                                aspectRatio: 16 / 9,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Container(
                                    height: double.infinity,
                                    width: double.infinity,
                                    margin: EdgeInsets.only(
                                        left: shortestval * 0.1216,
                                        right: shortestval * 0.1216),
                                    child: oiUrl[0] == ''
                                        ? Center(child: Text("No offer now"))
                                        : Image.network(
                                      oiUrl[index],
                                      fit: BoxFit.fill,
                                      loadingBuilder: (BuildContext context,
                                          Widget child,
                                          ImageChunkEvent? loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        } else if (loadingProgress
                                            .cumulativeBytesLoaded ==
                                            loadingProgress.expectedTotalBytes) {
                                          return Center(
                                            child: Container(
                                              width: double.infinity,
                                              height: heightval * 0.04,
                                              color: Colors.grey,
                                              child: Center(
                                                child: CircularProgressIndicator(
                                                  valueColor: AlwaysStoppedAnimation(
                                                      Colors.red),
                                                ),
                                              ),
                                            ),
                                          );
                                        } else {
                                          return Center(
                                            child: Container(
                                                height: heightval * 0.04,
                                                width: double.infinity,
                                                color: Colors.grey,
                                                child: Center(
                                                    child: Icon(Icons.error))),
                                          );
                                        }
                                      },
                                      errorBuilder: (BuildContext context,
                                          Object exception, StackTrace? stackTrace) {
                                        return Center(
                                          child: Container(
                                              height: heightval * 0.04,
                                              width: double.infinity,
                                              color: Colors.grey,
                                              child: Center(
                                                  child: Icon(Icons.error))),
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
                            );
                          } else {
                            return Container(
                              color: Colors.grey,
                              height: heightval * 0.3050,
                              width: widthval,
                              child: Center(
                                child: Text("No 'oi_url' field in Firestore document"),
                              ),
                            );
                          }
                        }
                      },
                    ),



                    Container(
                      width: widthval,
                      height:heightval*0.300,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Center(
                              child: Text("Raw materials",style: TextStyle(
                                  fontFamily: bold,
                                  fontSize: shortestval*0.06,
                                  color: Colors.white
                              ),
                              ),
                            ),
                          ),

                          Container(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(left: shortestval*0.02),
                                    child: Text("Iron:100",style: TextStyle(
                                        fontFamily: bold,
                                        fontSize: shortestval*0.06,
                                        color: Colors.white
                                    )
                                    ),
                                  ),
                                ),

                                Expanded(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      margin: EdgeInsets.only(right: shortestval*0.02),
                                      child: Text("Copper:100",style: TextStyle(
                                          fontFamily: bold,
                                          fontSize: shortestval*0.06,
                                          color: Colors.white
                                      )
                                      ),
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),

                          Container(
                            child: Row(
                              children: [

                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(left: shortestval*0.02),
                                    child: Text("Candle:100",style: TextStyle(
                                        fontFamily: bold,
                                        fontSize: shortestval*0.06,
                                        color: Colors.white
                                    )
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      margin: EdgeInsets.only(right: shortestval*0.02),
                                      child: Text("Glaas:100",style: TextStyle(
                                          fontFamily: bold,
                                          fontSize: shortestval*0.06,
                                          color: Colors.white
                                      )
                                      ),
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),

                          Container(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(left: shortestval*0.02),
                                    child: Text("Lead:100",style: TextStyle(
                                        fontFamily: bold,
                                        fontSize: shortestval*0.06,
                                        color: Colors.white
                                    )
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      margin: EdgeInsets.only(right: shortestval*0.02),
                                      child: Text("Any1:100",style: TextStyle(
                                          fontFamily: bold,
                                          fontSize: shortestval*0.06,
                                          color: Colors.white
                                      )
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          (shortestval*0.01).heightBox,


                          Container(
                            padding: EdgeInsets.only(left: shortestval * 0.02, right: shortestval * 0.02),
                            child: RichText(
                              textAlign: TextAlign.justify,
                              text: TextSpan(
                                style: TextStyle(
                                  fontFamily: bold,
                                  fontSize: shortestval * 0.05,
                                  color: Colors.white,
                                ),
                                children:[
                                  TextSpan(
                                    text: "You can exchange raw materials, old products with your desire item. ",
                                  ),
                                  TextSpan(
                                    text: "You can also repolish your items made of copper, which will take a certain charge.",
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ) ,
                    ),

                    Expanded (
                      child: Container(
                        color: Colors.lightGreenAccent,
                        width: widthval,
                        height: 250,
                        child:
                            StreamBuilder(
                              stream: Snapshots_featured_products.getFeaturedItems(),
                              builder:(context,AsyncSnapshot<QuerySnapshot> snapshot)  {

                                                          if (snapshot.hasError) {
                                                          return Container(
                                                          color: Colors.grey,
                                                          height: double.infinity,
                                                          width: widthval,
                                                          child: Center(
                                                          child: Text("Error occurred while retrieving data"),
                                                          ),
                                                          );
                                                          }
                                                          else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                                                          return
                                                            Container(
                                                          color: Colors.grey,
                                                              height: double.infinity,
                                                          width: widthval,
                                                          child: Center(
                                                          child: Text("There is no data"),
                                                          ),
                                                          );
                                                          }
                                                          else if
                                                          (snapshot.connectionState == ConnectionState.waiting) {
                                                          return Container(
                                                          color: Colors.grey,
                                                            height: double.infinity,
                                                          width: widthval,
                                                          child: Center(
                                                          child: CircularProgressIndicator(
                                                          valueColor: AlwaysStoppedAnimation(
                                                          Colors.red,
                                                          ),
                                                          ),
                                                          ),
                                                          );
                                                          }
                                                          else
                                                          {
                                                            var data=snapshot.data;
                                                            return
                                                            Container(
                                                              color:Colors.brown ,
                                                              width: widthval,
                                                              height: 250,
                                                              child: 
                                                              ListView.separated(
                                                                  scrollDirection: Axis.horizontal,
                                                                  itemBuilder: (context, listview_index)
                                                                  {
                                                                return
                                                                  
                                                                  Row(
                                                                    children: [

                                                                      Container (
                                                                      height: 250,
                                                                      width: 200,
                                                                      color: Colors.black,
                                                                      child:
                                                                      Column(
                                                                        children: [

                                                                          Expanded(
                                                                            flex: 2,
                                                                            child: Container(
                                                                              color: Colors.grey,
                                                                              child:
                                                                              PageView.builder(
                                                                                itemCount:data!.docs[listview_index]["p_url"].length,
                                                                                itemBuilder:(context, item_index) {
                                                                                  return
                                                                                    // rough 1
                                                                                    Image.network(
                                                                                      "${data!.docs[item_index]["p_url"][item_index]}",
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
                                                                                                width: double.infinity,
                                                                                                height: double.infinity,
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
                                                                                                width: double.infinity,
                                                                                                height: double.infinity,
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
                                                                                              width: double.infinity,
                                                                                              height: double.infinity,
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

                                                                          Expanded(
                                                                            flex:1,
                                                                            child: Container(
                                                                              color: Colors.green,
                                                                              child:
                                                                              Center(
                                                                                child: Text(
                                                                                  "Price:Nrs${data.docs[listview_index]["p_price"]}",
                                                                                  style: TextStyle(
                                                                                    color: Colors.white,
                                                                                    fontSize: shortestval*0.06
                                                                                  ),

                                                                                ),
                                                                              ),
                                                                            ),
                                                                          )
                                                                        ],
                                                                      ),
                                                                      ).onTap(() {
                                                                        Navigator.push(context,MaterialPageRoute(builder: (context) {
                                                                          return Item_detail_screen(
                                                                              p_url:data.docs[listview_index]["p_url"],
                                                                              p_name:data.docs[listview_index]["p_name"],
                                                                              p_price: data.docs[listview_index]["p_price"],
                                                                              p_id: data.docs[listview_index]["p_id"],
                                                                              p_color: data.docs[listview_index]["p_color"],
                                                                              p_description: data.docs[listview_index]["p_description"],
                                                                              p_quantity: data.docs[listview_index]["p_quantity"]
                                                                          );
                                                                        },
                                                                        )
                                                                        );
                                                                      }),

                                                                      Container(
                                                                        height: 250,
                                                                        width: 5,
                                                                        color: Colors.black,
                                                                      )


                                                                    ],
                                                                  );
                                                                }
                                                                ,
                                                                  separatorBuilder: (context, index) {
                                                                    return Divider(
                                                                      color: Colors.yellow,
                                                                      thickness: 10,
                                                                      height: 10,
                                                                    );
                                                                  },
                                                                  itemCount:snapshot.data!.docs.length,

                                                              
                                                              ),
                                                            );


                                                          }



                              }

                            ),



                     //     ],



                      //  ),




                      ),
                    ),




                  ],
                ),
              ),
            ),

          )
      ),

    );
  }
}
