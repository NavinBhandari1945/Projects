import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:umesh_mart/consts/consts.dart';

class User_o_h_s{
  getOh(uid){
    return FirebaseFirestore.instance.collection("orders").doc(uid).collection("os").snapshots();
  }
}