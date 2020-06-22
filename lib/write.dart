import 'package:flutter/material.dart';
import 'package:nomi/read.dart';

import 'CRUD.dart';
import 'DemoLocalizations.dart';
class Write extends StatefulWidget {
  @override
  _WriteState createState() => _WriteState();
}

class _WriteState extends State<Write> {

  double height = 80;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if (MediaQuery
        .of(context)
        .size
        .width < 400) {
      setState(() {
        height = 60;
      });
    }
  }

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

    GestureDetector(
      onTap: (){

        Navigator.pop(context);

      },
      child: Text(AppLocalizations.of(context).translate('logout'),
          style: TextStyle(color: Colors.white,fontSize: 18)),
    ),

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
  height: MediaQuery.of(context).size.height/1.3,
  child:   ListView(
    padding: EdgeInsets.only(bottom: 25, top: 10),
    physics: BouncingScrollPhysics(),
    children: <Widget>[





    Wrap(

      runSpacing: 15.0,

      spacing: 2,

      direction: Axis.horizontal,



      children: <Widget>[



        _socialIcons("assets/images/whatsapp.png",
            "Whatsapp", CRUD.whatsapp,height),


        _socialIcons("assets/images/snapchat.png",
            "Snapchat", CRUD.snapchat,height),


        _socialIcons("assets/images/soundcloud.png",
            "Soundcloud", CRUD.soundcloud,height),


        _socialIcons("assets/images/tiktok.png",
            "Tiktok", CRUD.tiktok,height),

        _socialIcons("assets/images/twitter.png",
            "Twitter", CRUD.twitter,height),

        _socialIcons("assets/images/youtube.png",
            "Youtube", CRUD.youtube,height),

        _socialIcons("assets/images/instagram.png",
            "Instagram", CRUD.instagram,height),

        _socialIcons("assets/images/linkedin.png",
            "Linkedin", CRUD.linkendin,height),

        _socialIcons("assets/images/facebook.png",
            "Facebook", CRUD.facebook,height),

        _socialIcons("assets/images/tap.png",
            "Contact Tap", "",height),

        _socialIcons("assets/images/cashapp.png",
            "Cashapp", CRUD.cashapp,height),

        _socialIcons("assets/images/browser.png",
            "Browser", "",height),

        _socialIcons("assets/images/music.png", "Music",
            CRUD.music,height),

        _socialIcons("assets/images/paypal.png",
            "Paypal", CRUD.paypal,height),

        _socialIcons("assets/images/twitch.png",
            "Twitch", "",height),









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
 String path;
 double Hight;
  _socialIcons(this.imgPath,this.name,this.path,this.Hight);
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(



            crossAxisAlignment: CrossAxisAlignment.center,

            children: <Widget>[



              GestureDetector(

            onTap: (){

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Read("Write",path)),
              );

            },
                  child: Image.asset(imgPath,height: Hight,)),

              Text(name,style: TextStyle(color: Colors.blue),)




            ],),
        ),
      ],
    );
  }
}
