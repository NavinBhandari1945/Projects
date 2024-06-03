import 'package:ecommerce_1/consts/consts.dart';
import 'package:ecommerce_1/consts/firebaseconst.dart';
import 'package:ecommerce_1/models/category_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Productcontroller extends GetxController{
  getSubCategories()async{
    var data=await rootBundle.loadString("lib/views/services/category_model.json");
    var decoded=categorymodelFromJson(data);
  }
  addtocart(tittle,img,sellername,color,qty,tprice,context)async{
    await firestore.collection(cartcollection).doc().set({
        "tittle":tittle,
        "img":img,
        "sellername":sellername,
        "color":color,
        "qty":qty,
      "tprice":tprice,
      "added_by":currentUser!.uid,
    }).catchError((error){
      VxToast.show(context, msg:error.toString());
    });
  }
}