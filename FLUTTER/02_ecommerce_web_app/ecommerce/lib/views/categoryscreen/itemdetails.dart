// import 'package:ecommerce_1/consts/colors.dart';
// import 'package:ecommerce_1/consts/consts.dart';
// import 'package:ecommerce_1/widgets_common/our_button.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class Itemdetails extends StatefulWidget {
//   final String? title;
//   const Itemdetails({Key? key,required this.title}) : super(key: key);
//
//   @override
//   State<Itemdetails> createState() => _ItemdetailsState();
// }
//
// class _ItemdetailsState extends State<Itemdetails> {
//   @override
//   Widget build(BuildContext context) {
//     final widthval=MediaQuery.of(context).size.width;
//     final heightval=MediaQuery.of(context).size.height;
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: IconThemeData(
//           color: darkFontGrey,
//         ),
//         title: Text("${widget.title}",style: TextStyle(fontFamily: semibold,color: darkFontGrey),),
//         actions: [
//           IconButton(onPressed: (){}, icon:Icon(Icons.share,color: darkFontGrey,)),
//           IconButton(onPressed: (){}, icon:Icon(Icons.favorite_outline,color: darkFontGrey,)),
//         ],
//       ),
//       body:
//       //1st parent
//       SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         physics: AlwaysScrollableScrollPhysics(),
//         child: Container(
//           width: widthval,
//           color: Colors.blue,
//           child: Column(
//             children: [
//               //1st child of 1st parent
//               Padding(
//                 padding: EdgeInsets.all(widthval*(8/1920)),
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   physics: AlwaysScrollableScrollPhysics(),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                           width: widthval,
//                           height: widthval*(350/1920),
//                         child: VxSwiper.builder(
//                            autoPlay: true,
//                             // height: widthval*(350/1920),
//                             aspectRatio: 16/9,
//                             itemCount: 3,
//                             itemBuilder: (context, index) =>
//                           Container(
//                             width: widthval*(300/1920),
//                             height:widthval*(300/1920) ,
//                             child: Image.asset(
//                               imgFc5,
//                               width: double.infinity,
//                               fit: BoxFit.fill,
//                             ),
//                           )
//                           ,),
//                       ),
//                       (widthval*(10/1920)).heightBox,
//                       Text("${widget.title}",
//                         style: TextStyle(
//                             fontFamily: bold,
//                             color: darkFontGrey),
//                       ),
//                       (widthval*(10/1920)).heightBox,
//                       VxRating(
//                           onRatingUpdate:(value) {
//
//                           },
//                       normalColor: textfieldGrey,
//                         selectionColor: Vx.orange50,
//                         count: 5,
//                         stepInt: true,
//                         size:widthval*(25/1920) ,
//                       ),
//                       (widthval*(10/1920)).heightBox,
//                       "\$300".text.color(Colors.red).fontFamily(bold).size(widthval*(30/1920)).make(),
//                       (widthval*(10/1920)).heightBox,
//                       Row (
//                         children: [
//                           Expanded(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "seller",
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontFamily:semibold,
//                                     fontSize: widthval * (30 / 1920),
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                                 (widthval*(5/1920)).heightBox,
//                                 Text(
//                                   "in house brand",
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontFamily:semibold,
//                                     fontSize: widthval * (30 / 1920),
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           CircleAvatar(
//                             backgroundColor: Colors.white,
//                             radius:widthval*((65/1920)+0.009),
//                             child: Icon(
//                                 Icons.message_rounded,
//                             color: darkFontGrey,
//                             ),
//                           )
//                         ],
//                       ).box.height((widthval*((65/1920)+0.009))).width(widthval).color(textfieldGrey).make(),
//                     ],
//                   ),
//                 ),
//               ),
//               (widthval*(20/1920)).heightBox,
//               Row (
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   //1 child
//                   Expanded(
//                     child: Container(
//                       child: "Color".text.color(textfieldGrey).size(widthval*(30/1920)).make(),
//                     ),
//                   ),
//                   //2nd child
//                   Expanded(
//                     child: Align(
//                       alignment: Alignment.center,
//                       child: Row (
//                         children: List.generate(3, (index) =>
//                         VxBox().size(widthval*(40/1920), widthval*(40/1920)).roundedFull.color(Vx.randomPrimaryColor).margin(EdgeInsets.all(widthval*(10/1920))).make()
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ).box.padding(EdgeInsets.all(widthval*(10/1920))).margin(EdgeInsets.all(widthval*(4/1920))).make().box.shadowSm.make(),
//               (widthval*(5/1920)).heightBox,
//               Row (
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Expanded(child: Container(child: "Quantity".text.size(widthval*(30/1920)).color(darkFontGrey).fontFamily(semibold).make())),
//                   Expanded(
//                     child: Align(
//                       alignment: Alignment.center,
//                       child: Row(
//                        children: [
//                          IconButton(onPressed: (){}, icon: Icon(Icons.add)),
//                          "0".text.size(widthval*(30/1920)).color(darkFontGrey).fontFamily(semibold).make(),
//                          IconButton(onPressed: (){}, icon: Icon(Icons.remove)),
//                        ],
//                       ),
//                     ),
//                   ),
//                   Container(margin:EdgeInsets.only(left: widthval*(20/1920),right:widthval*(5/1920) ),
//                       child: "0 availability".text.size(widthval*(30/1920))
//                           .color(darkFontGrey).fontFamily(semibold).make()),
//             ],
//           ),
//               (widthval*(5/1920)).heightBox,
//               Row (
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   "Total".text.fontFamily(semibold).color(darkFontGrey).size(widthval*(30/1920)).make(),
//                   "\$50".text.fontFamily(semibold).color(darkFontGrey).size(widthval*(30/1920))
//                       .make().box.margin(EdgeInsets.only(left: widthval*(50/1920))).make(),
//                 ],
//               ),
//               (widthval*(5/1920)).heightBox,
//               "Description".text.fontFamily(semibold).color(darkFontGrey).size(widthval*(30/1920)).make().box.alignCenterLeft.make(),
//               (widthval*(5/1920)).heightBox,
//               "this is dummy description".text.fontFamily(semibold).color(darkFontGrey).size(widthval*(30/1920)).make().box.alignCenterLeft.make(),
//               (widthval*(5/1920)).heightBox,
//               Container(
//                 height: widthval*((275/1920)+0.009),
//                 width: widthval,
//                 child: ListView(
//                   physics: AlwaysScrollableScrollPhysics(),
//                   children:List.generate(video.length, (index) =>
//                   ListTile(
//                     title: "${video[index]}".text.size(widthval*(30/1920)).make(),
//                     trailing:Icon(
//                         size: widthval*(50/1920),
//                         Icons.arrow_forward) ,
//                   )),
//                 ),
//               ),
//               Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text("Product you may like also",style: TextStyle(fontFamily: semibold,fontSize: widthval*(30/1920)),)),
//               (widthval*(5/1920)).heightBox,
//               Row(
//                 children: [
//                   Expanded(
//                     child: SizedBox(
//                       height: widthval*(73/1920),
//                       child: ourbutton(Colors.grey, whiteColor,"Add To Cart",(){},widthval),
//                     ),
//                   ),
//                   Expanded(
//                     child: SizedBox(
//                       height: widthval*(73/1920),
//                       child: ourbutton(Colors.black, whiteColor,"Add To Cart",(){},widthval),
//                     ),
//                   ),
//
//                 ],
//               )
//
//
//
//       ]
//         ),
//       )
//       ),
//     );
//   }
// }
//
import 'package:ecommerce_1/consts/colors.dart';
import 'package:ecommerce_1/consts/consts.dart';
import 'package:ecommerce_1/controller/productcontroller.dart';
import 'package:ecommerce_1/views/chat/chatscreen.dart';
import 'package:ecommerce_1/widgets_common/our_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'itemdetailsgetx.dart';

class Itemdetails extends StatefulWidget {
  final String? title;
  const Itemdetails({Key? key,required this.title}) : super(key: key);

  @override
  State<Itemdetails> createState() => _ItemdetailsState();
}

class _ItemdetailsState extends State<Itemdetails> {
  @override
  Widget build(BuildContext context) {
    print(Colors.purple.value);
    print(Colors.red.value);
    print(Colors.orange.value);
    final widthval=MediaQuery.of(context).size.width;
    final heightval=MediaQuery.of(context).size.height;
    final shortest=MediaQuery.of(context).size.shortestSide;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: darkFontGrey,
        ),
        title: Text("${widget.title}",style: TextStyle(fontFamily: semibold,color: darkFontGrey),),
        actions: [
          IconButton(onPressed: (){}, icon:Icon(Icons.share,color: darkFontGrey,)),
          IconButton(onPressed: (){}, icon:Icon(Icons.favorite_outline,color: darkFontGrey,)),
        ],
      ),
      body:
      //1st parent
      SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: AlwaysScrollableScrollPhysics(),
          child: Container(
            width: widthval,
            color: Colors.blue,
            child: Column(
                children: [
                  //1st child of 1st parent
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: widthval,
                        height: heightval*(400/1920),
                        child: VxSwiper.builder(
                          autoPlay: true,
                          // height: widthval*(350/1920),
                          aspectRatio: 16/9,
                          itemCount: 3,
                          itemBuilder: (context, index) =>
                              Container(
                                width: widthval*(350/1920),
                                height:heightval*(350/1920) ,
                                child: Image.asset(
                                  imgFc5,
                                  width: double.infinity,
                                  fit: BoxFit.fill,
                                ),
                              )
                          ,),
                      ),
                      (shortest*(30/1920)).heightBox,
                      Text("${widget.title}",
                        style: TextStyle(
                            fontFamily: bold,
                            color: darkFontGrey),
                      ),
                      (shortest*(30/1920)).heightBox,
                      VxRating(
                        onRatingUpdate:(value) {

                        },
                        normalColor: textfieldGrey,
                        selectionColor: Vx.orange50,
                        count: 5,
                        stepInt: true,
                        size:shortest*(25/1920) ,
                      ),
                      (shortest*(20/1920)).heightBox,
                      "\$300".text.color(Colors.red).fontFamily(bold).size(shortest*(30/1920)).make(),
                      (shortest*(20/1920)).heightBox,
                      Row (
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    "seller",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily:semibold,
                                      fontSize: shortest*(40/1920),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                (shortest*(5/1920)).heightBox,
                                Expanded(
                                  child: Text(
                                    "in house brand",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily:semibold,
                                      fontSize: shortest*(30/1920),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(shortest*(10/1920)),
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius:shortest*(55/1920),
                                child: Icon(
                                  Icons.message_rounded,
                                  color: darkFontGrey,
                                ),
                              ).onTap(() {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) =>Chatscreen() )
                                );
                              }),
                            ),
                          )
                        ],
                      ).box.height(heightval*((80/1920)+0.009)).width(widthval).color(textfieldGrey).make(),
                    ],
                  ),
                  (shortest*(30/1920)).heightBox,
                  Row (
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //1 child
                      Expanded(
                        child: Container(
                          child: "Color".text.color(textfieldGrey).size(shortest*(30/1920)).make(),
                        ),
                      ),
                      //2nd child
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: Row (
                            children: List.generate(3, (index) =>
                                VxBox().size(widthval*(40/1920), heightval*(40/1920)).roundedFull.color(Vx.randomPrimaryColor).margin(EdgeInsets.all(widthval*(10/1920))).make()
                            ),
                          ),
                        ),
                      )
                    ],
                  ).box.padding(EdgeInsets.all(shortest*(10/1920))).margin(EdgeInsets.all(shortest*(4/1920))).make().box.shadowSm.make(),
                  (shortest*(20/1920)).heightBox,
                  Row (
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(child: Container(child: "Quantity".text.size(shortest*(30/1920)).color(darkFontGrey).fontFamily(semibold).make())),
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: Row(
                            children: [
                              // Obx(
                              //   ()=>
                            IconButton(onPressed: (){
                                  itemdetailsgetx.changequantity(itemdetailsgetx.quantity.value+=1);

                                }, icon: Icon(Icons.add)),
                     // ),

                              Obx(()=>"${itemdetailsgetx.quantity.value}".text.size(shortest*(30/1920)).color(darkFontGrey).fontFamily(semibold).make()),
                              // Obx(
                              //   ()=>
                                    IconButton(onPressed: (){
                                  itemdetailsgetx.changequantity(itemdetailsgetx.quantity.value-=1);
                                }, icon: Icon(Icons.remove)),
                             // ),
                            ],
                          ),
                        ),
                      ),
                      Container(margin:EdgeInsets.only(left: shortest*(20/1920),right:shortest*(5/1920) ),
                          child: "0 availability".text.size(shortest*(30/1920))
                              .color(darkFontGrey).fontFamily(semibold).make()),
                    ],
                  ),
                  (shortest*(20/1920)).heightBox,
                  Row (
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      "Total".text.fontFamily(semibold).color(darkFontGrey).size(shortest*(30/1920)).make(),
                      "\$50".text.fontFamily(semibold).color(darkFontGrey).size(shortest*(30/1920))
                          .make().box.margin(EdgeInsets.only(left: shortest*(50/1920))).make(),
                    ],
                  ),
                  (shortest*(20/1920)).heightBox,
                  "Description".text.fontFamily(semibold).color(darkFontGrey).size(shortest*(30/1920)).make().box.alignCenterLeft.make(),
                  (widthval*(20/1920)).heightBox,
                  "this is dummy description".text.fontFamily(semibold).color(darkFontGrey).size(shortest*(30/1920)).make().box.alignCenterLeft.make(),
                  (shortest*(20/1920)).heightBox,
                  Container(
                    height: heightval*((275/1920)+0.009),
                    width: widthval,
                    child: ListView(
                      physics: AlwaysScrollableScrollPhysics(),
                      children:List.generate(video.length, (index) =>
                          ListTile(
                            title: "${video[index]}".text.size(shortest*(30/1920)).make(),
                            trailing:Icon(
                                size: shortest*(50/1920),
                                Icons.arrow_forward) ,
                          )),
                    ),
                  ),
                  (shortest*(20/1920)).heightBox,
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Product you may like also",style: TextStyle(fontFamily: semibold,fontSize: shortest*(30/1920)),)),
                  (shortest*(20/1920)).heightBox,
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: heightval*(73/1920),
                          child: ourbutton(Colors.grey, whiteColor,"Buy",(){},shortest),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: heightval*(73/1920),
                          child: ourbutton(Colors.black, whiteColor,"Add To Cart",
                                  () {
                                // cartcontroller.addtocart(
                                //     data["p_name"], img, sellername, color, qty, tprice, context)
                                     // }
                              }     ,shortest),
                        ),
                      ),

                    ],
                  )



                ]
            ),
          )
      ),
    );
  }
  final cartcontroller=Get.put(Productcontroller());
  final itemdetailsgetx=Get.put(Itemdetailsgetx());
}


