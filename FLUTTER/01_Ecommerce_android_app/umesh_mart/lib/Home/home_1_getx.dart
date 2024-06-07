import 'package:get/get.dart';
class Home_1_getx extends  GetxController{
  var currentIndexVal=0.obs;
  changeindexval(indexval){
    this.currentIndexVal.value=indexval;
  }
}