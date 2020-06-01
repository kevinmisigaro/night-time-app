import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EventDetail extends StatefulWidget {
  final String eventName;
  final String entrance;
  final String theme;
  final int alcoholPrice;
  final String xFactor;
  final String location;

  EventDetail(
      {this.eventName,
      this.entrance,
      this.theme,
      this.alcoholPrice,
      this.xFactor,
      this.location});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return EventDetailState();
  }
}

class EventDetailState extends State<EventDetail> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        // automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.asset(
              'assets/images/party2.jpg',
              width: double.infinity,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              widget.eventName,
              style: TextStyle(
                  fontFamily: 'PierSans',
                  color: Colors.white,
                  fontSize: 23),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Location: ${widget.location}',
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
              'Entrance: ${(widget.entrance == 'none')? 'Free': '${widget.entrance} TZS'}' ,
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
              'Special:  ${widget.xFactor}',
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
              'Theme:  ${widget.theme}',
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
                      text: '${widget.alcoholPrice}',
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
