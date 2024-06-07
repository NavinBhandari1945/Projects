import 'package:get/get.dart';

class Checkboxvalue extends GetxController{
  RxBool ischeck=false.obs;
  void checkvalue(new_value){
    this.ischeck.value=new_value;
  }
}