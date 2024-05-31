import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:umesh_mart/common_widget/commonbutton.dart';
import 'package:umesh_mart/common_widget/commontextfield.dart';
import 'package:umesh_mart/common_widget/toast.dart';
import 'package:umesh_mart/consts/consts.dart';
import 'package:velocity_x/velocity_x.dart';

import '../profile/Profilescreen_2.dart';

class Changenamescreen extends StatefulWidget {
  const Changenamescreen({Key? key}) : super(key: key);

  @override
  State<Changenamescreen> createState() => _ChangenamescreenState();
}

class _ChangenamescreenState extends State<Changenamescreen> {
  final newnamecont=TextEditingController();
  final firestoreinst_changensc=firestoreinst;
  @override
  Widget build(BuildContext context) {
    var widthval=MediaQuery.of(context).size.width;
    var heightval=MediaQuery.of(context).size.height;
    var shortestval=MediaQuery.of(context).size.shortestSide;
    return Scaffold(
      appBar: AppBar(
        title: Text("Changenamescreen"),
      ),
      body: Container(
        color: Colors.red,
        height:heightval ,
        width: widthval,
        child:
        
        Column(
            children:[
              
            Commontextfield("Enter new name", "Xxxxxx Xxxxxx", false, newnamecont, context), 
              
              (shortestval*0.01).heightBox,
              Commonbutton("Change Name",
                      () {
                firestoreinst_changensc.collection(usercolle).doc(current_u!.uid).update({
                  "name":newnamecont.text.toString(),
                });

                Toastget().Toastmsg("Name change successful");

                Navigator.pushReplacement(context,
                    MaterialPageRoute(
                        builder: (context) => Profilescreen(),
                    )
                );

                      },
                  context
              ),
          ]
        ) ,
      ),
    );
  }
}
