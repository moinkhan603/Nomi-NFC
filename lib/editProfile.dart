import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'DemoLocalizations.dart';
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

                            Text(AppLocalizations.of(context).translate('edtprfile'),

                              style: TextStyle(color: Colors.white,fontSize: 22),),



                            Row(children: <Widget>[

                              Text(AppLocalizations.of(context).translate('savevtn'),
                                  style: TextStyle(color: Colors.white,fontSize: 18)),



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
                        _info(AppLocalizations.of(context).translate('name'),1),
                        _info(AppLocalizations.of(context).translate('email'),2),
                        _info(AppLocalizations.of(context).translate('bio'),3),
                          SizedBox(height: 20,),
                          Align(


                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left:14.0),
                                child: Text(AppLocalizations.of(context).translate('social'),
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                              )),

                        _info2(3,AppLocalizations.of(context).translate('yutub'),"assets/images/youtube.png"),
                        _info2(3,AppLocalizations.of(context).translate('wtsp'),"assets/images/whatsapp.png"),
                        _info2(3,AppLocalizations.of(context).translate('twter'),"assets/images/twitter.png"),
                        _info2(3,AppLocalizations.of(context).translate('tktok'),"assets/images/tiktok.png"),
                        _info2(3,AppLocalizations.of(context).translate('soundcld'),"assets/images/soundcloud.png"),
                        _info2(3,AppLocalizations.of(context).translate('snpcht'),"assets/images/snapchat.png"),
                        _info2(3,AppLocalizations.of(context).translate('pypl'),"assets/images/paypal.png"),
                        _info2(3,AppLocalizations.of(context).translate('msc'),"assets/images/music.png"),
                        _info2(3,AppLocalizations.of(context).translate('lnk'),"assets/images/linkedin.png"),
                        _info2(3,AppLocalizations.of(context).translate('insta'),"assets/images/instagram.png"),
                        _info2(3,AppLocalizations.of(context).translate('fb'),"assets/images/facebook.png"),
                        _info2(3,AppLocalizations.of(context).translate('cash'),"assets/images/cashapp.png"),
                        _info2(3,AppLocalizations.of(context).translate('venmo'),"assets/images/venmo.png"),



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
