import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:night_life/models/user.dart';
import 'package:night_life/services/authentication_service.dart';
import 'package:night_life/services/database.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthenticationService _auth = AuthenticationService();

    final id = Provider.of<User>(context).uid;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 70,
          ),
          StreamBuilder(
              stream: DatabaseService(uid: id).userProfile,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Container();
                } else {
                  var document = snapshot.data['user_name'];

                  return Text(
                    'Hey ${document[0].toUpperCase()}${document.substring(1)}',
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.w600),
                  );
                }
              }),
          SizedBox(
            height: 40,
          ),
          Center(
            child: Container(
              width: 300,
              child: Text(
                'Thanks for being part of the trial version of this app, this app'
                    ' was made with love and excitement. Would love any feedback you have via this mail: kunbata93@gmail.com.'
                ' Meanwhile, please enjoy the app!',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Center(
              child: OutlineButton(
                  child: new Text(
                    "Logout",
                    style: TextStyle(fontSize: 20),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 13, horizontal: 25),
                  textColor: Colors.white,
                  onPressed: () async {
                    await _auth.signOut();
                  },
                  borderSide: BorderSide(
                      color: Colors.blueAccent,
                      width: 1.0,
                      style: BorderStyle.solid),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  )))
        ],
      ),
    );
  }
}
