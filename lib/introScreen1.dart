import 'package:flutter/material.dart';

import 'CRUD.dart';
import 'CRUD.dart';
import 'DemoLocalizations.dart';

class intro1 extends StatefulWidget {
  @override
  _intro1State createState() => _intro1State();
}

class _intro1State extends State<intro1> {
  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width < 400) {
      setState(() {
        CRUD.headingFont = 22;
      });
    }

    return Scaffold(
      backgroundColor: Color(0xff0087E3),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            children: <Widget>[
              Text(
                AppLocalizations.of(context).translate('intro1Heading'),
                style: TextStyle(
                    fontSize: CRUD.headingFont,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Image.asset(
                "assets/images/person_icon.png",
                height: 150,
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  AppLocalizations.of(context).translate('intro1Text'),
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
