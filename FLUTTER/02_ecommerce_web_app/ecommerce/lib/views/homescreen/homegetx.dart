import 'package:get/get.dart';

class Homescreengetx extends GetxController{
  var currentnavindex=0.obs;
  void currentnavindexvalue(navindex){
    this.currentnavindex.value=navindex;
  }
}