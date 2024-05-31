import 'dart:io';
import 'package:get/get.dart';
import 'package:umesh_mart/admin/pick_image_getx.dart';
import 'package:umesh_mart/admin/product_id_getx.dart';
import 'package:umesh_mart/common_widget/toast.dart';
import 'package:umesh_mart/consts/consts.dart';

// class Fstrg_image extends GetxController
// {
//   final pick_image_aps_cont=Get.put(Pick_image_aps());
//   final p_id_obj_fs=Get.put(Product_id());
//   RxString image_url=''.obs;
//   Store_image()async
//   {
//     final makedir=firestorage_ref.child("products images");
//     final makefile=makedir.child("${p_id_obj_fs.idval.value}");
//     try {
//       final put_image=await makefile.putFile(File(pick_image_aps_cont.imagePath.value));
//       this.image_url.value=await makefile.getDownloadURL();
//         }catch(e)
//             {
//               print("Exceptiion caught on storing add product image in firestoage\n"+e.toString());
//               Toastget().Toastmsg(e.toString());
//             }
//   }
// }

//rough
class Fstrg_image extends GetxController
{
  final pick_image_aps_cont=Get.put(Pick_image_aps());
  final p_id_obj_fs=Get.put(Product_id());
  RxList image_url=[].obs;
  Store_image()async
  {

    final makedir=firestorage_ref.child("products images");
    final makefile=makedir.child("${p_id_obj_fs.idval.value}");
    try {
      for(String i_path in pick_image_aps_cont.images_path){
        String image_name="${p_id_obj_fs.idval.value}_"+DateTime.now().millisecondsSinceEpoch.toString();
        final makefile_n=makefile.child(image_name);
        await makefile_n.putFile(File(i_path));
        final d_url=await makefile_n.getDownloadURL();
        image_url.value.add(d_url);
      }
        }catch(e)
            {
              print("Exceptiion caught on storing add product image in firestoage\n"+e.toString());
              Toastget().Toastmsg(e.toString());
            }

  }
}
