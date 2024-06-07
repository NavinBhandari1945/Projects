import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:umesh_mart/consts/consts.dart';

class Remove_cart_items{
  remove_c_i({required p_id}){
    return FirebaseFirestore.instance.collection(carts).doc(current_u!.uid).collection(nested_c_2).doc(p_id).delete();
  }
}