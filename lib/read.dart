import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomi/CRUD.dart';

import 'DemoLocalizations.dart';
class Read extends StatefulWidget {
  @override
  _ReadState createState() => _ReadState();
}

class _ReadState extends State<Read> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: SingleChildScrollView(
        child:   new Stack(

            children: <Widget>[

              new Container(



                decoration: new BoxDecoration(



                  image: new DecorationImage(image: new AssetImage("assets/images/bg_option.png"), fit: BoxFit.fill,),

                ),



                child: Column(

                  children: <Widget>[


                    SafeArea(

                      child: Padding(

                        padding: const EdgeInsets.symmetric(horizontal:10,vertical: 20 ),

                        child: Row(



                          crossAxisAlignment: CrossAxisAlignment.end,

                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: <Widget>[



                            ImageIcon(

                              AssetImage("assets/images/menu.png"),size: 30,

                              color: Colors.white,

                            ),

                            Text(AppLocalizations.of(context).translate('apple'),
                              style: TextStyle(color: Colors.white,fontSize: 22),),



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

                    )
                    ,

Container(
  height: MediaQuery.of(context).size.height/1.5,
  child: ListView(
scrollDirection: Axis.horizontal,
    physics: BouncingScrollPhysics(),
    children: <Widget>[
      Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(

              children: <Widget>[
                CircleAvatar(backgroundImage: NetworkImage(CRUD.imgUrl),

                  radius: 65,

                ),

                SizedBox(width: 30,),
                InkWell(
                  onTap: (){
//                            Navigator.push(
//                              context,
//                              MaterialPageRoute(builder: (context) => EditProfile()),
//                            );

                  },
                  child: Card(

                    color: Colors.blueAccent,

                    shape: RoundedRectangleBorder(

                      borderRadius: BorderRadius.circular(15.0),

                    ),

                    elevation: 1,

                    child:   Container(



                        height: 31,

                        width: 200,





                        child: Center(child: Text(CRUD.name,

                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white)

                        ))),

                  ),
                ),







              ],
            ),
          ),
        ],
      ),



    ],),
),


















                    Divider(height: 10,color: Colors.black,thickness: 1,)










                  ],







                ),



              ),

Positioned.fill(
    child: Align(
        alignment: Alignment.bottomCenter,
        child: Stack(
            children: <Widget>[
    Image.asset("assets/images/footer_social.png",height: 80,),

    Positioned.fill(
        left: 40,
        child:
    Align(

      alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            FaIcon(FontAwesomeIcons.edit,size: 25,color: Colors.white,),
            SizedBox(width: 10,),
            Text("Read",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),

          ],
        ))),
              Positioned.fill(
                  right: 40,
                  child:
                  Align(

                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          FaIcon(FontAwesomeIcons.edit,size: 25,color: Colors.white,),
                          SizedBox(width: 10,),
                          Text("Edit",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                        ],
                      ),)),
            ],


),


))
            ]),
      ),



    );



  }
}
