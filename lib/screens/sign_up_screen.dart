import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:night_life/services/authentication_service.dart';

class SignUpView extends StatefulWidget {
  final Function toggleView;

  SignUpView(this.toggleView);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SignUpViewState();
  }
}

class SignUpViewState extends State<SignUpView> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final userNameController = TextEditingController();
  final ageController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _registerFormKey = GlobalKey<FormState>();

  final AuthenticationService _auth = AuthenticationService();

  String error = '';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _registerFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Sign Up',
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      fillColor: Colors.grey[100],
                      filled: true,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 7.0),
                      hintText: 'First Name',
                    ),
                    controller: firstNameController,
                    validator: (val) => val.isEmpty ? 'Enter a first name' : null,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      fillColor: Colors.grey[100],
                      filled: true,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 7.0),
                      hintText: 'Last Name',
                    ),
                    controller: lastNameController,
                    validator: (val) => val.isEmpty ? 'Enter a last name' : null,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      fillColor: Colors.grey[100],
                      filled: true,
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 7.0),
                      hintText: 'Username',
                    ),
                    controller: userNameController,
                    validator: (val) => val.isEmpty ? 'Enter a preffered username' : null,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      fillColor: Colors.grey[100],
                      filled: true,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 7.0),
                      hintText: 'Age',
                    ),
                    controller: ageController,
                    validator: (val) => val.isEmpty ? 'Enter an age' : null,
                  ),
                  SizedBox(
                    height: 30,
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
                    validator: (val) => val.isEmpty ? 'Enter an email' : null,
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
                      if (_registerFormKey.currentState.validate()) {
                        dynamic result = await _auth.signUpWithEmail(
                            email: emailController.text,
                            password: passwordController.text,
                            firstName: firstNameController.text,
                            lastName: lastNameController.text,
                            userName: userNameController.text,
                            age: ageController.text
                        );
                        if (result == null) {
                          setState(() {
                            error = 'Please apply the valid email';
                          });
                        }
                      }
                    },
                    padding: EdgeInsets.symmetric(vertical: 13, horizontal: 30),
                    textColor: Colors.white,
                    color: Colors.blue,
                    child: Text('Register'),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 15.0),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FlatButton(
                    onPressed: () {
                      print('is pressed');
                      widget.toggleView();
                    },
                    child: Text(
                      'Have an account? Login',
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
