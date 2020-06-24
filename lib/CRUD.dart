

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

class CRUD{

  static int myid;

  static String name="your name";
  static String email="";
  static String password="";
  static String Number="";
  static String Occupation="";
  static String bio="";
  static int taps=0;
  static String imgUrl="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png";
  static String youtube="add your link";
  static String whatsapp="add your link";
  static String twitter="add your link";
  static String tiktok="add your link";
  static String soundcloud="add your link";
  static String snapchat="add your link";
  static String paypal="add your link";
  static String linkendin="add your link";
  static String instagram="add your link";
  static String music="add your link";
  static String venmo="add your link";
  static String facebook="add your link";
  static String cashapp="add your link";


static double headingFont=25;
static refresh(){

  name="your name";
  Occupation="Your Occupation";
  Number="Your Number";
  imgUrl="https://firebasestorage.googleapis.com/v0/b/nomitap-6dd55.appspot.com/o/Recent%2Fimg_inside.png?alt=media&token=5fae7f82-ce29-4915-b2d4-cef9aaa1e939";
  youtube="add your link";
  whatsapp="add your link";
  twitter="add your link";
  tiktok="add your link";
  soundcloud="add your link";
  snapchat="add your link";
  paypal="add your link";
  linkendin="add your link";
  instagram="add your link";
  music="add your link";
  venmo="add your link";
  facebook="add your link";
  cashapp="add your link";



}

 static  final  _auth = FirebaseAuth.instance;
  static final databaseReference = FirebaseDatabase.instance.reference();
  static void addData() async {




    FirebaseUser loggedinUser;
    String myuserid;
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedinUser = user;
        print(loggedinUser.uid);
        myuserid = loggedinUser.uid;
      }
    }
    catch (e) {
      print(e);
    }





    await databaseReference.child("users").child(myuserid).set({
      'taps': CRUD.taps,
      'Name': CRUD.name,
      'Number': CRUD.Number,
      'Occupation': CRUD.Occupation,
      'email': CRUD.email,
      'img_url': CRUD.imgUrl,
      'password': CRUD.password,
      'bio': CRUD.bio,
      'youtube_un': CRUD.youtube,
      'whatsapp_un': CRUD.whatsapp,
      'twitter_un': CRUD.twitter,
      'soundcloud_un': CRUD.soundcloud,
      'snapchat_un': CRUD.snapchat,
      'paypal_un': CRUD.paypal,
      'music_un': CRUD.music,
      'linkedin_un': CRUD.linkendin,
      'instagram_un': CRUD.instagram,
      'facebook_un': CRUD.facebook,
      'cashapp_un': CRUD.cashapp,
      'venmo_un': CRUD.venmo,
      'tiktok_un': CRUD.tiktok,


    });


  }

static updateTaps()async{


  FirebaseUser loggedinUser;
  String myuserid;
  try {
    final user = await _auth.currentUser();
    if (user != null) {
      loggedinUser = user;
      print(loggedinUser.uid);
      myuserid = loggedinUser.uid;
    }
  }
  catch (e) {
    print(e);
  }





  await databaseReference.child("users").child(myuserid).update({
    'taps': CRUD.taps,


  });

}

static getData()async{

  final databaseReference = FirebaseDatabase.instance.reference().child("users");

  final _auth=FirebaseAuth.instance;
  FirebaseUser loggedinUser;
  String myuserid;
  try {
    final user = await _auth.currentUser();
    if (user != null) {
      loggedinUser = user;
      print(loggedinUser.uid);
      myuserid=loggedinUser.uid;
    }
  }
  catch(e)
  {
    print(e);
  }
  

 databaseReference.orderByKey().equalTo(myuserid).once().
  then((DataSnapshot dataSnapshot){
   Map<dynamic, dynamic> values = dataSnapshot.value;
   values.forEach((key,values) {

     whatsapp=values["whatsapp_un"];
     twitter=values["twitter_un"];
     venmo=values["venmo_un"];
     facebook=values["facebook_un"];
     snapchat=values["snapchat_un"];
     youtube=values["youtube_un"];
     instagram=values["instagram_un"];
     tiktok=values["tiktok_un"];
     linkendin=values["linkedin_un"];
     paypal=values["paypal_un"];
     music=values["music_un"];
     cashapp=values["cashapp_un"];
     soundcloud=values["soundcloud_un"];
taps=values["taps"];
name=values["Name"];
Number=values["Number"];
Occupation=values["Occupation"];
imgUrl=values["img_url"];
  bio=values["bio"];
   });

  });



}


}