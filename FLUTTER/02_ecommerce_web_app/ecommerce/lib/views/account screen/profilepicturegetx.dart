import 'package:ecommerce_1/consts/consts.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
class profilechange extends GetxController{
  RxString imagepath="".obs;
  changeimage(context) async
  {
    try
    {
      final img=await ImagePicker().pickImage(
          source: ImageSource.camera,imageQuality: 70,);
      if(img==null){
        return;
      }
      else{
        this.imagepath.value=img.path;
      }
    } on PlatformException catch(eo)
    {
          VxToast.show(context,
              msg:eo.toString());
    }
  }
}