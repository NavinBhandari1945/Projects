import 'package:ecommerce_1/consts/consts.dart';
import 'package:ecommerce_1/consts/lists.dart';
import 'package:ecommerce_1/views/homescreen/featuredbutton/featuredbutton.dart';
import 'package:ecommerce_1/widgets_common/homebutton.dart';
import 'package:flutter/material.dart';
class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);
  @override
  State<Homescreen> createState() => _HomescreenState();
}
class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    var devwidth=MediaQuery.of(context).size.width;
    var devheight=MediaQuery.of(context).size.height;
    return
      Scaffold(
        appBar: AppBar(
          title: Text("HOME SCREEN"),
        ),
        body:
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height:MediaQuery.of(context).size.height*9.0,
            color: Colors.grey,
            child: SafeArea(
              child: Column(
                children: [
                  Container(
                    color: Colors.red,
                    child: TextFormField(
                      decoration: InputDecoration(
                        isDense: true,
                        filled: true,
                        fillColor: Colors.grey,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                          )
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                          )
                        ),
                        prefixIcon: Icon(Icons.search),
                        hintText: "${search}",
                      ),
                    ),
                  ),
                  //swiper brand
                Container(
                  child: Column(
                    children: [
                      Container(
                        color: Colors.black,
                        child: VxSwiper.builder(
                            autoPlay: true,
                            aspectRatio: 16/9,
                            scrollDirection: Axis.horizontal,
                            itemCount: sliderlist.length,
                            itemBuilder:
                                (context, index) =>Container(
                              height: double.infinity,
                              width: double.infinity,
                              child: Image.asset(sliderlist[index],
                                fit: BoxFit.fill,
                              ),
                            )
                        ),
                      ),
                      10.heightBox,
                      //deal button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:
                        List.generate(2,
                                (index) =>
                                Homebutton(
                                    index==0?todaydeal:flashsale,
                                    index==0?icTodaysDeal:icFlashDeal,
                                    context.screenHeight*0.15,
                                    context.screenWidth/2.5,
                                        (){}
                                )
                        ),
                      ),
                      //2nd slider
                      10.heightBox,
                      Container(
                        color: Colors.black,
                        height: MediaQuery.of(context).size.height*0.5,
                        width:MediaQuery.of(context).size.width,
                        child: VxSwiper.builder(
                            autoPlay: true,
                            aspectRatio: 16/9,
                            scrollDirection: Axis.horizontal,
                            itemCount: sliderlist.length,
                            itemBuilder:
                                (context, index) =>Container(
                              height: double.infinity,
                              width: double.infinity,
                              child: Image.asset(secondsliderlist[index],
                                fit: BoxFit.fill,
                              ),
                            )
                        ),
                      ),
                      10.heightBox,
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children:List.generate(3, (index) => Homebutton(
                              index==0?topcategories:index==1?brand:topsellers,
                              index==0?icTopCategories:index==1?icBrands:icTopSeller,
                              context.screenHeight*0.15,
                              context.screenWidth/4,
                                  (){}
                          )
                          )
                      ),
                      20.heightBox,
                      Align(
                          alignment: Alignment.center,
                          child: featurecategories.text.color(Colors.black).fontFamily(semibold).make()
                      ),
                      20.heightBox,
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: AlwaysScrollableScrollPhysics(),
                        child: Container(
                          width: devwidth,
                          height: MediaQuery.of(context).size.width*0.20,
                          color: Colors.red,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(3, (index) =>
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Featuredbutton(context,featuredtitle1[index],featuredimages1[index]),
                                10.heightBox,
                                Featuredbutton(context,featuredtitle2[index],featuredimages2[index]),
                                10.heightBox,
                              ],
                            )
                            ),
                          ),
                        ),
                      ),
                      //feature products
                      Container(
                        width: devwidth,
                   height: devwidth*0.25,
                   decoration: BoxDecoration(
                     color: Colors.yellow,
                   ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Align(
                              alignment: Alignment.center,
                              child: featuredproduct.text.white.fontFamily(bold).size(16).color(Colors.black).make()),
                            (devwidth*0.01).heightBox,
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              physics: AlwaysScrollableScrollPhysics(),
                              child: SizedBox(
                                width: devwidth,
                                height: devwidth*0.20,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children:List.generate(6,
                                                (index) =>
                                                    Expanded(
                                                      child: Container(
                                                        margin: EdgeInsets.only(left: 10,right: 10,bottom: 10),
                                                        height: devwidth*0.17,
                                                        width: devwidth*0.13,
                                                        decoration: BoxDecoration(
                                                          color: Colors.white,
                                                        ),
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                        Image.asset(imgP1,width: double.infinity,height: devwidth*0.10,),
                                                        10.heightBox,
                                                        // "laptop 64/32".text.fontFamily(semibold).size(devwidth*0.02).color(Colors.black).make(),
                                                        Text("Laptop 64/32",style: TextStyle(fontFamily: semibold,fontSize: devwidth*0.01,color: Colors.black),),
                                                        10.heightBox,
                                                        // "\$600".text.fontFamily(bold).size(devwidth*0.02).make(),
                                                        Text("\$700",style: TextStyle(color: Colors.black,fontFamily: bold,fontSize: devwidth*0.01),),
                                                  ],
                                                ),
                                                      ),
                                                    )
                                        )
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      10.heightBox,
                      //3rd swipper
                      Container(
                        color: Colors.black,
                        height: MediaQuery.of(context).size.width*0.2,
                        width:MediaQuery.of(context).size.width,
                        child: VxSwiper.builder(
                            autoPlay: true,
                            aspectRatio: 16/9,
                            scrollDirection: Axis.horizontal,
                            itemCount: sliderlist.length,
                            itemBuilder:
                                (context, index) =>Container(
                              height: double.infinity,
                              width: double.infinity,
                              child: Image.asset(secondsliderlist[index],
                                fit: BoxFit.fill,
                              ),
                            )
                        ),
                      ),
                      10.heightBox,
                      //all product section
                      GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 6,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:2,
                        mainAxisSpacing: devwidth*0.01,//horizontal
                        crossAxisSpacing: devwidth*0.01,//vertical
                        mainAxisExtent: 300,
                      ),
                          itemBuilder:(context, index) =>
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Center(child: Image.asset(imgP5,width:200,height:200,)),
                           Spacer(),
                           // "laptop 64/32".text.fontFamily(semibold).size(devwidth*0.02).color(Colors.black).make(),
                           Text("Laptop 64/32",style: TextStyle(fontFamily: semibold,fontSize:20,color: Colors.black),),
                           10.heightBox,
                           // "\$600".text.fontFamily(bold).size(devwidth*0.02).make(),
                           Text("\$700",style: TextStyle(color: Colors.black,fontFamily: bold,fontSize:25),),
                         ],
                       ).box.white.roundedSM.make()
                        ,)
                    ],
                  ),
                )
                ],
              ),
            ),
          ),
        ),
      );
  }
}
