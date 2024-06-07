import 'package:cloud_firestore/cloud_firestore.dart';

class Snapshots_featured_products{
  static getFeaturedItems(){
    return FirebaseFirestore.instance.collection("Products").snapshots();
  }
}
