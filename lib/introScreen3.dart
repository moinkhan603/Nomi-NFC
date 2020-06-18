import 'package:flutter/material.dart';
class intro3 extends StatefulWidget {
  @override
  _intro3State createState() => _intro3State();
}

class _intro3State extends State<intro3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0087E3),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(

            children: <Widget>[


              SizedBox(height: 10,),
              Text("Your QR Code  "



                ,style: TextStyle(fontSize: 25,color: Colors.white,
                    fontWeight: FontWeight.bold
                ),

              ),
              SizedBox(height: 30,),
              Image.asset("assets/images/qr_code_screen_en.png",height: 300,),
              SizedBox(height: 30,),
              Text("Here is your exclusive QR Code"+"\n"+
                "Share with your People"



                ,style: TextStyle(fontSize: 22,color: Colors.white,

                ),

              ),
            ],


          ),
        ),
      ),
    );
  }
}
