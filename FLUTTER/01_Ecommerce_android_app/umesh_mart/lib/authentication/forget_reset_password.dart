import 'package:umesh_mart/common_widget/toast.dart';

import '../consts/consts.dart';

class Resetpassword{
  void Sendlink (email_val)async{
    try{
      await  auth.sendPasswordResetEmail(email: email_val.text.toString());
    }catch(exception_obj){
      Toastget().Toastmsg(exception_obj.toString());
    }
  }
}