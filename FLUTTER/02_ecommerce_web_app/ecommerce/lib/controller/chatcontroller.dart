import 'package:ecommerce_1/consts/firebaseconst.dart';
import 'package:get/get.dart';

import '../views/account screen/user_detailsgetx.dart';

class Chatcontroller extends GetxController{
  final userdetailscontroller=Get.put(Userdetails());
  var chats=firestore.collection(chatcollectioin);
  var friendname=Get.arguments[0];
  var friendid=Get.arguments[1];
  var currentid=currentUser!.uid;
  late var sendername;
  Chatcontroller() {
    // Initialize sendername in the constructor
    sendername = userdetailscontroller.user_name.value;
  }
}