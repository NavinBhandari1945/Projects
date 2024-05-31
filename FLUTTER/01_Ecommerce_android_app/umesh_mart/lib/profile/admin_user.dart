import 'package:umesh_mart/consts/consts.dart';

class Admin_user{
  getAdmin(){
    return firestoreinst.collection(admin_colle).snapshots();
  }
}