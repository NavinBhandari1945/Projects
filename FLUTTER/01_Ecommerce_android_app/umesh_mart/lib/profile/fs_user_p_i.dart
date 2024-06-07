import 'dart:io';

import 'package:get/get.dart';
import 'package:umesh_mart/common_widget/toast.dart';
import 'package:umesh_mart/consts/consts.dart';

import 'change_photo_getx.dart';

class U_p_i extends GetxController{
  final changephoto_u_p_url_cont=Get.put(Changephoto());
  RxString image_url_p_scrn="".obs;
  Future u_p_i_url()async
  {
    final makedir = firestorage_ref.child(u_p_i_dir);
    final filename = makedir.child(current_u!.uid);
    try{
      final fileput=await filename.putFile(File(changephoto_u_p_url_cont.imagepath.value));
      this.image_url_p_scrn.value=await filename.getDownloadURL();
      print("new image url");
      print(this.image_url_p_scrn);
      print("stop");
    }catch(e){
      print("Exception caught while storing user profile photo in fire storage");
      print(e.toString());
      Toastget().Toastmsg(e.toString());
    }

  }
} 