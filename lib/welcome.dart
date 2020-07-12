import 'package:firebase_auth/firebase_auth.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomi/CRUD.dart';
import 'package:nomi/profile.dart';
import 'package:nomi/readx.dart';
import 'package:nomi/write.dart';

class Welcome extends StatefulWidget {
  int id;
  Welcome(this.id) {
    CRUD.myid = id;
  }

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final List<Widget> _children = [
    ReadX(),
    Write(),
    Profile(),
  ];

  int _index = 1;

  @override
  void initState() {
    // TODO: implement initState
    if (CRUD.myid == 1) {
      CRUD.addData();
      CRUD.myid = 3;
    }

    CRUD.getData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: willpop,
      child: Scaffold(

//        bottomNavigationBar: FloatingNavbar(
//          selectedBackgroundColor: Colors.white,
//          iconSize: 25,
//          fontSize: 18,
//          backgroundColor: Colors.blue,
//          onTap: (int val) => setState(() => _index = val),
//          currentIndex: _index,
//          items: [
////          FloatingNavbarItem(icon:Image.asset("person_icon.png")  , title: 'Home'),
////          FloatingNavbarItem(icon:Image.asset("person_icon.png")  , title: 'Home'),
////          FloatingNavbarItem(icon:Image.asset("person_icon.png")  , title: 'Home'),
//
//            FloatingNavbarItem(
//              icon: FaIcon(
//                FontAwesomeIcons.table,
//              ).icon,
//              title: 'Read',
//            ),
//            FloatingNavbarItem(
//                icon: FaIcon(FontAwesomeIcons.edit).icon, title: 'Write'),
//            FloatingNavbarItem(
//                icon: FaIcon(FontAwesomeIcons.user).icon, title: 'Profile'),
//          ],
//        ),
        body: _children[_index],
      ),
    );
  }

  Future<bool> willpop() {

    FirebaseAuth.instance.currentUser().then((firebaseUser){
      if(firebaseUser == null)
      {
        //signed out
      }
      else if(firebaseUser!=null){
        //signed in
      SystemNavigator.pop();
      }
    });
  }
}
