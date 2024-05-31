import 'package:umesh_mart/consts/consts.dart';

class Remove_product{
  Fstorage_rp(filename)
  {
     firestorage_ref.child(dir_n_p_i).child(filename).delete();
     firestoreinst.collection(products_colle).doc(filename).delete();
  }
}