import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:night_life/screens/place_detail_view.dart';

class ProfileView extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20,),
        child: Column(
          children: <Widget>[

//            Align(
//              alignment: Alignment.topLeft,
//              child: Text(
//                'Your Profile',
//                style: GoogleFonts.roboto(
//                    fontSize: 30,
//                    fontWeight: FontWeight.w600,
//                    color: Colors.white
//                ),
//              ),
//            ),
//
            SizedBox(height: 70,),

            Text(
              'Name: Kevin Misigaro',
              style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.w600),
            ),

            SizedBox(height: 20,),

            Text(
              'Age: 26',
              style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.w600),
            ),

            SizedBox(height: 20,),

            Center(
              child: OutlineButton(
                    child: new Text(
                      "Logout",
                      style: TextStyle(fontSize: 25),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 7, horizontal: 25),
                    textColor: Colors.white,
                    onPressed: () {},
                    borderSide: BorderSide(
                        color: Colors.blueAccent,
                        width: 1.0,
                        style: BorderStyle.solid),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ))
            )

          ],
        ),
      );
  }
}