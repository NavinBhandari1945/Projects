import 'package:get/get.dart';
import 'package:umesh_mart/consts/consts.dart';

import '../common_widget/toast.dart';
import 'fs_user_p_i.dart';

class Save_fstore{
  final u_p_i_cont=Get.put(U_p_i());
  Future save_fstore_i_url(uid)async{
    try {
      await firestoreinst.collection(usercolle).doc(uid).update({
        "image_url": u_p_i_cont.image_url_p_scrn.value.toString(),
      });
    }catch(e){
      print("exception caught");
      print("exception caught while updating image url after clicking change photo");
      Toastget().Toastmsg(e.toString());
    }
  }
}