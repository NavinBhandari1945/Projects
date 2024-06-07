import 'package:get/get.dart';
class Checkboxval extends GetxController {
  RxBool ischeck=false.obs;
  changecbval(value){
    this.ischeck.value=value;
  }
}