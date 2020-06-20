import 'package:flutter/material.dart';
import 'package:nomi/CRUD.dart';
import 'package:qr_flutter/qr_flutter.dart';
class QRGenerator extends StatefulWidget {
  @override
  _QRGeneratorState createState() => _QRGeneratorState();
}

class _QRGeneratorState extends State<QRGenerator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: ListView(

          children: <Widget>[

          QrCode("www.whatsapp.com/"+CRUD.whatsapp,"assets/images/whatsapp.png"),
          QrCode("www.twitter.com/"+CRUD.twitter,"assets/images/twitter.png"),
          QrCode("www.snapchat.com/"+CRUD.snapchat,"assets/images/snapchat.png"),
          QrCode("www.youtube.com/"+CRUD.youtube,"assets/images/youtube.png"),
          QrCode("www.facebook.com/"+CRUD.facebook,"assets/images/facebook.png"),
          QrCode("www.instagram.com/"+CRUD.instagram,"assets/images/instagram.png"),
          QrCode("www.venmo.com/"+CRUD.venmo,"assets/images/venmo.png"),


        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Center(
            child: QrImage(

              foregroundColor: Colors.blue,
              data: CRUD.email ,
              version: QrVersions.auto,
              size: 300,
              gapless: false,
              embeddedImage: AssetImage(""),
              embeddedImageStyle: QrEmbeddedImageStyle(
                size: Size(80, 80),
                color: Colors.red
              ),
            ),
          ),
        )


        ],),
      ),
    );
  }
}

class QrCode extends StatelessWidget {
  String ImgPath;
  String path;

  QrCode(this.path,this.ImgPath);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: QrImage(
          data: this.path,
          version: QrVersions.auto,
          size: 300,
          gapless: false,
          embeddedImage: AssetImage(ImgPath),
          embeddedImageStyle: QrEmbeddedImageStyle(
            size: Size(80, 80),
          ),
        ),
      ),
    );
  }
}
