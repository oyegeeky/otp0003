import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/Colors.dart';
import 'LoginScreen.dart';



class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [


            Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.grey,
              //child: Image.asset('assets/images/s1logo.png'),
              // child: Image.asset('assets/images/bg1.png',
              //   fit: BoxFit.cover,
              //
              // ),
            ),

            Center(
              child: Container(
                color: Colors.cyanAccent,

                // child: Image.asset('assets/images/s1logo.png'),
              ),
            ),

            Positioned(
                bottom: 50,
                left: 30,
                right: 30,
                child:
                Row(

                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 54,
                      width: 142,
                      child: ElevatedButton(onPressed: (){

                      },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white.withOpacity(0.9),
                          // shadowColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          //minimumSize: Size(120,50)
                        ), child:
                        Text('Skip',
                          style: GoogleFonts.raleway(
                              textStyle: Theme.of(context).textTheme.displayMedium,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: tdPink
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 54,
                      width: 142,

                      child: ElevatedButton(onPressed: (){Get.to(() => LoginScreen());},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: tdPink,
                            // shadowColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            minimumSize: Size(120,50)
                        ),
                        child:
                        Text('Login',
                          style: GoogleFonts.raleway(
                              textStyle: Theme.of(context).textTheme.displayMedium,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.white
                          ),
                        ),
                        // style: ButtonStyle(
                        //   backgroundColor: Colors.pink
                        // ),
                      ),
                    ),
                  ],
                )
            )
          ],
        )
    );
  }
}
