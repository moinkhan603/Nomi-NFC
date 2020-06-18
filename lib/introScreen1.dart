import 'package:flutter/material.dart';
class intro1 extends StatefulWidget {
  @override
  _intro1State createState() => _intro1State();
}

class _intro1State extends State<intro1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0087E3),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(

            children: <Widget>[

              Text("How To Tap!",style: TextStyle(fontSize: 25,color: Colors.white,
                  fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 15,),
              Image.asset("assets/images/person_icon.png"),
              SizedBox(height: 10,),
              Text("Tap your Nomi to the middle "+"\n"+
                  "back of another mobile device to "+"\n"+
                  "share your profile"+"\n"+"\n"+
                  ""
                  "Make sure they have turned on "+"\n"+
                  "NFC in settings"

                ,style: TextStyle(fontSize: 20,color: Colors.white),),

            ],


          ),
        ),
      ),
    );
  }
}
