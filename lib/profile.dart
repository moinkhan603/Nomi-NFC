import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:nomi/CRUD.dart';
import 'package:nomi/qrGenerator.dart';
import 'DemoLocalizations.dart';
import 'editProfile.dart';
class Profile extends StatefulWidget {


  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {




  @override
  void initState() {
    // TODO: implement initState
    if(CRUD.myid==2)
      {

        CRUD.getData();
      }




    super.initState();


  }

  @override
  Widget build(BuildContext context) {

    setState(() {

    });
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65.0),
        child: AppBar(

          leading: Padding(
            padding: const EdgeInsets.only(top:18.0),
            child: IconButton(
              icon: ImageIcon(AssetImage("assets/images/menu.png"), size: 30,
                color: Colors.white,),

            ),
          ),

          title: Padding(
            padding: const EdgeInsets.only(top:20.0),
            child: Text("Profile", style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22),),
          ),centerTitle: true,
          backgroundColor: Color(0xff0087E3),
          actions: <Widget>[

            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.only(top:25.0),
                child: Text(
                    AppLocalizations.of(context).translate(
                        'logout'),
                    style: TextStyle(
                        color: Colors.white, fontSize: 18)),
              ),
            ),

            SizedBox(width: 5,),
            Padding(
              padding: const EdgeInsets.only(right:4.0,top: 20),
              child: ImageIcon(

                AssetImage("assets/images/right_arrow.png",),
                size: 12,
                color: Colors.red,

              ),
            )
          ],
        ),
      ),

body: SingleChildScrollView(
  child:   new Stack(
  
      children: <Widget>[
  
  new Container(
  
  
  
  decoration: new BoxDecoration(
  
  
  
  image: new DecorationImage(image: new AssetImage("assets/images/bg_option2.png"), fit: BoxFit.cover,),
  
      ),
  
  
  
     child: Column(

       children: <Widget>[

//         SafeArea(
//
//           child: Padding(
//
//             padding: const EdgeInsets.symmetric(horizontal:10,vertical: 20 ),
//
//             child: Row(
//
//
//
//               crossAxisAlignment: CrossAxisAlignment.end,
//
//  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//
//               children: <Widget>[
//
//
//
//              ImageIcon(
//
//                      AssetImage("assets/images/menu.png"),size: 30,
//
//                  color: Colors.white,
//
//                ),
//
//  Text(AppLocalizations.of(context).translate('profile'),
//    style: TextStyle(color: Colors.white,fontSize: 22),),
//
//
//
//  Row(children: <Widget>[
//
//    GestureDetector(
//      onTap: (){
//
//_logOut();
//
//      },
//
//      child: Text(AppLocalizations.of(context).translate('logout'),
//          style: TextStyle(color: Colors.white,fontSize: 18)),
//    ),
//
//      ImageIcon(
//
//        AssetImage("assets/images/right_arrow.png"),
//
//        color: Colors.red,
//
//      )
//
//  ],)
//
//  ,
//
//
//
//
//
//             ],),
//
//           ),
//
//         ),




  SizedBox(height: 20,),
         CircleAvatar(backgroundImage: NetworkImage(CRUD.imgUrl),

           radius: 65,
           backgroundColor: Colors.transparent,

         )

  ,

         SizedBox(height: 15,),

         Text(CRUD.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),

         SizedBox(height: 10,),



         InkWell(
           onTap: (){
CRUD.taps=CRUD.taps+1;

CRUD.addData();
             Navigator.push(
               context,
               MaterialPageRoute(builder: (context) => QRGenerator()),
             );

           },
           child: Text(AppLocalizations.of(context).translate('generateqr'),
             style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18

           ,color: Colors.blue

           ),),
         ),

         SizedBox(height: 10,),

         Text("i'm "+CRUD.name),

         SizedBox(height: 10,),

        // Text(AppLocalizations.of(context).translate('tap')),
         Text("taps: "+CRUD.taps.toString(),style: TextStyle(color: Colors.black),),
         SizedBox(height: 10,),


  InkWell(
    onTap: (){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EditProfile()),
      );

    },
    child: Card(

      color: Colors.white.withOpacity(0.7),

      shape: RoundedRectangleBorder(

        borderRadius: BorderRadius.circular(15.0),

      ),

      elevation: 1,

      child:   Container(



          height: 40,

    width: 150,





          child: Center(child: Text(AppLocalizations.of(context).translate('edtprfile'),

              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue)

          ))),

    ),
  ),

SizedBox(height: 30,),

    _detailsWidget(AppLocalizations.of(context).translate('specilize'),

        AppLocalizations.of(context).translate('specilizet')

    ),

         SizedBox(height: 15,),

         _detailsWidget(AppLocalizations.of(context).translate('unlimitedtaps'),

             AppLocalizations.of(context).translate('unlimitedtapst')
         ),

         SizedBox(height: 15,),

         _detailsWidget(AppLocalizations.of(context).translate('privacy'),

             AppLocalizations.of(context).translate('privacyt')
         ),











SizedBox(height: 55,)





       ],







     ),
  
  
  
      ),


        Positioned.fill(
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Divider(height: 10,color: Colors.black,thickness: 1,)))
  
  
      ]),
),



//


//      ),

    );
  }

  _logOut() async{
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    await _firebaseAuth.signOut().then((_){
     // Navigator.of(context).pushNamedAndRemoveUntil("/signIN", ModalRoute.withName("/profile"));
   CRUD.refresh();
    Navigator.pop(context);
    });
  }




}

class _detailsWidget extends StatelessWidget {
 String heading;
 String detail;
 _detailsWidget(this.heading,this.detail);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

        Text(heading,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          SizedBox(height: 12,),
        Text(detail,style: TextStyle(fontSize: 18),),

      ],),
    );
  }
}
