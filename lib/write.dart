import 'package:flutter/material.dart';
import 'package:nomi/read.dart';

import 'CRUD.dart';
import 'DemoLocalizations.dart';

class Write extends StatefulWidget {
  @override
  _WriteState createState() => _WriteState();
}

class _WriteState extends State<Write> {
  double height = 80;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if (MediaQuery.of(context).size.width < 400) {
      setState(() {
        height = 60;
      });
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
              "Nomi Tap",
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
                CRUD.refresh();
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
      body: Stack(children: <Widget>[
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
                    padding: EdgeInsets.only(bottom: 25, top: 25),
                    physics: BouncingScrollPhysics(),
                    children: <Widget>[
                      Center(
                        child: Wrap(
                          runSpacing: 15.0,
                          spacing: 2,
                          direction: Axis.horizontal,
                          children: <Widget>[
                            _socialIcons("assets/images/whatsapp.png",
                                "Whatsapp", CRUD.whatsapp, height),
                            _socialIcons("assets/images/snapchat.png",
                                "Snapchat", CRUD.snapchat, height),
                            _socialIcons("assets/images/soundcloud.png",
                                "Soundcloud", CRUD.soundcloud, height),
                            _socialIcons("assets/images/tiktok.png", "Tiktok",
                                CRUD.tiktok, height),
                            _socialIcons("assets/images/twitter.png", "Twitter",
                                CRUD.twitter, height),
                            _socialIcons("assets/images/youtube.png", "Youtube",
                                CRUD.youtube, height),
                            _socialIcons("assets/images/instagram.png",
                                "Instagram", CRUD.instagram, height),
                            _socialIcons("assets/images/linkedin.png",
                                "Linkedin", CRUD.linkendin, height),
                            _socialIcons("assets/images/facebook.png",
                                "Facebook", CRUD.facebook, height),
                            _socialIcons("assets/images/tap.png", "Contact Tap",
                                "", height),
                            _socialIcons("assets/images/cashapp.png", "Cashapp",
                                CRUD.cashapp, height),
                            _socialIcons("assets/images/browser.png", "Browser",
                                "", height),
                            _socialIcons("assets/images/music.png", "Music",
                                CRUD.music, height),
                            _socialIcons("assets/images/paypal.png", "Paypal",
                                CRUD.paypal, height),
                            _socialIcons("assets/images/twitch.png", "Twitch",
                                "", height),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

class _socialIcons extends StatelessWidget {
  String imgPath;
  String name;
  String path;
  double Hight;
  _socialIcons(this.imgPath, this.name, this.path, this.Hight);
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Read("Write", path, name)),
                    );
                  },
                  child: Image.asset(
                    imgPath,
                    height: Hight,
                  )),
              Text(
                name,
                style: TextStyle(color: Colors.blue),
              )
            ],
          ),
        ),
      ],
    );
  }
}
