import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomi/CRUD.dart';
import 'package:nomi/profile.dart';
import 'package:nomi/readx.dart';
import 'package:nomi/write.dart';
class Welcome extends StatefulWidget {

  int id;
  Welcome(this.id){
   CRUD.myid=id;
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
    if(widget.id==2)
      {
        CRUD.getData();
      }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {




    return Scaffold(
      bottomNavigationBar: FloatingNavbar(
selectedBackgroundColor: Colors.white,
        iconSize: 30,
        fontSize: 15,
        backgroundColor: Colors.blue,
        onTap: (int val) => setState(() => _index = val),
        currentIndex: _index,

        items: [
//          FloatingNavbarItem(icon:Image.asset("person_icon.png")  , title: 'Home'),
//          FloatingNavbarItem(icon:Image.asset("person_icon.png")  , title: 'Home'),
//          FloatingNavbarItem(icon:Image.asset("person_icon.png")  , title: 'Home'),

          FloatingNavbarItem( icon: FaIcon(FontAwesomeIcons.table).icon, title: 'Read',

          ),
          FloatingNavbarItem( icon: FaIcon(FontAwesomeIcons.edit).icon, title: 'Write'),
          FloatingNavbarItem(icon: FaIcon(FontAwesomeIcons.user).icon, title: 'Profile'),

        ],
      ),


      body: _children[_index],


    );
  }
}
