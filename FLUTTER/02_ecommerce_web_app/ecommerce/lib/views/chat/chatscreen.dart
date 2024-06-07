import 'package:ecommerce_1/consts/consts.dart';
import 'package:ecommerce_1/views/chat/components/bubbke_sender.dart';
import 'package:flutter/material.dart';

class Chatscreen extends StatelessWidget {
  const Chatscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widthval=MediaQuery.of(context).size.width;
    final shortval=MediaQuery.of(context).size.shortestSide;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: "tittle".text.color(Colors.black).fontFamily(semibold).size(25.0).make(),
      ),
      body:
      Padding(
        padding: EdgeInsets.all(shortval*0.05),
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.blue,
                child: ListView(
                  children: [
                    Bubble(),
                    Bubble(),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(child: TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                    )
                  ),
                )
                ),
                IconButton(
                    onPressed:(){},
                    icon: Icon(Icons.send))
              ],
            ).box.padding(EdgeInsets.all(12)).height(widthval*0.15).make(),
          ],
        ),
      ),
    );
  }
}
