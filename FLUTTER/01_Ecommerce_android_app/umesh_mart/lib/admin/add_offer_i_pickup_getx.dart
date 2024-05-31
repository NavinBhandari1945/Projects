import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';

class Pick_offer_image extends GetxController{
  List image_file=[].obs;
  List image_paths=[].obs;
  pick_o_i() async{
    final pickimage=ImagePicker();
    image_file=await pickimage.pickMultiImage();
    if(image_file!=null && image_file.isNotEmpty) {
      for(XFile image_f in image_file){
        image_paths.add(image_f.path.toString());
      }

    }

  }

}