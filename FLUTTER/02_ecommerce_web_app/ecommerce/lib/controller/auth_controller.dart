import 'package:ecommerce_1/consts/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../consts/firebaseconst.dart';

class Authcontroller extends GetxController
{
  RxBool isloading=false.obs;
  loading(value){
    this.isloading.value=value;
  }
  Future<UserCredential?>loginmethod(email,password,context) async
  {
    UserCredential? userCredential;
    try
    {
      await auth.signInWithEmailAndPassword(
          email: email,
          password: password,
      );
    }
    on FirebaseAuthException catch(o)
    {
      VxToast.show(
          context,
          msg: o.toString()
      );
    }
    return userCredential;
  }

  Future<UserCredential?>Signupmethod(email,password,context) async
  {
    UserCredential? userCredential;
    try
    {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    }
    on FirebaseAuthException catch(o)
    {
      VxToast.show(
          context,
          msg: o.toString()
      );
    }
    return userCredential;
  }

  storedata(name,password,email,id)async
  {
    final store=await firestore.collection(usersCollection).doc(currentUser!.uid);
    store.set({
      "name":name,
      "password":password,
      "email":email,
      "imageUrl":"",
      "id":currentUser!.uid,
      "cart_count":"222",
      "order_count":"333",
      "wishlist_count":"4444",
    });
  }

  //signout method
signout(context) async
{
  try{
    await auth.signOut();
  }catch(e){
    VxToast.show
      (
        context,
        msg: e.toString()
    );
  }

}

}