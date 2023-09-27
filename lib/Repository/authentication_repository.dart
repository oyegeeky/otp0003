import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:otp003/Repository/exception/signup_email_password_failure.dart';
import 'package:otp003/Screens/otpScreen.dart';

import '../Screens/DashBoard.dart';
import '../Screens/WelcomeScreen.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();


  //Variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs ;

  @override
  void onReady() {
    Future.delayed(Duration(seconds: 6));
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }


  Future<void> phoneAuthentication(String phoneNo)async {
  await _auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      verificationCompleted: (credentials) async {
      await _auth.signInWithCredential(credentials);
      },
      codeSent: (verificationId, resendToken){
        this.verificationId.value=verificationId ;
      },

      codeAutoRetrievalTimeout: (verificationId){
        this.verificationId.value=verificationId ;
      },

  verificationFailed: (e){ if(e.code== 'invalid-phone-number'){
    Get.snackbar('Error', 'The provided phone num is not valid');
  }else{
    Get.snackbar('Error', 'Something went wrong');
  }
  },
  );
}

Future<bool> verifyOTP(String otp) async{
    var credentials = await _auth.signInWithCredential(PhoneAuthProvider.credential(verificationId: this.verificationId.value, smsCode: otp));
    return credentials.user != null? true : false ;
}



  _setInitialScreen(User? user) {
    user == null ? Get.offAll(() => WelcomeScreen()) : Get.offAll(() =>
        DashBoard());
  }

  Future <void> createUserWithEmailAndPassword(String email, String password)async{
  try{
    await _auth.createUserWithEmailAndPassword(email: email, password: password) ;
    firebaseUser.value != null ? Get.offAll(() => DashBoard()) : Get.to(() => WelcomeScreen()) ;
  }  on FirebaseAuthException catch(e) {
    final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
    print('Firebase Error');
    throw ex;
  }
    catch(_){
    const ex = SignUpWithEmailAndPasswordFailure();
    print('EXCEPTION');
    throw ex;
  }
  }

  Future <void> loginWithEmailAndPassword(String email, String password)async{
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password) ;
    }  on FirebaseAuthException catch(e){}
    catch(_){}
  }

  Future <void> logout() async => await _auth.signOut();



}