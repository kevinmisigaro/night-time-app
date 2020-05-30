import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EventsDetail extends StatelessWidget{
  final String eventName;
  final String date;
  final int alcoholPrice;
  final String entrance;
  final String xFactor;
  final String location;


  EventsDetail({this.eventName, this.entrance, this.date, this.alcoholPrice, this.location, this.xFactor});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              child: Hero(
                tag: '${eventName}event',
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
              eventName,
              style: TextStyle(
                  fontFamily: 'PierSans',
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 23
              ),
            ),

            SizedBox(
              height: 30,
            ),
            Text(
              'Date: $date',
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
              'Special:  $xFactor',
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
              'Entrance:  $entrance TZS',
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