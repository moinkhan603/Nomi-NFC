import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nfc_in_flutter/nfc_in_flutter.dart';
import 'package:nomi/CRUD.dart';
import 'package:nomi/write_example_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import 'DemoLocalizations.dart';
import 'customDrawer.dart';
import 'editProfile.dart';

class Read extends StatefulWidget {
  String btntxt;
  String name;
  String result = " ";
  String title;
String imgPath="assets/images/transparent.png";
  Read(this.btntxt, this.name, this.title);

  @override
  _ReadState createState() => _ReadState();
}

class _ReadState extends State<Read> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  StreamSubscription<NDEFMessage> _stream;
  bool _hasClosedWriteDialog = false;

  @override
  void initState() {
    // TODO: implement initState
    CRUD.getData();

    super.initState();

    if (widget.btntxt == "Write") {
      Fluttertoast.showToast(
          msg: "Click Write to write on NFC TAG",
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          gravity: ToastGravity.CENTER);
    } else if (widget.btntxt == "Read") {
      Fluttertoast.showToast(
          msg: "Click Read to Read the NFC TAG",
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          gravity: ToastGravity.CENTER);
    }
  }

  _launchURL(String userLink) async {
    var url = "https://" + userLink;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _startScanning() {
    if (this.mounted) {
      setState(() {
        _stream = NFC
            .readNDEF(alertMessage: "Custom message with readNDEF#alertMessage")
            .listen((NDEFMessage message) {
          if (message.isEmpty) {
            print("Read empty NDEF message");
            return;
          }
          print("Read NDEF message with ${message.records.length} records");
          for (NDEFRecord record in message.records) {
            print(
                "Record '${record.id ?? "[NO ID]"}' with TNF '${record
                    .tnf}', type '${record.type}', payload '${record
                    .payload}' and data '${record
                    .data}' and language code '${record.languageCode}'");
            setState(() {
              widget.imgPath="assets/images/tick.png";
            });
            _launchURL(record.payload);
          }
        }, onError: (error) {
          setState(() {
            widget.imgPath="assets/images/cross.png";
            _stream = null;
          });
          if (error is NFCUserCanceledSessionException) {
            print("user canceled");
          } else if (error is NFCSessionTimeoutException) {
            print("session timed out");
          } else {
            print("error: $error");
          }
        }, onDone: () {
          setState(() {
            _stream = null;
          });
        });
      });
    }
  }

  void _stopScanning() {
    _stream?.cancel();
    setState(() {
      _stream = null;
    });
  }

  @override
  void dispose() {

    _stopScanning();
    super.dispose();
  }

  void _scanFun() {
    if (widget.btntxt == "Read") {
      if (_stream == null) {
        _startScanning();
      } else {
        _stopScanning();
      }
      print('read pressed');
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                WriteExampleScreen(widget.btntxt, widget.name, widget.title)),
      );

      print('write pressed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: CustomDrawer.buildDrawer(context),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65.0),
        child: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: IconButton(
              onPressed: (){
                _key.currentState.openDrawer();
              },
              icon: ImageIcon(
                AssetImage("assets/images/menu.png"),
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Text(
              widget.title,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
          ),
          centerTitle: true,
          backgroundColor: Color(0xff0087E3),
          actions: <Widget>[
            GestureDetector(
              onTap: () {
                CRUD.logOut();
                Navigator.pushNamed(context, '/signin');
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Text(AppLocalizations.of(context).translate('logout'),
                    style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 4.0, top: 20),
              child: ImageIcon(
                AssetImage(
                  "assets/images/right_arrow.png",

                ),
                size: 12,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
      body: new Stack(children: <Widget>[
        SingleChildScrollView(
          child: new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("assets/images/social_detail_bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 1.1,
                  child: ListView(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundImage: NetworkImage(CRUD.imgUrl),
                                  radius: 65,
                                  backgroundColor: Colors.transparent,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Card(
                                    color: Colors.blueAccent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    elevation: 1,
                                    child: Container(
                                        height: 31,
                                        width: 200,
                                        child: Center(
                                            child: Text(CRUD.name,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                    color: Colors.white)))),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                //           Divider(height: 10,color: Colors.black,thickness: 1,)
              ],
            ),
          ),
        ),

        Positioned.fill(
            child: Align(
                alignment: Alignment.center,
                child:Image.asset(widget.imgPath,height: 100,),)),

        Positioned.fill(
            child: Align(
          alignment: Alignment.bottomCenter,
          child: Stack(
            children: <Widget>[
              Image.asset(
                "assets/images/footer_social.png",
                height: 85,
              ),
              Positioned.fill(
                  left: 40,
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          FaIcon(
                            FontAwesomeIcons.edit,
                            size: 25,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                              child: InkWell(
                                  onTap: _scanFun,
                                  child: Text(
                                    widget.btntxt,
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ))),
                        ],
                      ))),
              Positioned.fill(
                  right: 40,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FaIcon(
                          FontAwesomeIcons.edit,
                          size: 25,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditProfile()),
                              );
                            },
                            child: Text(
                              "Edit",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                      ],
                    ),
                  )),
            ],
          ),
        ))
      ]),
    );
  }
}

//Future<String> _asyncInputDialog(BuildContext context, String title) async {
//  return showDialog<String>(
//    context: context,
//    barrierDismissible:
//        false, // dialog is dismissible with a tap on the barrier
//    builder: (BuildContext context) {
//      return AlertDialog(
//        backgroundColor: Colors.black87,
//        title: Text(
//          "Your " + title + " Username has Successfully written",
//          style: TextStyle(color: Colors.white),
//        ),
//        actions: <Widget>[
//          FlatButton(
//            child: Text(
//              'Close',
//            ),
//            onPressed: () {
//              Navigator.of(context).pop();
//            },
//          ),
//        ],
//      );
//    },
//  );
//}
