// import 'package:ecommerce_1/consts/consts.dart';
// import 'package:ecommerce_1/views/categoryscreen/itemdetails.dart';
// import 'package:ecommerce_1/widgets_common/bg_widget.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class Categorydetails extends StatelessWidget {
//   final String title;
//   const Categorydetails({Key? key,required this.title}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final widthval=MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('${title}'),
//       ),
//       body:
//       SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Container(
//           padding: EdgeInsets.all(12.0),
//           width: widthval,
//           color: Colors.blue,
//           child:
//           Column(
//             children: [
//
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 physics: AlwaysScrollableScrollPhysics(),
//                 child: Container(
//                   width: widthval,
//                   height: widthval*0.098,
//                   child:Row(
//                     children: List.generate(6, (index) => Expanded(
//                       child: Container(
//                         width: widthval*0.08,
//                         height: widthval*0.031,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(widthval * 0.045),
//                         ),
//                         margin: EdgeInsets.all(widthval*0.0020),
//                         child: Center(
//                           child: Text(
//                             'baby clothing',
//                             style: TextStyle(
//                               fontFamily: semibold,
//                               fontSize: widthval*0.013,
//                               color: darkFontGrey,
//                             ),
//                           ),
//                         ),
//                       ),
//                     )),
//                   ),
//                 ),
//               ),
//
//
//               Container(
//                 color: Colors.red,
//                 margin: EdgeInsets.only(top: 5),
//                 width: widthval,
//                 child: GridView.builder(
//                   shrinkWrap: true,
//                     itemCount: 6,
//                     gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       mainAxisSpacing: 4,
//                       crossAxisSpacing: 4,
//                       mainAxisExtent:widthval*0.125,
//                     )
//                     , itemBuilder: (context, index) {
//                       return
//                         Expanded(
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color:Colors.white,
//                               borderRadius: BorderRadius.all(Radius.circular(5.0)),
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Expanded(
//                                   child: Center(child: Container(
//                                       width: widthval*0.20,
//                                       height:widthval*0.08,
//                                       child: Image.asset(imgP5,fit: BoxFit.fill,))),
//                                 ),
//                                 Expanded(
//                                   child: Container(
//                                     height: widthval*0.005,
//                                   ),
//                                 ),
//                                 // "laptop 64/32".text.fontFamily(semibold).size(devwidth*0.02).color(Colors.black).make(),
//                                 Expanded(child: Text("Laptop 64/32",style: TextStyle(fontFamily: semibold,fontSize:widthval*0.013,color: Colors.black),)),
//                                Expanded(
//                                  child: Container(
//                                    height:widthval*0.005,
//                                  ),
//                                ),
//                                 // "\$600".text.fontFamily(bold).size(devwidth*0.02).make(),
//                                 Expanded(child: Text("\$700",style: TextStyle(color: Colors.black,fontFamily: bold,fontSize:widthval*0.013),)),
//                               ],
//                             ),
//                           ).onTap(() {
//                             Navigator.push(context, MaterialPageRoute(builder: (context) {
//                               return  Itemdetails(title:"Dumy item" );
//                             },));
//                           }),
//                         );
//                     },),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


//rough practice
import 'package:ecommerce_1/consts/consts.dart';
import 'package:ecommerce_1/views/categoryscreen/itemdetails.dart';
import 'package:ecommerce_1/widgets_common/bg_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Categorydetails extends StatelessWidget {
  final String title;
  const Categorydetails({Key? key,required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final widthval=MediaQuery.of(context).size.width;
    final heightval=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('${title}'),
      ),
      body:
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.all(12.0),
          width: widthval,
          color: Colors.blue,
          child:
          Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: AlwaysScrollableScrollPhysics(),
                child: Container(
                  // color: Colors.yellow,
                  width: widthval,
                  height: widthval*0.098,
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(6, (index) => Container(
                      width: widthval*(216/1920),
                      height: widthval*0.031,
                      margin: EdgeInsets.all(widthval*(5/1920)),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(widthval * 0.045),
                      ),
                      // margin: EdgeInsets.all(widthval*0.0020),
                      child: Center(
                        child: Text(
                          'baby clothing',
                          style: TextStyle(
                            fontFamily: semibold,
                            fontSize: widthval*0.013,
                            color: darkFontGrey,
                          ),
                        ),
                      ),
                    )),
                  ),
                ),
              ),


              Container(
                color: Colors.red,
                width: widthval,
                height: heightval-( widthval*0.098),
                child: Column (
                  children:
                  [
                  Expanded(
                    child: GridView.builder(
                       shrinkWrap: true,
                       itemCount: 6,
                       gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                         crossAxisCount: 2,
                         mainAxisSpacing: heightval*(10/1920),
                         crossAxisSpacing: widthval*(4/1920),
                         // mainAxisExtent:widthval*0.125,
                         // childAspectRatio: 1,
                       )
                       , itemBuilder: (context, index) {
                       return
                         Container(
                           height: heightval/3,
                           decoration: BoxDecoration(
                             color:Colors.white,
                             borderRadius: BorderRadius.all(Radius.circular(5.0)),
                           ),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Expanded(
                                 child: Center(child: Container(
                                     width: widthval*0.50,
                                     height:widthval*0.50,
                                     child: Image.asset(imgP5,fit: BoxFit.fill,))),
                               ),
                               Container(
                                 height: widthval*0.005,
                               ),
                               // "laptop 64/32".text.fontFamily(semibold).size(devwidth*0.02).color(Colors.black).make(),
                               Text("Laptop 64/32",style: TextStyle(fontFamily: semibold,fontSize:widthval*0.013,color: Colors.black),),
                               Container(
                                 height:widthval*0.005,
                               ),
                               // "\$600".text.fontFamily(bold).size(devwidth*0.02).make(),
                               Text("\$700",style: TextStyle(color: Colors.black,fontFamily: bold,fontSize:widthval*0.013),),
                             ],
                           ),
                         ).onTap(() {
                           Navigator.push(context, MaterialPageRoute(builder: (context) {
                             return  Itemdetails(title:"Dumy item" );
                           },));
                         });
                     },
    ),
                  ),
                  ]
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}
