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
  
  Text(AppLocalizations.of(context).translate('profile'),
    style: TextStyle(color: Colors.white,fontSize: 22),),
  
  
  
  Row(children: <Widget>[
  
    GestureDetector(
      onTap: (){

_logOut();

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
  
  
  
  
  
         CircleAvatar(backgroundImage: NetworkImage(CRUD.imgUrl),
  
           radius: 65,
           backgroundColor: Colors.transparent,
  
         )
  
  ,
  
         SizedBox(height: 5,),
  
         Text(CRUD.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
  
         SizedBox(height: 5,),
  
  
  
         InkWell(
           onTap: (){

             Navigator.push(
               context,
               MaterialPageRoute(builder: (context) => QRGenerator()),
             );

           },
           child: Text(AppLocalizations.of(context).translate('generateqr'),
             style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20

           ,color: Colors.blue

           ),),
         ),
  
         SizedBox(height: 5,),
  
         Text(AppLocalizations.of(context).translate('man')),
  
         SizedBox(height: 5,),
  
         Text(AppLocalizations.of(context).translate('tap')),
  
         SizedBox(height: 5,),
  

  InkWell(
    onTap: (){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EditProfile()),
      );

    },
    child: Card(

      color: Colors.white.withOpacity(0.6),

      shape: RoundedRectangleBorder(

        borderRadius: BorderRadius.circular(15.0),

      ),

      elevation: 1,

      child:   Container(



          height: 30,

    width: 150,





          child: Center(child: Text(AppLocalizations.of(context).translate('edtprfile'),

              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue)

          ))),

    ),
  ),
  
  
  
    _detailsWidget(AppLocalizations.of(context).translate('specilize'),

        AppLocalizations.of(context).translate('specilizet')
  
    ),
  
         SizedBox(height: 5,),
  
         _detailsWidget(AppLocalizations.of(context).translate('unlimitedtaps'),

             AppLocalizations.of(context).translate('unlimitedtapst')
         ),
  
         SizedBox(height: 5,),
  
         _detailsWidget(AppLocalizations.of(context).translate('privacy'),

             AppLocalizations.of(context).translate('privacyt')
         ),
  
  
  
  
  
  
  Divider(height: 10,color: Colors.black,thickness: 1,)
  
  
  
  
  
  
  
  
  
  
       ],
  
  
  
  
  
  
  
     ),
  
  
  
      ),
  
  
  
  
  
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
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

        Text(heading,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          SizedBox(height: 5,),
        Text(detail,style: TextStyle(fontSize: 18),),

      ],),
    );
  }
}
