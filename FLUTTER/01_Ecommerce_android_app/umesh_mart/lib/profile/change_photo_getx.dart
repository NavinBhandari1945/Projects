import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Changephoto extends GetxController{
  RxString imagepath="".obs;
  Future imagepick() async{
    final imagepicker=ImagePicker();
    final image=await imagepicker.pickImage(source: ImageSource.gallery);
    if(image != null){
      this.imagepath.value=image.path.toString();
    }
  }
}