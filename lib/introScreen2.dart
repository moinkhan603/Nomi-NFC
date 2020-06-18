import 'package:flutter/material.dart';
class intro2 extends StatefulWidget {
  @override
  _intro2State createState() => _intro2State();
}

class _intro2State extends State<intro2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0087E3),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(

            children: <Widget>[


              SizedBox(height: 100,),
              Text("Your Nomi QR Code can be "+"\n"+
                  "accessed through by selecting "+"\n"+
                  "Generate QR Code button"


                ,style: TextStyle(fontSize: 25,color: Colors.white,
                fontWeight: FontWeight.bold
                ),

              ),
              SizedBox(height: 30,),
Image.asset("assets/images/profile_screen1en.png",height: 300,)

            ],


          ),
        ),
      ),
    );
  }
}
