import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../product/Item_detail_creen.dart';
import 'admin_order_h_stream.dart';

class AdminOrderHistory extends StatefulWidget {
  const AdminOrderHistory({super.key});

  @override
  State<AdminOrderHistory> createState() => _AdminOrderHistoryState();
}

class _AdminOrderHistoryState extends State<AdminOrderHistory> {
  @override
  Widget build(BuildContext context) {
    var widthval=MediaQuery.of(context).size.width;
    var heightval=MediaQuery.of(context).size.height;
    var shortestval=MediaQuery.of(context).size.shortestSide;
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin order history screen",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
      body:

      StreamBuilder(
        stream:Admin_o_h_stream().getAdmin_o_h_stream(),
        builder: (context, AsyncSnapshot<QuerySnapshot>snapshot)
        {
          if (snapshot.hasError) {
            return Container(
              color: Colors.grey,
              height: heightval,
              width: widthval,
              child: Center(
                child: Text("Error occurred while retrieving data"),
              ),
            );
          }
          else if (!snapshot.hasData ) {
            return
              Container(
                color: Colors.grey,
                height: heightval,
                width: widthval,
                child: Center(
                  child: Text("There is no data",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              );
          }
          else if(snapshot.data!.docs.isEmpty){
            return
              Container(
                color: Colors.grey,
                height: heightval,
                width: widthval,
                child: Center(
                  child: Text("There is no document",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              );
          }
          else if
          (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              color: Colors.grey,
              height: heightval,
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
            print(snapshot.data!.docs.length);
            var data=snapshot.data;
            return
              ListView.separated(
                itemCount:data!.docs.length,
                itemBuilder:(context, index) {
                  return
                    Container(
                      color: Colors.grey,
                      child: ListTile(
                        title:Text("Product name : ${data!.docs[index]["p_name"]} ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ) ,

                        subtitle: Text("Order date : ${data!.docs[index]["order_date"]}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    );
                },
                separatorBuilder:(context, index) {
                  return Divider(
                    color: Colors.red,
                    thickness: 3,
                    height: 2,
                  );
                },
                scrollDirection: Axis.vertical,
              );

          }

        },
      ),


    );
  }
}
