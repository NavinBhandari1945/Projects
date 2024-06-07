import 'package:esewa_flutter_sdk/esewa_config.dart';
import 'package:esewa_flutter_sdk/esewa_flutter_sdk.dart';
import 'package:esewa_flutter_sdk/esewa_payment.dart';
import 'package:esewa_flutter_sdk/esewa_payment_success_result.dart';
import 'package:esewa_flutter_sdk/payment_failure.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:umesh_mart/Home/home_1.dart';
import 'package:umesh_mart/common_widget/toast.dart';
import 'package:umesh_mart/product/Item_detail_creen.dart';
import 'package:umesh_mart/product/payment_constant.dart';
import 'package:umesh_mart/product/productscreen.dart';

import 'bill_generation.dart';

class Pay_functiion{

  do_pay(
      {
        required context,
        required p_url,
        required p_name,
        required p_price,
        required p_id,
        required p_color,
        required p_description,
        required p_quantity,
      }){

    try{
      EsewaFlutterSdk.initPayment(

          esewaConfig:EsewaConfig(
              clientId: CLIENT_ID_esewa,
              secretId: SECRET_KEY_esewa,
              environment:Environment.test),

          esewaPayment:EsewaPayment(
              productId: p_id,
              productName: p_name,
              productPrice: p_price,
              callbackUrl: "",
          ),

          onPaymentSuccess:(EsewaPaymentSuccessResult success_result) {

            // verifyTransactionStatus(success_result);

            print("esewa payment succes result start");
            print("value");
            print(success_result);
            print("stop");
            Toastget().Toastmsg("Payment success by esewa.\n"+"Thank you");

            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
              return
                  Bill_generation(
                      p_url: p_url,
                      p_name: p_name,
                      p_price: p_price,
                      p_id: p_id,
                      p_color: p_color,
                      p_description: p_description,
                      p_quantity: p_quantity);
            },
            )
            );
          },

          onPaymentFailure:(data,EsewaPaymentFailure fail_result){
            print("payment failure start");
            print("data value");
            print(data);
            print("faul_result value");
            print(fail_result);
            print("stop");

            Toastget().Toastmsg("Payment Failed.\n"+"${fail_result}");
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
              return Home_1();
            },
            )
            );

          },

          onPaymentCancellation:(data){

            print("payment cancel start");
            print("data value");
            print(data);
            print("stop");
            Toastget().Toastmsg("Payment cancel");
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
              return Home_1();
            },
            )
            );



          }
          );


      }catch(o){
      print("Exception caught in do pay function");

      }
  }

  // void verifyTransactionStatus(EsewaPaymentSuccessResult result) async {
  //   var response = await callVerificationApi(result);
  //   if (response.statusCode == 200) {
  //     var map = {'data': response.data};
  //     final sucResponse = EsewaPaymentSuccessResponse.fromJson(map);
  //     debugPrint("Response Code => ${sucResponse.data}");
  //     if (sucResponse.data[0].transactionDetails.status == 'COMPLETE') {
  //       //TODO Handle Txn Verification Success
  //       return;
  //     }
  //     //TODO Handle Txn Verification Failure
  //   } else {
  //     //TODO Handle Txn Verification Failure
  //   }
  // }

}