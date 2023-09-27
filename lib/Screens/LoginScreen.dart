import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:otp003/Screens/otpScreen.dart';
import 'package:otp003/controllers/signup_controllers.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  // TextEditingController _emailController = TextEditingController();
  // TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
     final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Minimalist Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: 300,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: controller.phoneNo,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phoneNumber';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),

                  // TextFormField(
                  //   controller: controller.password,
                  //   decoration: InputDecoration(
                  //     labelText: 'Password',
                  //     border: OutlineInputBorder(),
                  //   ),
                  //   obscureText: true,
                  //   // validator: (value) {
                  //   //   if (value == null || value.isEmpty) {
                  //   //     return 'Please enter your password';
                  //   //   }
                  //   //   return null;
                  //   // },
                  // ),


                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Implement login logic here
                        //SignUpController.instance.registerUser(controller.email.text.trim(), controller.password.text.trim());
                        // Process the login with email and password

                        SignUpController.instance.phoneAuthentication(controller.phoneNo.text.trim()) ;
                        Get.to(() => const OTPScreen());
                      }
                    },
                    child: Text('Send Otp'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}