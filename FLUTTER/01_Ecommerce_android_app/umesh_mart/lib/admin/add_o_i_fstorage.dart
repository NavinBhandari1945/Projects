import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:umesh_mart/common_widget/toast.dart';
import 'add_offer_i_pickup_getx.dart';

class Add_o_i_fstorage extends GetxController{
  final pick_offer_image_cont=Get.put(Pick_offer_image());
  RxList o_i_url=[].obs;

  downloadurl_o_i() async{
    try {
      final fstorage_ref = FirebaseStorage.instance.ref();
      final makedir = fstorage_ref.child("offers");
      final makefile1=makedir.child("images");
      for (String imagepath in pick_offer_image_cont.image_paths) {
        final filename = DateTime
            .now()
            .millisecondsSinceEpoch
            .toString();
        final makefile =makefile1.child(filename);
        await makefile.putFile(File(imagepath));
        final d_url = await makefile.getDownloadURL();
        o_i_url.value.add(d_url);
      }
    }catch( e){
      print("exception found while adding offer image in firestorage");
      Toastget().Toastmsg(e.toString());
    }

  }
}
