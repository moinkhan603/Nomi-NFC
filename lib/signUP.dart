import 'package:flutter/material.dart';

class signUp extends StatefulWidget {
  @override
  _signUpState createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:new Stack(
        children: <Widget>[
          new Container(

            decoration: new BoxDecoration(

              image: new DecorationImage(image: new AssetImage("assets/images/signup_bg.png"), fit: BoxFit.fill,),
            ),
          ),


           Positioned.fill(
             child: Align(
               alignment: Alignment.centerLeft,
               child: Padding(
                 padding: const EdgeInsets.only(top: 200),
                 child:  SingleChildScrollView(
                   child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: <Widget>[


                       Padding(
                         padding: const EdgeInsets.only(left:58.0),
                         child: Text("Welcome!",style: TextStyle(fontSize: 25,color: Colors.white,
                             fontWeight: FontWeight.bold
                         ),),
                       ),
                         Padding(
                           padding: const EdgeInsets.only(left:58.0),
                           child: Text("Sign Up",style: TextStyle(fontSize: 29,color: Colors.white,
                             fontWeight: FontWeight.bold
                       ),),
                         ),
   SizedBox(height: 20,),
                         Padding(
                           padding: EdgeInsets.symmetric(horizontal: 50),
                           child: Material(
                             elevation: 4.0,
                             borderRadius: BorderRadius.all(Radius.circular(30)),
                             child: TextField(
                               onChanged: (String value){
                                 //email=value.trim();

                               },
                               cursorColor: Colors.blue,
                               decoration: InputDecoration(
                                   hintText: "Email",
                                  hintStyle: TextStyle(fontWeight: FontWeight.bold
                                  ,color: Color(0xff0087E3)
                                  ),
                                   border: InputBorder.none,
                                   contentPadding:
                                   EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
                             ),
                           ),
                         ),

SizedBox(height: 10,),
                         Padding(
                           padding: EdgeInsets.symmetric(horizontal: 50),
                           child: Material(
                             elevation: 4.0,
                             borderRadius: BorderRadius.all(Radius.circular(30)),
                             child: TextField(
                               onChanged: (String value){
                                 //email=value.trim();

                               },
                               cursorColor: Colors.blue,
                               decoration: InputDecoration(
                                   hintText: "Password",
                                   hintStyle: TextStyle(fontWeight: FontWeight.bold
                                       ,color: Color(0xff0087E3)
                                   ),
                                   border: InputBorder.none,
                                   contentPadding:
                                   EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
                             ),
                           ),
                         ),


    SizedBox(
    height: 16,
    ),
    Padding(
    padding: EdgeInsets.symmetric(horizontal: 50),
    child: Container(
      width: double.infinity,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(100)),
    color: Color(0xff1E90FF)),
    child: FlatButton(

    child: Text(
    "Sign Up",
    style: TextStyle(
    color: Colors.white,

    fontSize: 22),
    ),
    onPressed: () async
    {}


    )))

                     ],),
                 ),
                 ),
               ),

           )

        ],
      ));
  }
}
