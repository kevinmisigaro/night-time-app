import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:night_life/models/club.dart';

class RecommendDetail extends StatelessWidget {
  final Club club;

  RecommendDetail(this.club);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              child: Hero(
                tag: '${club.name}recommend',
                child: Image.network(
                  club.img,
                  width: double.infinity,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 20,
            ),

            Text(
              club.name,
              style: TextStyle(
                  fontFamily: 'PierSans',
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 23),
            ),

            SizedBox(
              height: 30,
            ),
            Text(
              'Location: ${club.location}',
              style: TextStyle(
                fontFamily: 'PierSans',
                color: Colors.blueGrey,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Type: ${club.type}',
              style: TextStyle(
                fontFamily: 'PierSans',
                color: Colors.blueGrey,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RichText(
              text: TextSpan(
                  text: 'Alcohol Price:  ',
                  style: TextStyle(
                    fontFamily: 'PierSans',
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                  children: [
                    TextSpan(
                      text: '${club.alcoholPrice}',
                      style: GoogleFonts.roboto(
                        color: Colors.yellowAccent,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    )
                  ]),
            ),
            SizedBox(
              height: 40,
            ),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.spaceAround,
//              children: <Widget>[
//                OutlineButton(
//                    child: new Text(
//                      "Its Lit !!!",
//                      style: TextStyle(fontSize: 18),
//                    ),
//                    textColor: Colors.white,
//                    onPressed: () {},
//                    padding: EdgeInsets.all(10),
//                    borderSide: BorderSide(
//                        color: Colors.blueAccent,
//                        width: 1.0,
//                        style: BorderStyle.solid),
//                    shape: new RoundedRectangleBorder(
//                      borderRadius: new BorderRadius.circular(30.0),
//                    )),
//                OutlineButton(
//                    child: new Text(
//                      "Its a Bummer",
//                      style: TextStyle(fontSize: 18),
//                    ),
//                    textColor: Colors.white,
//                    onPressed: () {},
//                    borderSide: BorderSide(
//                        color: Colors.blueAccent,
//                        width: 1.0,
//                        style: BorderStyle.solid),
//                    shape: new RoundedRectangleBorder(
//                      borderRadius: new BorderRadius.circular(30.0),
//                    ))
//              ],
//            )
          ],
        ),
      ),
    );
  }
}
