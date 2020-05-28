import 'package:flutter/material.dart';
import 'package:night_life/main.dart';
import 'package:night_life/models/user.dart';
import 'package:night_life/screens/login_screen.dart';
import 'package:night_life/screens/sign_up_screen.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return WrapperState();
  }
}

class WrapperState extends State<Wrapper>{

  bool showSignIn = true;

  void toggleView(){
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final user = Provider.of<User>(context);

    //return either Home or Authenticate
    if(user == null){
      if(showSignIn){
        return LoginView(toggleView);
      } else {
        return SignUpView(toggleView);
      }
    } else {
      return Home();
    }
  }
}