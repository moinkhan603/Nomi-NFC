import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:nomi/CRUD.dart';
import 'package:nomi/signIN.dart';
import 'package:nomi/welcome.dart';
import 'DemoLocalizations.dart';

class signUp extends StatefulWidget {
  @override
  _signUpState createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  bool showSpinner = false;
  String email;
  String password;
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("assets/images/signup_bg.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 250),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 58.0),
                        child: Text(
                          AppLocalizations.of(context).translate('wlcm'),
                          style: TextStyle(
                              fontSize: CRUD.headingFont,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 58.0),
                        child: Text(
                          AppLocalizations.of(context).translate('signup'),
                          style: TextStyle(
                              fontSize: 29,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        child: Material(
                          elevation: 4.0,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          child: TextField(
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                            onChanged: (String value) {
                              email = value.trim();
                            },
                            cursorColor: Colors.blue,
                            decoration: InputDecoration(
                                hintText: AppLocalizations.of(context)
                                    .translate('email'),
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff0087E3)),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 13)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        child: Material(
                          elevation: 4.0,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          child: TextField(
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                            obscureText: true,
                            onChanged: (String value) {
                              password = value.trim();
                            },
                            cursorColor: Colors.blue,
                            decoration: InputDecoration(
                                hintText: AppLocalizations.of(context)
                                    .translate('pass'),
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff0087E3)),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 13)),
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100)),
                                  color: Color(0xff1E90FF)),
                              child: FlatButton(
                                  child: Text(
                                    AppLocalizations.of(context)
                                        .translate('signup'),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22),
                                  ),
                                  onPressed: () async {
                                    if (email == null || password == null) {
                                      Fluttertoast.showToast(
                                        msg: "Fields cannot be empty",
                                        toastLength: Toast.LENGTH_LONG,
                                      );
                                      return;
                                    }
                                    if (email.contains("@") == false) {
                                      print(email.contains("@"));
                                      Fluttertoast.showToast(
                                        msg: "Email not valid",
                                        toastLength: Toast.LENGTH_LONG,
                                      );
                                      return;
                                    }

                                    if (email != null && password != null) {
                                      setState(() {
                                        showSpinner = true;
                                      });

                                      try {
                                        FirebaseUser newuser = (await _auth
                                                .createUserWithEmailAndPassword(
                                                    email: email,
                                                    password: password))
                                            .user;

                                        if (newuser != null) {
                                          try {
                                            await newuser
                                                .sendEmailVerification();
                                            Fluttertoast.showToast(
                                              msg: "Verification Email Sent.",
                                              toastLength: Toast.LENGTH_LONG,
                                            );
                                          } catch (e) {
                                            print(
                                                "An error occured while trying to send email  verification");
                                            print(e.message);
                                          }
                                          CRUD.email = email;
                                          CRUD.password = password;

                                          // sendVerificationMail(newuser);
                                          Fluttertoast.showToast(
                                            msg: "Successfully Signed Up",
                                            toastLength: Toast.LENGTH_LONG,
                                          );
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    signIn(1)),
                                          );
                                        }
                                        setState(() {
                                          showSpinner = false;
                                        });
                                      } catch (e) {
                                        print(e);

                                        Fluttertoast.showToast(
                                          msg:
                                              "This Email address is already in use",
                                          toastLength: Toast.LENGTH_LONG,
                                        );

                                        setState(() {
                                          showSpinner = false;
                                        });
                                      }
                                    }
                                  })))
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
