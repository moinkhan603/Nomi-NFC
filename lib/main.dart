import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'DemoLocalizations.dart';
import 'introScreen1.dart';
import 'introScreen2.dart';
import 'introScreen3.dart';
import 'signIN.dart';
import 'package:page_indicator/page_indicator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NomiTap',
      supportedLocales: [
        Locale('en', 'US'),
        Locale('es', ''),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  PageController _controller = PageController(
    initialPage: 0,
  );

  int indx = 0;
  var btnText = "Next";

  void onAddButtonTapped(int index) {
    if (indx == 1) {
      setState(() {
        btnText = "Done";
      });
    } else {
      btnText = "Next";
    }

    if (indx == 2) {
      setbool();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => signIn(2)),
      );
    }
    // use this to animate to the page
    // _controller.animateToPage(index);
    _controller.jumpToPage(index);

    // or this to jump to it without animating
    // pageController.jumpToPage(index);
  }

  check() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final myBool = prefs.getBool('flag')??false;
   return myBool;


  }


  @override
  void initState() {
    // TODO: implement initState

    if (check() == true) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => signIn(2)),
      );
    }


    super.initState();

    print("c");
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: check(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.data == true) {

          return signIn(2);
        }
        else
          return Scaffold(
            backgroundColor: Color(0xff0087E3),
            body: SafeArea(
              child: Stack(
                children: <Widget>[
                  PageIndicatorContainer(
                    length: 3,
                    indicatorSpace: 15.0,
                    padding: EdgeInsets.only(bottom: 30),
                    child: PageView(
                      physics: BouncingScrollPhysics(),
                      controller: _controller,
                      onPageChanged: (int x) {
                        print(x);
                        setState(() {
                          indx = x;
                          if (indx == 2) {
                            setState(() {
                              btnText = "Done";
                            });
                          } else {
                            setState(() {
                              btnText = "Next";
                            });
                          }
                        });
                      },
                      children: [
                        intro1(),
                        intro2(),
                        intro3(),
                      ],
                    ),
                  ),
                  Positioned.fill(
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          onTap: () {
                            onAddButtonTapped(indx + 1);
                          },
                          child: Text(
                            btnText,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // This trailing comma makes auto-formatting nicer for build methods.
          );
      },);



  }

  void setbool() async {
    print("hhh");
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool('flag', true);
  }



}
