import 'package:get/get.dart';

class Userdetails extends GetxController{
  RxString user_name = "".obs;
  RxString user_email = "".obs;
  RxString cart_count = "".obs;
  RxString order_count = "".obs;
  RxString wishlist_count = "".obs;
  void detailschange(user_name,user_email,cart_count,order_count,wishlist_count)
  {
  this.user_name.value=user_name;
  this.user_email.value=user_email;
  this.cart_count.value=cart_count;
  this.order_count.value=order_count;
  this.wishlist_count.value=wishlist_count;
  }
}