import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:umesh_mart/consts/consts.dart';
import 'package:umesh_mart/consts/styles.dart';
import 'package:velocity_x/velocity_x.dart';

import 'Item_detail_creen.dart';

// 1 user
// anjan123@gmail.com
// anjan123
// navinbhandari2002@gmail.com
// navin123
// rupakchhtri@gmail.com
// rupak123

class Productscreen extends StatefulWidget {
  const Productscreen({Key? key}) : super(key: key);

  @override
  State<Productscreen> createState() => _ProductscreenState();
}

class _ProductscreenState extends State<Productscreen> {
  final products_cont=firestoreinst.collection(products_colle).snapshots();
  final search_cont=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var widthval=MediaQuery.of(context).size.width;
    var heightval=MediaQuery.of(context).size.height;
    var shortestval=MediaQuery.of(context).size.shortestSide;
    return Scaffold(
      appBar: AppBar(
        title: Text("productscreen"),
      ),
      body:
      StreamBuilder(
        stream: products_cont,
        builder: (context,AsyncSnapshot<QuerySnapshot>snapshot)
        {
          if(!snapshot.hasData)
          {
            return Center(
              child:
            Text("There is no data")
            );
          }
          else if(snapshot.data!.docs.isEmpty){
            return
                Center(
                  child: Text("There is no document"),
                );
          }
          else if(snapshot.hasError){
            return Center(
              child: Text('snapshot has error'),);
          }
          else if(snapshot.connectionState==ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(
                Colors.red,
              ),
            ),
            );
          }
          else
          {
            var data=snapshot.data;
            return

              Container (
                color: Colors.green,
                height: heightval,
                child:
                Column(
                  children:
                  [

                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextFormField(
                          onChanged: (value) {
                            setState(() {

                            });
                          },
                          controller: search_cont,
                          obscureText: false,
                          decoration:InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black,
                                  width: shortestval*0.01
                              ),
                              borderRadius: BorderRadius.circular(shortestval*0.04),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black,
                                width: shortestval*0.01
                              ),
                              borderRadius: BorderRadius.circular(shortestval*0.04),
                            ),
                            hintText: "Search",
                            prefixIcon: Icon(Icons.search),
                          )
                      ),
                    ),

                    SizedBox(
                      height: heightval*0.01,
                    ),

                    Expanded(
                      child: Container(
                        height:heightval*(0.7670),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                        ),
                        child:
                        Column(
                            children:
                            [

                              Expanded(
                                child: GridView.builder(
                                  shrinkWrap: true,
                                  itemCount:
                                  snapshot.data!.docs.length,
                                  // search_cont.text.toString().toLowerCase().isEmpty?snapshot.data!.docs.length:1,
                                  gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: shortestval*(0.03),
                                    mainAxisSpacing: shortestval*(0.03),
                                    mainAxisExtent: heightval*0.40,
                                  ) ,
                                  itemBuilder:(context, index) {
                                    // return
                                    if(search_cont.text.isEmpty)
                                    {
                                      return

                                        Container (
                                         color: Colors.grey,
                                          child: Column(
                                            children:
                                            [

                                              Expanded(
                                                child: Container(
                                                  height: heightval*(0.29),
                                                  color: Colors.grey,
                                                  child:
                                                  PageView.builder(
                                                    itemCount:data!.docs[index]["p_url"].length ,
                                                    itemBuilder: (context, pageindex) {
                                                      return
                                                        Image.network (
                                                            data!.docs[index]["p_url"][pageindex],
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
                                                                    height: heightval*0.10,
                                                                    color: Colors.grey,
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
                                                              return
                                                                Center(
                                                                  child: Container(
                                                                  // You can replace this Container with any widget you prefer as a fallback
                                                                  width: double.infinity,
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
                                                                width: double.infinity,
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

                                              Container(
                                                // color: Colors.black,
                                                height: heightval*(0.03),
                                                child: Text("${data.docs[index]["p_name"]}",
                                                  style: TextStyle(
                                                    fontFamily: semibold,
                                                    fontSize: shortestval*0.04,
                                                  ),
                                                ),
                                              ),
                                              // ),
                                              // Expanded(
                                              //   child:

                                              Container(
                                                // color: Colors.yellow,
                                                height: heightval*(0.03),
                                                child: Text("NRS."+"${data.docs[index]["p_price"]}",
                                                  style: TextStyle(
                                                    fontFamily: semibold,
                                                    fontSize: shortestval*0.04,
                                                  ),
                                                ),
                                              ),
                                              // ),
                                            ],
                                          ),
                                        ).onTap(() {
                                          Navigator.push (context,
                                              MaterialPageRoute(builder: (context) {
                                                return Item_detail_screen(
                                                    p_url: data.docs[index]["p_url"],
                                                    p_name: data.docs[index]["p_name"],
                                                    p_description: data.docs[index]["p_description"],
                                                    p_id: data.docs[index]["p_id"],
                                                    p_color: data.docs[index]["p_color"],
                                                    p_price: data.docs[index]["p_price"],
                                                    p_quantity: data.docs[index]["p_quantity"]
                                                );
                                              },
                                              )
                                          );

                                        }
                                        );

                                    }else if(data!.docs[index]["p_name"].toString().toLowerCase().contains(search_cont.text.toString().toLowerCase().trim()))
                                    {
                                      return
                                        Container (
                                          color: Colors.grey,
                                          child: Column(
                                            children:
                                            [

                                              Expanded(
                                                child: Container(
                                                  height: heightval*(0.29),
                                                  child:
                                                  PageView.builder(
                                                    itemCount:data!.docs[index]["p_url"].length ,
                                                    itemBuilder: (context, pageindex) {
                                                      return      Image.network(
                                                        data!.docs[index]["p_url"][pageindex],
                                                        fit: BoxFit.fill,
                                                      );
                                                    },
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ),



                                              Container(
                                                // color: Colors.black,
                                                height: heightval*(0.03),
                                                child: Text("${data.docs[index]["p_name"]}",
                                                  style: TextStyle(
                                                    fontFamily: semibold,
                                                    fontSize: shortestval*0.04,
                                                  ),
                                                ),
                                              ),
                                              // ),
                                              // Expanded(
                                              //   child:

                                              Container(
                                                // color: Colors.yellow,
                                                height: heightval*(0.03),
                                                child: Text("${data.docs[index]["p_price"]}",
                                                  style: TextStyle(
                                                    fontFamily: semibold,
                                                    fontSize: shortestval*0.04,
                                                  ),
                                                ),
                                              ),
                                              // ),
                                            ],
                                          ),
                                        ).onTap(() {

                                          Navigator.push (context,
                                              MaterialPageRoute(builder: (context) {
                                                return
                                                  Item_detail_screen(

                                                      p_url: data.docs[index]["p_url"],
                                                      p_name: data.docs[index]["p_name"],
                                                      p_description: data.docs[index]["p_description"],
                                                      p_id: data.docs[index]["p_id"],
                                                      p_color: data.docs[index]["p_color"],
                                                      p_price: data.docs[index]["p_price"],
                                                      p_quantity: data.docs[index]["p_quantity"]

                                                  );
                                              },
                                              )
                                          );

                                        });

                                    } else
                                    {
                                      return
                                        Center(
                                            child:Container(
                                              child: Text("Item doesn't found",
                                                style: TextStyle(
                                                  fontFamily: semibold,
                                                  fontSize: shortestval*0.05,
                                                ),
                                              ),
                                            )
                                        );
                                    }

                                  },
                                ),
                              ),

                            ]
                        ),
                      ),
                    ),

                  ],
                ),
              );




            // );

          }
        },
      ),

    );
  }
}

