import 'package:flutter/material.dart';

class Cartscreen extends StatefulWidget {
  const Cartscreen({Key? key}) : super(key: key);

  @override
  State<Cartscreen> createState() => _CartscreenState();
}

class _CartscreenState extends State<Cartscreen> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: Text("Cart SCREEN"),
        ),
        body: Container(),
      );
  }
}
