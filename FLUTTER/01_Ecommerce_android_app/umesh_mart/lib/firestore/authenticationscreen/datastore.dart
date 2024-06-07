// import 'package:umesh_mart/common_widget/toast.dart';
// import 'package:umesh_mart/consts/consts.dart';
// class Userdata{
//   void user_signup_data(user_name,user_email,user_address) async{
//     try {
//       await firestoreinst.collection(usercolle).doc(auth.currentUser!.uid).set({
//         "name": user_name,
//         "email": user_email,
//         "address": user_address,
//         "id": auth.currentUser!.uid,
//         "image_url": "",
//       });
//     }catch(e){
//       print("exception caught");
//       print("exception caught while filling signup form");
//       Toastget().Toastmsg(e.toString());
//     }
//   }
// }

//rough
import 'package:umesh_mart/common_widget/toast.dart';
import 'package:umesh_mart/consts/consts.dart';
class Userdata{
  void user_signup_data(user_name,user_email,user_address) async{
    try {
      await firestoreinst.collection(usercolle).doc(auth.currentUser!.uid).set({
        "name": user_name,
        "email": user_email,
        "address": user_address,
        "id": auth.currentUser!.uid,
        "image_url":"",
      });
    }catch(e){
      print("exception caught");
      print("exception caught while filling signup form");
      Toastget().Toastmsg(e.toString());
    }
  }
}