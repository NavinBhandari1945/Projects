import 'package:ecommerce_1/consts/firebaseconst.dart';

class Firestoreservices{
  static getuser(uid){
    return firestore.collection(usersCollection).where("id",isEqualTo: uid).snapshots();
  }
}