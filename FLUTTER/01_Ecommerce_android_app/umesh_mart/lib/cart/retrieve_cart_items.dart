import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:umesh_mart/consts/consts.dart';

class Retrieve_cart_i{
  get_c_i(){
    return FirebaseFirestore.instance.collection(carts).doc(current_u!.uid)
        .collection(nested_c_2).snapshots();
  }
}