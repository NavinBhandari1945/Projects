import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:umesh_mart/common_widget/toast.dart';

// class Pick_image_aps  extends GetxController{
//   RxString imagePath = ''.obs;
//   Pick_image_m()async
//   {
//
//     final imagePicker = ImagePicker();
//     final pickImage =await imagePicker.pickImage(source: ImageSource.camera);
//     if(pickImage!=null)
//       {
//         this.imagePath.value=pickImage.path.toString();
//       }
//
//   }
// }

//rough multi image picker
class Pick_image_aps  extends GetxController{

  // RxString imagePath = ''.obs;

  List pick_images=[].obs;
  List images_path=[].obs;

  Pick_image_m()async
  {

     final imagePicker = ImagePicker();
     pick_images=await imagePicker.pickMultiImage();
    if(pick_images!=null || pick_images.isNotEmpty){
       for(XFile file in pick_images){
         images_path.add(file.path.toString());
       }
     }else{
       Toastget().Toastmsg("Images has not been picked");
     }

  }
}
// navinbhandari2002@gmail.com