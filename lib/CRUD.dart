

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

class CRUD{

  static int myid;

  static String name="your name";
  static String email="";
  static String password="";
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



  static void addData() async {



    final _auth = FirebaseAuth.instance;
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


    final databaseReference = FirebaseDatabase.instance.reference();


    await databaseReference.child("users").child(myuserid).set({
      'taps': CRUD.taps,
      'Name': CRUD.name,
      'email': CRUD.email,
      'img_url': CRUD.imgUrl,
      'password': CRUD.password,
      'bio': CRUD.bio,
      'youtube_un': "www.youtube.com/"+CRUD.youtube,
      'whatsapp_un':"www.whatsapp.com/"+ CRUD.whatsapp,
      'twitter_un': "www.twitter.com/"+CRUD.twitter,
      'soundcloud_un':"www.soundcloud.com/"+ CRUD.soundcloud,
      'snapchat_un': "www.snapchat.com/"+CRUD.snapchat,
      'paypal_un': "www.paypal.com/"+CRUD.paypal,
      'music_un': "www.music.com/"+CRUD.music,
      'linkedin_un': "www.linkedin.com/"+CRUD.linkendin,
      'instagram_un': "www.instagram.com/"+CRUD.instagram,
      'facebook_un':"www.facebook.com/"+ CRUD.facebook,
      'cashapp_un': "www.cashapp.com/"+CRUD.cashapp,
      'venmo_un': "www.venmo.com/"+CRUD.venmo,
      'tiktok_un': "www.tiktok.com/"+CRUD.tiktok,


    });


  }

static updateTaps()async{

  final _auth = FirebaseAuth.instance;
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


  final databaseReference = FirebaseDatabase.instance.reference();


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
imgUrl=values["img_url"];
  bio=values["bio"];
   });

  });



}


}