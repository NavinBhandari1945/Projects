import 'package:umesh_mart/consts/consts.dart';

class user_details{
  getUser(uid)
  {
    return firestoreinst.collection(usercolle).where("id",isEqualTo:uid).snapshots();
  }
}