import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EventsDetail extends StatelessWidget{
  final String eventName;
  final String date;
  final int alcoholPrice;
  final String entrance;


  EventsDetail({this.eventName, this.entrance, this.date, this.alcoholPrice});


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
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 25,
              ),
            ),

            SizedBox(
              height: 50,
            ),
            Text(
              'Date: $date',
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Entrance:  $entrance TZS',
              style: GoogleFonts.roboto(
                color: Colors.white,
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
                  style: GoogleFonts.roboto(
                    color: Colors.white,
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