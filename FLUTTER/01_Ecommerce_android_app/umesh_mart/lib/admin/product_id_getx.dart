import 'package:get/get.dart';

class Product_id extends GetxController{
  RxString idval=''.obs;
  changeid(id)
  {
    this.idval.value=id;
  }
}