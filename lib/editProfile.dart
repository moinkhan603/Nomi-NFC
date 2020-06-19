import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(




      body: new Stack(

          children: <Widget>[

            new Container(



              decoration: new BoxDecoration(



                image: new DecorationImage(image: new AssetImage("assets/images/bg_option.png"), fit: BoxFit.fill,),

              ),



              child: SingleChildScrollView(
                child: Column(

                  children: <Widget>[

                    SafeArea(

                      child: Padding(

                        padding: const EdgeInsets.symmetric(horizontal:10,vertical: 30 ),

                        child: Row(



                          crossAxisAlignment: CrossAxisAlignment.end,

                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: <Widget>[



                            ImageIcon(

                              AssetImage("assets/images/menu.png"),size: 30,

                              color: Colors.white,

                            ),

                            Text("Edit Profile",style: TextStyle(color: Colors.white,fontSize: 22),),



                            Row(children: <Widget>[

                              Text("Save",style: TextStyle(color: Colors.white,fontSize: 18)),



                            ],)

                            ,





                          ],),

                      ),

                    ),





                    Stack(

                      children: <Widget>[
                        CircleAvatar(backgroundImage: AssetImage("assets/images/img_inside.png"),

                          radius: 60,

                        ),

                        Positioned.fill(
                          bottom: 8,
                          right: 10,
                          child: Align(
                              alignment: Alignment.bottomRight,

                              child: FaIcon(FontAwesomeIcons.camera)),
                        )




                      ],

                    )

                    ,

                    Container(
                      height: MediaQuery.of(context).size.height/1.6,
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(vertical: 10),
                        children: <Widget>[
                        _info("Name",1),
                        _info("Email",2),
                        _info("Bio",3),
                          SizedBox(height: 20,),
                          Align(


                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left:14.0),
                                child: Text("Social Networks",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                              )),

                        _info2(3,"Youtube username","assets/images/youtube.png"),
                        _info2(3,"Whatsapp username","assets/images/whatsapp.png"),
                        _info2(3,"Twitter username","assets/images/twitter.png"),
                        _info2(3,"Tiktok username","assets/images/tiktok.png"),
                        _info2(3,"SoundCloud username","assets/images/soundcloud.png"),
                        _info2(3,"Snapchat username","assets/images/snapchat.png"),
                        _info2(3,"Paypal username","assets/images/paypal.png"),
                        _info2(3,"Music username","assets/images/music.png"),
                        _info2(3,"Linkedin username","assets/images/linkedin.png"),
                        _info2(3,"Instagram username","assets/images/instagram.png"),
                        _info2(3,"Facebook username","assets/images/facebook.png"),
                        _info2(3,"Cashapp username","assets/images/cashapp.png"),
                        _info2(3,"Venmo username","assets/images/venmo.png"),



                      ],),
                    )
,




                    Divider(height: 10,color: Colors.black,thickness: 1,)










                  ],







                ),
              ),



            ),





          ]),





    );
  }
}

class _info extends StatelessWidget {

  String heading;
  int id;
  String imgPath;

  _info(@required this.heading,@required this.id,);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: <Widget>[
          Align(


              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left:14.0),
                child: Text(heading,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
              )),

SizedBox(height: 5,),
          Material(
            elevation: 1.0,
            borderRadius: BorderRadius.all(Radius.circular(12)),
            child: TextField(

              onChanged: (String value){
                //email=value.trim();

              },
              cursorColor: Colors.blue,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.14),
//                  prefixIcon:  ImageIcon(
//
//                    AssetImage("assets/images/youtube.png"),
//
//                    //color: Colors.black87,
//
//                  ),
                // hintText: "Password",
                  hintStyle: TextStyle(fontWeight: FontWeight.bold
                      ,color: Color(0xff0087E3)
                  ),
                  border: InputBorder.none,
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
            ),
          ),

          SizedBox(height: 10,),

        ],
      ),
    );
  }
}



class _info2 extends StatelessWidget {

String hintText;
  int id;
  String imgPath;

  _info2(@required this.id,this.hintText, this.imgPath);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12,vertical: 10),
      child: Column(
        children: <Widget>[


          Material(
            elevation: 1.0,
            borderRadius: BorderRadius.all(Radius.circular(12)),
            child: TextField(
textAlign: TextAlign.center,
              onChanged: (String value){
                //email=value.trim();

              },
              cursorColor: Colors.blue,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.14),
//                  prefixIcon:  ImageIcon(
//
//                    AssetImage(imgPath),
//
//                    //color: Colors.black87,
//
//                  ),

              prefixIcon: Image.asset(
                imgPath,
                width: 20,
                height: 20,
                fit: BoxFit.fill,
              ),

                 hintText: hintText,
                  hintStyle: TextStyle(


                  ),
                  border: InputBorder.none,
                  contentPadding:
               EdgeInsets.symmetric(horizontal:22, vertical: 13)),

            ),
          ),

          SizedBox(height: 10,),

        ],
      ),
    );
  }
}
