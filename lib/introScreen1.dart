import 'package:flutter/material.dart';

import 'DemoLocalizations.dart';
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

              Text(AppLocalizations.of(context).translate('intro1Heading'),

                style: TextStyle(fontSize: 25,color: Colors.white,
                  fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 15,),
              Image.asset("assets/images/person_icon.png"),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(AppLocalizations.of(context).translate('intro1Text')

                  ,style: TextStyle(fontSize: 20,color: Colors.white),),
              ),

            ],


          ),
        ),
      ),
    );
  }
}
