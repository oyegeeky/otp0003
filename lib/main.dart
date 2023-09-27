
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp003/Repository/authentication_repository.dart';
import 'package:otp003/Screens/otpScreen.dart';
import 'package:otp003/firebase_options.dart';

import 'controllers/otpController.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((value) =>
  Get.put(AuthenticationRepository()));
  Get.put(OTPController());
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Phone Auth Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: OTPScreen(),
    );
  }
}
