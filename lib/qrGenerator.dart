import 'package:flutter/material.dart';
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


          QrCode("assets/images/whatsapp.png"),
          QrCode("assets/images/twitter.png"),
          QrCode("assets/images/snapchat.png"),
          QrCode("assets/images/youtube.png"),
          QrCode("assets/images/facebook.png"),
          QrCode("assets/images/instagram.png"),
          QrCode("assets/images/venmo.png"),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Center(
            child: QrImage(

              foregroundColor: Colors.blue,
              data: 'lilikhjknjkhjli',
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
  QrCode(this.ImgPath);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: QrImage(
          data: 'You are myu fvvvv',
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
