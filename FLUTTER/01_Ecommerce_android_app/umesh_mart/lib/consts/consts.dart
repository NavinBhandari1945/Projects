import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
//authentication screen,signinscreen auth
var auth=FirebaseAuth.instance;
//firebase firestore instance
var firestoreinst=FirebaseFirestore.instance;
//user collection name
var usercolle="users";
//products collection name of firestore
var products_colle="Products";
//
var current_u=auth!.currentUser;
//images path
//home_1 screen
const iconCart = "assets/icons/cart.png";
const iconHome = "assets/icons/home.png";
const iconProduct = "assets/icons/categories.png";
const iconProfile = "assets/icons/profile.png";
//home_2 screen
const offer15="assets/images/offers/offer15.jpg";
const superdiscount="assets/images/offers/superdiscount.jpg";
const discount="assets/images/offers/discount.png";
//user 1 profile picture
// const u_p_p_1="assets/images/profile/user_p_p_1/u_p_p_1.jpg";
const u_p_p_3="assets/images/profile/user_p_p_1/u_p_p_3.png";
//images path store list
//Home_2 screen
var swiperimg=[offer15,superdiscount,discount];
//admin
//add product
//firestorage reference
var firestorage_ref=FirebaseStorage.instance.ref();
//firebase storage images products folder
const dir_n_p_i="products image";
//firebase storage user profile image  folder
const u_p_i_dir="users profile image";
//admin user collection name
const admin_colle='admin';
const admin_doc="admin_doc";
//firestore offer image
const offer='Offers';
//cart screen
//add cart item in firestore
const carts='Carts';
const nested_c_2='c_items';


//rough
var products_colle1="Products1";





