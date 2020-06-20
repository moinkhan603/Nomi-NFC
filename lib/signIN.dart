import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:nomi/welcome.dart';
import 'CRUD.dart';
import 'DemoLocalizations.dart';
import 'signUP.dart';
class signIn extends StatefulWidget {
  @override
  _signInState createState() => _signInState();
}

class _signInState extends State<signIn> {

  bool showSpinner=false;
  String email;
  String password;
  final _auth=FirebaseAuth.instance;
@override
  void dispose() {
    // TODO: implement dispose
  CRUD.getData();
  super.dispose();

  }
  @override
  Widget build(BuildContext context) {

    final nameholder = TextEditingController();
    final nameholder1 = TextEditingController();

    clearTextInput(){

      nameholder.clear();
      nameholder1.clear();

    }

    return Scaffold(
        body:ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: new Stack(
            children: <Widget>[
              new Container(

                decoration: new BoxDecoration(

                  image: new DecorationImage(image: new AssetImage("assets/images/signup_bg.png"), fit: BoxFit.fill,),
                ),
              ),


              Positioned.fill(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 200),
                    child:  SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[


                          Padding(
                            padding: const EdgeInsets.only(left:58.0),
                            child: Text(AppLocalizations.of(context).translate('helo'),

                              style: TextStyle(fontSize: 25,color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:58.0),
                            child: Text(AppLocalizations.of(context).translate('wlcmbk')
    ,style: TextStyle(fontSize: 29,color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal:30.0),
                            child: Text.rich(
                              TextSpan(
                                text: AppLocalizations.of(context).translate('signintxt'),
                                style: TextStyle(fontSize: 20,color: Colors.white),
                                children: <TextSpan>[

                                  TextSpan(
recognizer: new TapGestureRecognizer()..onTap=(){

  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => signUp()),
  );
}
                                      ,
                                      text: AppLocalizations.of(context).translate('signup'),
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,

                                      )),
                                  // can add more TextSpans here...
                                ],
                              ),
                            )
                          ),


                          SizedBox(height: 20,),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            child: Material(
                              elevation: 4.0,
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              child: TextField(
                                controller: nameholder,
                                onChanged: (String value){
                                  email=value.trim();

                                },
                                cursorColor: Colors.blue,
                                decoration: InputDecoration(
                                    hintText: AppLocalizations.of(context).translate('email'),
                                    hintStyle: TextStyle(fontWeight: FontWeight.bold
                                        ,color: Color(0xff0087E3)
                                    ),
                                    border: InputBorder.none,
                                    contentPadding:
                                    EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
                              ),
                            ),
                          ),

                          SizedBox(height: 10,),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            child: Material(
                              elevation: 4.0,
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              child: TextField(
controller: nameholder1,
                                obscureText: true,
                                onChanged: (String value){

                                  password=value.trim();
                                },
                                cursorColor: Colors.blue,
                                decoration: InputDecoration(
                                    hintText: AppLocalizations.of(context).translate('pass'),
                                    hintStyle: TextStyle(fontWeight: FontWeight.bold
                                        ,color: Color(0xff0087E3)
                                    ),
                                    border: InputBorder.none,
                                    contentPadding:
                                    EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
                              ),
                            ),
                          ),


                          SizedBox(
                            height: 16,
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 50),
                              child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(100)),
                                      color: Color(0xff1E90FF)),
                                  child: FlatButton(

                                      child: Text(
                                        AppLocalizations.of(context).translate('signin'),
                                        style: TextStyle(
                                            color: Colors.white,

                                            fontSize: 22),
                                      ),
                                      onPressed: () async
                                      {

clearTextInput();
                                        if(email!=null&&password!=null)
                                        {
                                          setState(() {
                                            showSpinner=true;
                                          });

                                          try {
                                            final newuser = await _auth
                                                .signInWithEmailAndPassword(
                                                email: email, password: password);

                                            if (newuser != null) {

                                              CRUD.email=email;
                                              CRUD.password=password;
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => Welcome()),
                                              );
                                            }
                                            setState(() {
                                              showSpinner = false;
                                            });
                                          }
                                          catch(e){
                                            print(e);
                                            setState(() {
                                              showSpinner = false;
                                            });
                                          }

                                        }







                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => Welcome()),
                                        );

                                      }


                                  ))),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 50),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Text(AppLocalizations.of(context).translate('frgtpas'),
                                style: TextStyle(fontSize: 20,color: Colors.white,

                              ),),
                            ),
                          ),


                        ],),
                    ),
                  ),
                ),

              )

            ],
          ),
        ));
  }
}
