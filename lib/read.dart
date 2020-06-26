import 'package:flutter/material.dart';
import 'package:flutter_nfc_reader/flutter_nfc_reader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nfc_in_flutter/nfc_in_flutter.dart';
import 'package:nomi/CRUD.dart';
import 'package:url_launcher/url_launcher.dart';

import 'DemoLocalizations.dart';
import 'editProfile.dart';

class Read extends StatefulWidget {
  String btntxt;
  String name;
  String result = " ";
  String title;
  Read(this.btntxt, this.name, this.title);
  @override
  _ReadState createState() => _ReadState();
}

class _ReadState extends State<Read> {
  _launchURL(url) async {
    // const url = 'https://flutter.dev';
    if (await canLaunch('https://'+url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    CRUD.getData();

    super.initState();

    if (widget.btntxt == "Write") {
      Fluttertoast.showToast(
          msg: "Click Write so you will be able to write on"
              " NFC Chip",
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          gravity: ToastGravity.CENTER);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65.0),
        child: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: IconButton(
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
                Navigator.pop(context);
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
//                    SafeArea(
//
//                      child: Padding(
//
//                        padding: const EdgeInsets.symmetric(horizontal:10,vertical: 20 ),
//
//                        child: Row(
//
//
//
//                          crossAxisAlignment: CrossAxisAlignment.end,
//
//                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//
//                          children: <Widget>[
//
//
//
//                            ImageIcon(
//
//                              AssetImage("assets/images/menu.png"),size: 30,
//
//                              color: Colors.white,
//
//                            ),
//
//                            Text(AppLocalizations.of(context).translate('apple'),
//                              style: TextStyle(color: Colors.white,fontSize: 22),),
//
//
//
//                            Row(children: <Widget>[
//
//                              GestureDetector(
//                                onTap: (){
//                                  Navigator.pop(context);
//
//                                },
//                                child: Text(AppLocalizations.of(context).translate('logout'),
//
//                                    style: TextStyle(color: Colors.white,fontSize: 18)),
//                              ),
//
//                              ImageIcon(
//
//                                AssetImage("assets/images/right_arrow.png"),
//
//                                color: Colors.red,
//
//                              )
//
//                            ],)
//
//                            ,
//
//
//
//
//
//                          ],),
//
//                      ),
//
//                    )

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
                                  onTap: () {
//                            Navigator.push(
//                              context,
//                              MaterialPageRoute(builder: (context) => EditProfile()),
//                            );
                                  },
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
                child: Text(
                  widget.result,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ))),
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
                              onTap: () {
                                if (widget.btntxt == "Read") {
                                  ReadNfc();
                                } else {
                                  WriteNfc();
                                }
                              },
                              child: Text(
                                widget.btntxt,
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )),
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

  void ReadNfc() async {
    NDEFMessage message = await NFC.readNDEF(once: true).first;
    print("payload: ${message.payload}");
    setState(() {
      //  widget.result=message.payload;
    });
    _launchURL(message.payload);

    print("yes");
    Fluttertoast.showToast(msg: "Read Successfully!", backgroundColor: Colors.green);
  }

  void WriteNfc() {
    FlutterNfcReader.write(" ", widget.name).then((response) {
      print(response.content);

      _asyncInputDialog(context, widget.title);

      FlutterNfcReader.stop().then((response) {
        print(response.status.toString());
      });
    });
  }
// NDEFMessage newMessage = NDEFMessage.withRecords(
//     NDEFRecord.p("text/plain", "hello world")
// );
// Stream<NDEFTag> stream = NFC.writeNDEF(newMessage, once: true);

// stream.listen((NDEFTag tag) {
//     print("only wrote to one tag!");

// });

}

Future<String> _asyncInputDialog(BuildContext context, String title) async {
  return showDialog<String>(
    context: context,
    barrierDismissible:
        false, // dialog is dismissible with a tap on the barrier
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.black87,
        title: Text(
          "Your " + title + " Username has Successfully written",
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Close',
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
