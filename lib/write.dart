import 'package:flutter/material.dart';

import 'DemoLocalizations.dart';
class Write extends StatefulWidget {
  @override
  _WriteState createState() => _WriteState();
}

class _WriteState extends State<Write> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    body: Stack(

          children: <Widget>[

      SingleChildScrollView(
        child: new Container(



        decoration: new BoxDecoration(



        image: new DecorationImage(image: new AssetImage("assets/images/bg_option.png"), fit: BoxFit.fill,),

    ),


          child:     Column(

    children: <Widget>[

    SafeArea(

    child: Padding(

    padding: const EdgeInsets.symmetric(horizontal:25,vertical: 20 ),

    child: Row(



    crossAxisAlignment: CrossAxisAlignment.end,

    mainAxisAlignment: MainAxisAlignment.spaceBetween,

    children: <Widget>[



    ImageIcon(

    AssetImage("assets/images/menu.png"),size: 30,

    color: Colors.white,

    ),

    Text("Nomi Tap",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),



    Row(children: <Widget>[

    Text(AppLocalizations.of(context).translate('logout'),
        style: TextStyle(color: Colors.white,fontSize: 18)),

    ImageIcon(

    AssetImage("assets/images/right_arrow.png"),

    color: Colors.red,

    )

    ],)

    ,





    ],),

    ),

    ),

Container(
  height: 500,
  child:   ListView(children: <Widget>[





    Wrap(

      runSpacing: 15.0,

      spacing: 2,

      direction: Axis.horizontal,



      children: <Widget>[



        _socialIcons("assets/images/whatsapp.png","Whatsapp"),




        _socialIcons("assets/images/snapchat.png","Snapchat"),



        _socialIcons("assets/images/soundcloud.png","Soundcloud"),



        _socialIcons("assets/images/tiktok.png","Tiktok"),

        _socialIcons("assets/images/twitter.png","Twitter"),

        _socialIcons("assets/images/youtube.png","Youtube"),

        _socialIcons("assets/images/instagram.png","Instagram"),

        _socialIcons("assets/images/linkedin.png","Linkedin"),

        _socialIcons("assets/images/facebook.png","Facebook"),

        _socialIcons("assets/images/tap.png","Contact Tap"),

        _socialIcons("assets/images/cashapp.png","Cashapp"),

        _socialIcons("assets/images/browser.png","Browser"),

        _socialIcons("assets/images/music.png","Music"),

        _socialIcons("assets/images/paypal.png","Paypal"),

        _socialIcons("assets/images/twitch.png","Twitch"),













      ],











    )











  ],),
),












    ],







    ),






    ),
      ),

          ]),
    );
  }
}

class _socialIcons extends StatelessWidget {
 String imgPath;
 String name;
  _socialIcons(this.imgPath,this.name);
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(



            crossAxisAlignment: CrossAxisAlignment.center,

            children: <Widget>[



              Image.asset(imgPath,height: 80,),

              Text(name,style: TextStyle(color: Colors.blue),)




            ],),
        ),
      ],
    );
  }
}
