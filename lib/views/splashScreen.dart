import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0xff473F97),
        child: Center(
          child: Column(
            children: [
                  Text("Q",style:TextStyle(color: Color(0xffFFFFFF),
                  fontSize: 400,fontWeight: FontWeight.w400,fontFamily: 'Montserrat') ,),

                SizedBox(height: 30,),
                  ElevatedButton(onPressed:(){},
                  style: ElevatedButton.styleFrom(
             fixedSize: Size(330, 60), 
             shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(35), ),
              backgroundColor: Colors.white, ), child: Text("Get Started",style: TextStyle(
                    color: Color(0xff3D003E),
                    fontSize: 22,fontFamily: 'Montserrat'
                  ),))
          
            ],
          ),
        ),
      ),

    );
  }
}