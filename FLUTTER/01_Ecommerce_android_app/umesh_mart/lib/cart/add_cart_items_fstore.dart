import 'package:cloud_firestore/cloud_firestore.dart';

import '../consts/consts.dart';

class Add_item_fstore{
  add_i_fstore(
      {
        required p_url,
        required p_name,
        required p_price,
        required p_id,
        required p_color,
        required p_description,
        required p_quantity
      }
      ){

     FirebaseFirestore.instance.collection(carts).doc(current_u!.uid).collection(nested_c_2).doc(p_id).set({
       "p_url":p_url,
       "p_name":p_name,
       "p_price":p_price,
       "p_id":p_id,
       "p_color":p_color,
       "p_description":p_description,
       "p_quantity":p_quantity
     });
  }
}