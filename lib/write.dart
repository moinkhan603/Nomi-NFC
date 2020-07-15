import 'package:flutter/material.dart';
import 'package:nomi/customDrawer.dart';
import 'package:nomi/read.dart';
import 'package:reorderables/reorderables.dart';
import 'CRUD.dart';
import 'DemoLocalizations.dart';

class Write extends StatefulWidget {
  @override
  _WriteState createState() => _WriteState();
}

class _WriteState extends State<Write> {
 // List<Widget> _tiles;
  GlobalKey<ScaffoldState> key2 = GlobalKey<ScaffoldState>();
  static double height = 120;
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
  List<Widget>    _tiles = <Widget>[
    _socialIcons("assets/images/whatsapp.png", "whatsapp", CRUD.whatsapp, height,"www.whatsapp.com"),
    _socialIcons("assets/images/snapchat.png", "snapchat", CRUD.snapchat, height,"www.snapchat.com"),
    _socialIcons("assets/images/soundcloud.png", "soundcloud", CRUD.soundcloud, height,"www.soundcloud.com"),
    _socialIcons("assets/images/linkedin.png", "linkedin", CRUD.linkendin, height,"www.linkedin.com"),
    _socialIcons("assets/images/youtube.png", "youtube", CRUD.youtube, height,"www.youtube.com"),
    _socialIcons("assets/images/facebook.png", "facebook", CRUD.facebook, height,"www.facebook.com"),
    _socialIcons("assets/images/instagram.png", "instagram", CRUD.instagram, height,"www.instagram.com"),
    _socialIcons("assets/images/cashapp.png", "Cashapp", CRUD.cashapp, height,"www.cashapp.com"),
    _socialIcons("assets/images/paypal.png", "paypal", CRUD.paypal, height,"www.paypal.com"),
    _socialIcons("assets/images/music.png", "music", CRUD.music, height,"www.music.com"),
    _socialIcons("assets/images/tiktok.png", "tiktok", CRUD.tiktok, height,"www.tiktok.com"),
    _socialIcons("assets/images/twitter.png", "twitter", CRUD.twitter, height,"www.twitter.com"),
  ];


  @override
  Widget build(BuildContext context) {


    void _onReorder(int oldIndex, int newIndex) {
//      setState(() {
//        Widget row = _tiles.removeAt(oldIndex);
//        _tiles.insert(newIndex, row);
//      });

      Widget row = _tiles.removeAt(oldIndex);
      _tiles.insert(newIndex, row);
    }




    return FutureBuilder<bool>(
        future: CRUD.getData(),
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
                        child: Text(
                            AppLocalizations.of(context).translate('logout'),
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
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
                        image: new AssetImage(
                            "assets/images/social_detail_bg.png"),
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
                                  child: ReorderableWrap(
                                      spacing: 1.0,
                                      runSpacing: 18.0,
                                      padding: const EdgeInsets.all(5),
                                      children: _tiles,
                                      onReorder: _onReorder,
                                      onNoReorder: (int index) {
                                        //this callback is optional
                                        debugPrint('${DateTime.now().toString().substring(5, 22)} reorder cancelled. index:$index');
                                      },
                                      onReorderStarted: (int index) {
                                        //this callback is optional
                                        debugPrint('${DateTime.now().toString().substring(5, 22)} reorder started: index:$index');
                                      }
                                  )

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
          } else
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
                      valueColor: AlwaysStoppedAnimation(Colors.black),
                    ),
                  ),
                ),
              ],
            );
        });
  }


}

class _socialIcons extends StatelessWidget {
  String imgPath;
  String name;
  String path;
  double Hight;
String website;
  _socialIcons(this.imgPath, this.name, this.path, this.Hight,this.website);

  @override
  Widget build(BuildContext context) {
    print(path);
    return Visibility(
      visible: path.contains("add your link") == true ||
          path == website
          ? false
          : true,
      child: Padding(
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
    );
  }
}
