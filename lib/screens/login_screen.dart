import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:night_life/services/authentication_service.dart';

class LoginView extends StatefulWidget {

  final Function toggleView;

  LoginView(this.toggleView);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginViewState();
  }
}

class LoginViewState extends State<LoginView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _loginFormKey = GlobalKey<FormState>();

  final AuthenticationService _auth = AuthenticationService();

  String error = '';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _loginFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Login',
                  style: TextStyle(
                      fontFamily: 'MonumentExtended',
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.grey[100],
                    filled: true,
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 7.0),
                    hintText: 'Email',
                  ),
                  controller: emailController,
                  validator: (val) => val.isEmpty ? 'Enter a valid email' : null,
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    fillColor: Colors.grey[100],
                    filled: true,
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 7.0),
                    hintText: 'Password',
                  ),
                  controller: passwordController,
                  validator: (val) => val.length < 6
                      ? 'Enter a password 6+ characters long'
                      : null,
                ),
                SizedBox(
                  height: 40,
                ),
                MaterialButton(
                  onPressed: () async {
                    if (_loginFormKey.currentState.validate()) {
                      dynamic result = await _auth.loginWithEmail(email: emailController.text, password: passwordController.text);
                      if(result == null){
                        setState(() {
                          error = 'Could not login in with these credentials';
                        });
                      }
                    }
                  },
                  padding: EdgeInsets.symmetric(vertical: 13, horizontal: 30),
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text('Login'),
                ),

                SizedBox(height: 5,),

                Text(error, style: TextStyle(color: Colors.red, fontSize: 15.0),),

                SizedBox(height: 10,),

                FlatButton(
                  onPressed: () {
                    widget.toggleView();
                  },
                  child: RichText(
                    text: TextSpan(
                        text: 'Don\'t have and account? ',
                        style: TextStyle(color: Colors.grey),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Click here to Sign Up!',
                              style: TextStyle(color: Colors.lightBlueAccent)),
                        ]),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
