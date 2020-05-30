import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlaceDetail extends StatelessWidget {
  final String name;
  final String location;
  final int alcoholPrice;

  PlaceDetail(this.name, this.location, this.alcoholPrice);

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
                tag: '${name}place',
                child: Image.asset(
                  'assets/images/party2.jpg',
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
              name,
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
              'Location: $location',
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
              'Entrance:  10,000 TZS',
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
                  style:TextStyle(
                    fontFamily: 'PierSans',
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                  children: [
                    TextSpan(
                      text: '$alcoholPrice',
                      style: GoogleFonts.roboto(
                        color: Colors.yellowAccent,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
