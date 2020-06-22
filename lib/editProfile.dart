import 'dart:io';
import 'dart:ui';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:nomi/CRUD.dart';
import 'package:path/path.dart' as Path;
import 'DemoLocalizations.dart';
import 'package:firebase_auth/firebase_auth.dart';
class EditProfile extends StatefulWidget {






  @override
  _EditProfileState createState() => _EditProfileState();
}




class _EditProfileState extends State<EditProfile> {


  bool showSpinner = false;

  File _image;
  String _uploadedFileURL = "https://firebasestorage.googleapis.com/v0/b/nomitap-6dd55.appspot.com/o/Recent%2Fimg_inside.png?alt=media&token=5fae7f82-ce29-4915-b2d4-cef9aaa1e939";

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: new Stack(

            children: <Widget>[

              new Container(


                decoration: new BoxDecoration(


                  image: new DecorationImage(
                    image: new AssetImage("assets/images/bg_option.png"),
                    fit: BoxFit.fill,),

                ),


                child: SingleChildScrollView(
                  child: Column(

                    children: <Widget>[

                      SafeArea(

                        child: Padding(

                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 30),

                          child: Row(


                            crossAxisAlignment: CrossAxisAlignment.end,

                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: <Widget>[


                              ImageIcon(

                                AssetImage("assets/images/menu.png"), size: 30,

                                color: Colors.white,

                              ),

                              Text(AppLocalizations.of(context).translate(
                                  'edtprfile'),

                                style: TextStyle(
                                    color: Colors.white, fontSize: 22),),


                              Row(children: <Widget>[


                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      showSpinner = true;
                                    });
                                    addData();
                                    setState(() {
                                      showSpinner = false;
                                    });
                                  },
                                  child: Text(
                                      AppLocalizations.of(context).translate(
                                          'savevtn'),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18)),
                                ),


                              ],)

                              ,


                            ],),

                        ),

                      ),


                      Stack(

                        children: <Widget>[
                          InkWell(

                            onTap: () {
                              chooseFile();
                              setState(() {
                                showSpinner = false;
                              });
                            },
                            child: CircleAvatar(backgroundImage: NetworkImage(
                                CRUD.imgUrl),
                              backgroundColor: Colors.transparent,
                              radius: 65,

                            ),
                          ),

                          Positioned.fill(
                            bottom: 8,
                            right: 20,
                            child: Align(
                              alignment: Alignment.bottomRight,

                              child: FaIcon(
                                FontAwesomeIcons.camera, color: Colors.blue,),),
                          )


                        ],

                      )

                      ,

                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height / 1.6,
                        child: ListView(
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.symmetric(vertical: 10),
                          children: <Widget>[
                            _info(AppLocalizations.of(context).translate(
                                'name'), 1),
                            _info(AppLocalizations.of(context).translate(
                                'email'), 2),
                            _info(AppLocalizations.of(context).translate('bio'),
                                3),
                            SizedBox(height: 20,),
                            Align(


                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 14.0),
                                  child: Text(
                                    AppLocalizations.of(context).translate(
                                        'social'),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),),
                                )),

                            _info2(4, AppLocalizations.of(context).translate(
                                'yutub'), "assets/images/youtube.png"),
                            _info2(5, AppLocalizations.of(context).translate(
                                'wtsp'), "assets/images/whatsapp.png"),
                            _info2(6, AppLocalizations.of(context).translate(
                                'twter'), "assets/images/twitter.png"),
                            _info2(7, AppLocalizations.of(context).translate(
                                'tktok'), "assets/images/tiktok.png"),
                            _info2(8, AppLocalizations.of(context).translate(
                                'soundcld'), "assets/images/soundcloud.png"),
                            _info2(9, AppLocalizations.of(context).translate(
                                'snpcht'), "assets/images/snapchat.png"),
                            _info2(10, AppLocalizations.of(context).translate(
                                'pypl'), "assets/images/paypal.png"),
                            _info2(11, AppLocalizations.of(context).translate(
                                'msc'), "assets/images/music.png"),
                            _info2(12, AppLocalizations.of(context).translate(
                                'lnk'), "assets/images/linkedin.png"),
                            _info2(13, AppLocalizations.of(context).translate(
                                'insta'), "assets/images/instagram.png"),
                            _info2(14, AppLocalizations.of(context).translate(
                                'fb'), "assets/images/facebook.png"),
                            _info2(15, AppLocalizations.of(context).translate(
                                'cash'), "assets/images/cashapp.png"),
                            _info2(16, AppLocalizations.of(context).translate(
                                'venmo'), "assets/images/venmo.png"),


                          ],),
                      )
                      ,


                      Divider(height: 10, color: Colors.black, thickness: 1,)


                    ],


                  ),
                ),


              ),


            ]),
      ),


    );
  }

  void chooseFile() async {
    File selected = await ImagePicker.pickImage(source: ImageSource.gallery);

    this.setState(() {
      _image = selected;
      print(_image);
    });

    setState(() {
      showSpinner = true;
    });

    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('Recent/${Path.basename(_image.path)}}');
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    await uploadTask.onComplete;
    print('File Uploaded');
    storageReference.getDownloadURL().then((fileURL) {
      setState(() {
        _uploadedFileURL = fileURL;
        print(fileURL);
        CRUD.imgUrl = fileURL;
        showSpinner = false;
      });
    });
  }


  void addData() async {



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

    setState(() {
      showSpinner=true;
    });

    final databaseReference = FirebaseDatabase.instance.reference();


    await databaseReference.child("users").child(myuserid).set({
      'Name': CRUD.name,
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

    });
    setState(() {
      showSpinner=false;
    });

  }
}
class _info extends StatelessWidget {

  String heading;
  int id;
  String imgPath;

  _info(@required this.heading,@required this.id,);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: <Widget>[
          Align(


              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left:14.0),
                child: Text(heading,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
              )),

SizedBox(height: 5,),
          Material(
            elevation: 1.0,
            borderRadius: BorderRadius.all(Radius.circular(12)),
            child: TextField(

              onChanged: (String value){
                //email=value.trim();
                if(id==1)
                  {
                    CRUD.name=value;
                  }
                else if (id==2)
                  {
                    CRUD.email=value;
                  }
                else if (id==3)
                {
                  CRUD.bio=value;
                }



              },
              cursorColor: Colors.blue,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.14),
//                  prefixIcon:  ImageIcon(
//
//                    AssetImage("assets/images/youtube.png"),
//
//                    //color: Colors.black87,
//
//                  ),
                // hintText: "Password",
                  hintStyle: TextStyle(fontWeight: FontWeight.bold
                      ,color: Color(0xff0087E3)
                  ),
                  border: InputBorder.none,
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
            ),
          ),

          SizedBox(height: 10,),

        ],
      ),
    );
  }
}



class _info2 extends StatelessWidget {

String hintText;
  int id;
  String imgPath;

  _info2(@required this.id,this.hintText, this.imgPath);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12,vertical: 10),
      child: Column(
        children: <Widget>[


          Material(
            elevation: 1.0,
            borderRadius: BorderRadius.all(Radius.circular(12)),
            child: TextField(
textAlign: TextAlign.center,
              onChanged: (String value){
                //email=value.trim();
if(id==4)
  {
    CRUD.youtube=value;
  }

            else if(id==5){
              CRUD.whatsapp=value;
            }

            else if(id==6){
              CRUD.twitter=value;
            }

            else if(id==7){
              CRUD.tiktok=value;
            }

            else if(id==8){
              CRUD.soundcloud=value;
            }

            else if(id==9){
              CRUD.snapchat=value;
            }

            else if(id==10){
              CRUD.paypal=value;
            }

            else if(id==11){
              CRUD.music=value;
            }

            else if(id==12){
              CRUD.linkendin=value;
            }
            else if(id==13){
              CRUD.instagram=value;
            }
            else if(id==14){
              CRUD.facebook=value;
            }

              else if(id==15){
              CRUD.cashapp=value;
            }

              else if(id==16){
              CRUD.venmo=value;
            }





              },
              cursorColor: Colors.blue,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.14),
//                  prefixIcon:  ImageIcon(
//
//                    AssetImage(imgPath),
//
//                    //color: Colors.black87,
//
//                  ),

              prefixIcon: Image.asset(
                imgPath,
                width: 20,
                height: 20,
                fit: BoxFit.fill,
              ),

                 hintText: hintText,
                  hintStyle: TextStyle(


                  ),
                  border: InputBorder.none,
                  contentPadding:
               EdgeInsets.symmetric(horizontal:22, vertical: 13)),

            ),
          ),

          SizedBox(height: 10,),

        ],
      ),
    );
  }
}
