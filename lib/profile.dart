import 'package:flutter/material.dart';
import 'package:nomi/qrGenerator.dart';
import 'editProfile.dart';
class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
  
  Text("Profile",style: TextStyle(color: Colors.white,fontSize: 22),),
  
  
  
  Row(children: <Widget>[
  
    Text("Log out",style: TextStyle(color: Colors.white,fontSize: 18)),
  
      ImageIcon(
  
        AssetImage("assets/images/right_arrow.png"),
  
        color: Colors.red,
  
      )
  
  ],)
  
  ,
  
  
  
  
  
             ],),
  
           ),
  
         ),
  
  
  
  
  
         CircleAvatar(backgroundImage: AssetImage("assets/images/img_inside.png"),
  
           radius: 65,
  
         )
  
  ,
  
         SizedBox(height: 5,),
  
         Text("Vincent Romero",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
  
         SizedBox(height: 5,),
  
  
  
         InkWell(
           onTap: (){

             Navigator.push(
               context,
               MaterialPageRoute(builder: (context) => QRGenerator()),
             );

           },
           child: Text("Generate QR Code",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20

           ,color: Colors.blue

           ),),
         ),
  
         SizedBox(height: 5,),
  
         Text("im a man"),
  
         SizedBox(height: 5,),
  
         Text("taps: 0"),
  
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





          child: Center(child: Text("Edit Profile",

              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue)

          ))),

    ),
  ),
  
  
  
    _detailsWidget("Specialize",
  
    "With Nomi Direct you can tap people direct to any app you choose"
  
    ),
  
         SizedBox(height: 5,),
  
         _detailsWidget("Unlimited Taps",
  
             "Your Nomi is water proof and will work "
  
                 "indefinitely with an unlimited number of taos."
  
         ),
  
         SizedBox(height: 5,),
  
         _detailsWidget("Privacy",
  
             "No Personal passwords are ever needed to link"
  
                 "social accounts with Nomi!"
  
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
