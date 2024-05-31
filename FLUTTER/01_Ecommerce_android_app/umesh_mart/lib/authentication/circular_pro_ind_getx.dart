import 'package:get/get.dart';

class Isloading extends GetxController{
  RxBool isloading=false.obs;
   change_isloadingval(changeval){
    this.isloading.value=changeval;
  }
}