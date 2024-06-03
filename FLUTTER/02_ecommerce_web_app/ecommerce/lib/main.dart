import 'package:ecommerce_1/consts/consts.dart';
import 'package:ecommerce_1/views/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
          apiKey: "AIzaSyCoVHgaExCmXKSc-JxE9ZHSgfyQB2Dlueg",
          projectId: "babadevs-ecommerce-practice1",
          messagingSenderId: "296669074978",
          appId: "1:296669074978:web:c061b86c72f01b50201c7b",
    )
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.green,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.green),
        fontFamily: regular,
        // primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
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
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:
        Container(
        )
    );
  }
}
