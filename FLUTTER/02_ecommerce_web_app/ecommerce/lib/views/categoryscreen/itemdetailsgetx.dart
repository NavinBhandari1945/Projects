import 'package:get/get.dart';

class Itemdetailsgetx extends GetxController{
  RxInt quantity=0.obs;
  changequantity(value){
    this.quantity.value=value;
  }
}