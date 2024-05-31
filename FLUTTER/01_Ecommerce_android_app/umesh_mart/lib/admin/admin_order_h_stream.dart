import 'package:cloud_firestore/cloud_firestore.dart';

class Admin_o_h_stream{


  getAdmin_o_h_stream(){
    return FirebaseFirestore.instance.collection("admin_orders").snapshots();
  }


}