import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nfc_in_flutter/nfc_in_flutter.dart';
import 'package:nomi/CRUD.dart';
import 'package:url_launcher/url_launcher.dart';

import 'DemoLocalizations.dart';
import 'editProfile.dart';

class RecordEditor {
  TextEditingController mediaTypeController;
  TextEditingController payloadController;

  RecordEditor() {
    mediaTypeController = TextEditingController();
    payloadController = TextEditingController();
  }
}

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
  StreamSubscription<NDEFMessage> _stream;
  List<RecordEditor> _records = [];
  bool _hasClosedWriteDialog = false;

  void _startScanning() {
    setState(() {
      _stream = NFC.readNDEF(alertMessage: "Read Successfully!").listen(
          (NDEFMessage message) {
        if (message.isEmpty) {
          print("Read empty NDEF message");
          return;
        }
        print("Read NDEF message with ${message.records.length} records");
        for (NDEFRecord record in message.records) {
          print(
              "Record '${record.id ?? "[NO ID]"}' with TNF '${record.tnf}', type '${record.type}', payload '${record.payload}' and data '${record.data}' and language code '${record.languageCode}'");
          Fluttertoast.showToast(
              msg: "Read Successfully : " '${record.payload}',
              backgroundColor: Colors.green);

          _launchURL('${record.payload}');
        }
      }, onError: (error) {
        setState(() {
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

  void _stopScanning() {
    _stream?.cancel();
    setState(() {
      _stream = null;
    });
  }

  void _toggleScan() {
    if (_stream == null) {
      _startScanning();
    } else {
      _stopScanning();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _stopScanning();
  }

  _launchURL(url) async {
    if (await canLaunch('https://' + url)) {
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
                                  ReadNFC;
                                } else {
                                  WriteNfc();
                                }
                                //  _records.length > 0 ? () => _write(context) : null;                              }
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

//  void ReadNfc() async {
//    NDEFMessage message = await NFC.readNDEF(once: true).first;
//    print("payload: ${message.payload}");
//    setState(() {
//      //  widget.result=message.payload;
//    });
//    _launchURL(message.payload);
//
//    print("yes");
//    Fluttertoast.showToast(
//        msg: "Read Successfully!", backgroundColor: Colors.green);
//  }

  void ReadNFC() {
    _toggleScan();
  }

  void WriteNfc() {
    _records.add(RecordEditor());
    _write;
//    FlutterNfcReader.write(" ", widget.name).then((response) {
//      print(response.content);
//      FlutterNfcReader.stop().then((response) {
//        print(response.status.toString());
//      });
//    });
  }

  void _write(BuildContext context) async {
    List<NDEFRecord> records = _records.map((record) {
      return NDEFRecord.type(
        record.mediaTypeController.text,
        record.payloadController.text,
      );
    }).toList();
    NDEFMessage message = NDEFMessage.withRecords(records);
    _asyncInputDialog(context, widget.title);

    // Show dialog on Android (iOS has it's own one)
    if (Platform.isAndroid) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Scan the tag you want to write to"),
          actions: <Widget>[
            FlatButton(
              child: const Text("Cancel"),
              onPressed: () {
                _hasClosedWriteDialog = true;
                _stream?.cancel();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    } else {
      new CupertinoAlertDialog(
        title: new Text("Dialog Title"),
        content: new Text("This is my content"),
        actions: <Widget>[
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text("Yes"),
          ),
          CupertinoDialogAction(
            child: Text("No"),
          )
        ],
      );
    }
    await NFC.writeNDEF(message).first;
    if (!_hasClosedWriteDialog) {
      Navigator.pop(context);
    }
  }
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
