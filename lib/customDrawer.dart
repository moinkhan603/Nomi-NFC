import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomi/profile.dart';
import 'package:nomi/vcard.dart';
import 'package:nomi/write.dart';
import 'package:permission_handler/permission_handler.dart';

import 'CRUD.dart';
class CustomDrawer{


 static buildDrawer(BuildContext context) {
    print("dsd");
    return  Drawer(
      child: Container(
        padding: const EdgeInsets.only(left: 40.0, right: 40),
        decoration: BoxDecoration(
            color:  Colors.white, boxShadow: [BoxShadow(color: Colors.white)]),
        width:200,
        child: SafeArea(

          /// ---------------------------
          /// Building scrolling  content for drawer .
          /// ---------------------------

          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[



                /// ---------------------------
                /// Building header for drawer .
                /// ---------------------------


                SizedBox(height:50.0),

                /// ---------------------------
                /// Building header title for drawer .
                /// ---------------------------

                Text(
                  "Main Menu",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                ),


                /// ---------------------------
                /// Building items list  for drawer .
                /// ---------------------------

                SizedBox(height: 30.0),

                InkWell(
                    onTap: (){

                      Navigator.popAndPushNamed(context, '/profile');
                    },
                    child: _buildRow(FontAwesomeIcons.userAlt, "My Profile")),
                _buildDivider(),
                InkWell(
                    onTap: (){
                      Navigator.popAndPushNamed(context, '/read');
                    },
                    child: _buildRow(FontAwesomeIcons.tag, "Nomi Tag")),
                _buildDivider(),
                InkWell(
                    onTap: (){
                      Navigator.popAndPushNamed(context, '/write');
                    },
                    child: _buildRow(FontAwesomeIcons.mobile, "Write a Nomi")),
                _buildDivider(),

                _buildRow(FontAwesomeIcons.building, "Buy a Nomi",),
                _buildDivider(),
                InkWell(
                    onTap: ()async{

                      final PermissionHandler _permissionHandler = PermissionHandler();
                      var result = await _permissionHandler.requestPermissions([PermissionGroup.storage]);

                      if (result[PermissionGroup.storage] == PermissionStatus.granted) {
                        VCARD v=new VCARD();
                        v.saveVcard();
                      }


                     // v.Sharefile();
                    },
                    child: _buildRow(FontAwesomeIcons.addressCard, "V Card",)),
                _buildDivider(),
                _buildRow(Icons.help, "Tutorial",
                ),

                _buildDivider(),
                InkWell(
                    onTap: (){
                      CRUD.logOut();
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: _buildRow(FontAwesomeIcons.signOutAlt, "Logout")),
                _buildDivider(),

                Text("NOMI TAP",style: TextStyle(color: Colors.black,fontSize: 25,
                    fontWeight: FontWeight.bold,fontStyle: FontStyle.normal
                ),)
              ],
            ),
          ),
        ),
      ),
    );

  }

  static Divider _buildDivider() {
    return Divider(
      color: Colors.grey.shade600,
    );
  }


 static Widget _buildRow(IconData icon, String title, {bool showBadge = false}) {
    final TextStyle tStyle = TextStyle(color: Colors.black, fontSize: 16.0);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(children: [
        Icon(
          icon,
          color: Colors.black,
        ),
        SizedBox(width: 10.0),
        Text(
          title,
          style: tStyle,
        ),
        Spacer(),
        if(showBadge)
          Material(
            color: Colors.deepOrange,
            elevation: 5.0,
            shadowColor: Colors.red,
            borderRadius: BorderRadius.circular(5.0),
            child: Container(
              width: 25,
              height: 25,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Text(
                "0",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ) ,
      ],),
    );
  }


}