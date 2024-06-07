import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:umesh_mart/Home/home_1.dart';
import 'package:umesh_mart/consts/consts.dart';
import 'authentication/authenticationscreen.dart';
import 'firebase_options.dart';

// rupakchhtri@gmail.com
// rupak111

void main() async{
   WidgetsFlutterBinding.ensureInitialized(); // Ensure that Flutter is initialized.
   await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform,
   ); // Initialize Firebase.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.grey),
        // primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(
          seconds:1,
        ),
            () {
          if(current_u!=null)
            {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) =>Home_1() ,)
              );
            }else
            {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) =>Authenticationscreen() ,)
            );
          }
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    var widthval=MediaQuery.of(context).size.width;
    var heightval=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:Text("Welcome Screen"),
      ),
      body:
      Container(
        color: Colors.black,
        width: widthval,
        height:heightval,
        child:
        Center(
            child:
            Container(
              width: 250,
              height:270,
              child:Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: double.infinity,
                      height:200,
                      child: Image.asset("assets/images/authenticationscreen/shopping_bag.jpg",
                        fit:BoxFit.fill ,)),
                  Container(
                      width: double.infinity,
                      height: 20,
                      child:
                      Align(
                        alignment: Alignment.center,
                        child: Text("Welcome to khadka mart",
                          style:TextStyle(
                            color: Colors.white,
                            fontSize:20,
                          ) ,),
                      )),
                ],
              ),
            )
        ),
      ),
    );
  }
}
