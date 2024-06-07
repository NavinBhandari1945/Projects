import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

FirebaseAuth auth= FirebaseAuth.instance;
FirebaseFirestore firestore=FirebaseFirestore.instance;
User? currentUser=auth.currentUser;

//collection
final usersCollection="users";
const cartcollection="cart";
const productcollection="products";
const chatcollectioin="chats";
const messagecollection='message';
