

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

class CRUD{

  static int myid;

  static String name="your name";
  static String email="";
  static String password;
  static String bio;
  static String imgUrl="https://firebasestorage.googleapis.com/v0/b/nomitap-6dd55.appspot.com/o/Recent%2Fimg_inside.png?alt=media&token=5fae7f82-ce29-4915-b2d4-cef9aaa1e939";
  static String youtube="add link";
  static String whatsapp="add link";
  static String twitter="add link";
  static String tiktok="add link";
  static String soundcloud="add link";
  static String snapchat="add link";
  static String paypal="add link";
  static String linkendin="add link";
  static String instagram="add link";
  static String music="add link";
  static String venmo="add link";
  static String facebook="add link";
  static String cashapp="add link";



static refresh(){

  name="your name";
  imgUrl="https://firebasestorage.googleapis.com/v0/b/nomitap-6dd55.appspot.com/o/Recent%2Fimg_inside.png?alt=media&token=5fae7f82-ce29-4915-b2d4-cef9aaa1e939";
  youtube="add link";
  whatsapp="add link";
  twitter="add link";
  tiktok="add link";
  soundcloud="add link";
  snapchat="add link";
  paypal="add link";
  linkendin="add link";
  instagram="add link";
  music="add link";
  venmo="add link";
  facebook="add link";
  cashapp="add link";



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
name=values["Name"];
imgUrl=values["img_url"];
     print(values["whatsapp_un"]);
     print(values["twitter_un"]);
     print(values["venmo_un"]);
     print(values["facebook_un"]);
     print(values["snapchat_un"]);
     print(values["instagram_un"]);
   });

  });



}


}