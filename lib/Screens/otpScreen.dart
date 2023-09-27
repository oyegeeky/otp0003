import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../controllers/otpController.dart';
//import 'package:otp003/controllers/otpController.dart';
class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var otp ;
    return Scaffold(
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OtpTextField(
              numberOfFields: 6 ,
              fillColor: Colors.black.withOpacity(0.1),
              filled: true,
              keyboardType: TextInputType.phone,
              onSubmit: (code){
                otp = code ;
                // OTPController.instance.verifyOTP(otp);
                OTPController.instance.verifyOTP(otp);
              }
            ),

            ElevatedButton(onPressed: (){
              OTPController.instance.verifyOTP(otp);
            }, child: Text('Submit'))

          ],
        ),
      ),
    );
  }
}
