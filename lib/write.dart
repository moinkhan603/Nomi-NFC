import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:nomi/customDrawer.dart';
import 'package:nomi/read.dart';
import 'package:nomi/welcome.dart';
import 'CRUD.dart';
import 'DemoLocalizations.dart';

class Write extends StatefulWidget {
  @override
  _WriteState createState() => _WriteState();
}

class _WriteState extends State<Write> {
  GlobalKey<ScaffoldState> key2 = GlobalKey<ScaffoldState>();
  double height = 120;
  bool showSpinner = false;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if (MediaQuery.of(context).size.width < 400) {
      setState(() {
        height = 85;
      });
    }
  }




  @override
  void initState() {
    //CRUD.getData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<bool>(
        future:  CRUD.getData(),
    builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
    if (snapshot.connectionState == ConnectionState.done) {
     print("xxx");

      return Scaffold(

        key: key2,
        drawer: CustomDrawer.buildDrawer(context),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(65.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            leading: Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: IconButton(
                onPressed: () {
                  key2.currentState.openDrawer();
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
                "Write Nomi",
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

                              Visibility(
                                  visible: CRUD.whatsapp.contains("add your link")==true
                                      || CRUD.whatsapp=="www.whatsapp.com/"?false:true,
                                  child: _socialIcons(
                                      "assets/images/whatsapp.png",
                                      "Whatsapp",
                                      CRUD.whatsapp,
                                      height)),
                              Visibility(
                                  visible: CRUD.snapchat.contains("add your link")==true
                                      || CRUD.snapchat=="www.snapchat.com/"?false:true,
                                  child: _socialIcons(
                                      "assets/images/snapchat.png",
                                      "Snapchat",
                                      CRUD.snapchat,
                                      height)),
                              Visibility(
                                  visible: CRUD.soundcloud.contains("add your link")==true
                                      || CRUD.soundcloud=="www.soundcloud.com/"?false:true,
                                  child: _socialIcons(
                                      "assets/images/soundcloud.png",
                                      "Soundcloud",
                                      CRUD.soundcloud,
                                      height)),
                              Visibility(
                                  visible: CRUD.tiktok.contains("add your link")==true
                                      || CRUD.tiktok=="www.tiktok.com/"?false:true,
                                  child: _socialIcons("assets/images/tiktok.png",
                                      "Tiktok", CRUD.tiktok, height)),
                              Visibility(
                                  visible: CRUD.twitter.contains("add your link")==true
                                      || CRUD.twitter=="www.twitter.com/"?false:true,
                                  child: _socialIcons("assets/images/twitter.png",
                                      "Twitter", CRUD.twitter, height)),
                              Visibility(
                                  visible: CRUD.youtube.contains("add your link")==true
                                      || CRUD.youtube=="www.youtube.com/"?false:true,
                                  child: _socialIcons("assets/images/youtube.png",
                                      "Youtube", CRUD.youtube, height)),
                              Visibility(
                                  visible: CRUD.instagram.contains("add your link")==true
                                      || CRUD.instagram=="www.instagram.com/"?false:true,
                                  child: _socialIcons(
                                      "assets/images/instagram.png",
                                      "Instagram",
                                      CRUD.instagram,
                                      height)),
                              Visibility(
                                  visible: CRUD.linkendin.contains("add your link")==true
                                      || CRUD.linkendin=="www.linekedin.com/"?false:true,
                                  child: _socialIcons(
                                      "assets/images/linkedin.png",
                                      "Linkedin",
                                      CRUD.linkendin,
                                      height)),
                              Visibility(
                                  visible: CRUD.facebook.contains("add your link")==true
                                      || CRUD.facebook=="www.facebook.com/"?false:true,
                                  child: _socialIcons(
                                      "assets/images/facebook.png",
                                      "Facebook",
                                      CRUD.facebook,
                                      height)),
                              Visibility(
                                  visible: false,
                                  child: _socialIcons("assets/images/tap.png",
                                      "Contact Tap", "", height)),
                              Visibility(
                                  visible: CRUD.cashapp.contains("add your link")==true
                                      || CRUD.cashapp=="www.cashapp.com/"?false:true,
                                  child: _socialIcons("assets/images/cashapp.png",
                                      "Cashapp", CRUD.cashapp, height)),
                              Visibility(
                                  visible: false,
                                  child: _socialIcons("assets/images/browser.png",
                                      "Browser", "", height)),
                              Visibility(
                                  visible: CRUD.music.contains("add your link")==true
                                      || CRUD.music=="www.music.com/"?false:true,
                                  child: _socialIcons("assets/images/music.png",
                                      "Music", CRUD.music, height)),
                              Visibility(
                                  visible: CRUD.paypal.contains("add your link")==true
                                      || CRUD.paypal=="www.paypal.com/"?false:true,
                                  child: _socialIcons("assets/images/paypal.png",
                                      "Paypal", CRUD.paypal, height)),
                              Visibility(
                                  visible: false,
                                  child: _socialIcons("assets/images/twitch.png",
                                      "Twitch", "", height)),
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
 else

  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Center(
        child: Container(

          height: 50,
          width: 50,
          margin: EdgeInsets.all(5),
          child: CircularProgressIndicator(
            strokeWidth: 2.0,
            valueColor : AlwaysStoppedAnimation(Colors.black),
          ),
        ),
      ),
    ],
  );
        }
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
          padding: const EdgeInsets.symmetric(horizontal: 15),
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
