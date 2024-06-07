import 'package:cloud_firestore/cloud_firestore.dart';


class O_i_stream_snapshot{
  getsnapshot(){
    return FirebaseFirestore.instance.collection("offers").snapshots();
  }
}