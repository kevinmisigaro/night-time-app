import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlaceDetail extends StatefulWidget {

  final String clubName;
  final String clubLocation;
  final int clubAlcoholPrice;

  PlaceDetail({
    this.clubName,
    this.clubLocation,
    this.clubAlcoholPrice
});


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PlaceDetailState();
  }
}

class PlaceDetailState extends State<PlaceDetail> {
  bool _isFavorite = false;


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
              'assets/images/party1.jpg',
              width: double.infinity,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '${widget.clubName}',
              style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Location:  ${widget.clubLocation}',
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
              'Entrance:  10,000 TZS',
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
                      text: '${
                      widget.clubAlcoholPrice}',
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
            IconButton(
                color: Colors.yellowAccent,
                iconSize: 40,
                icon: Icon(
                    (_isFavorite) ? Icons.favorite : Icons.favorite_border),
                onPressed: () {
                  setState(() {
                    _isFavorite = !_isFavorite;
                  });
                })
          ],
        ),
      ),
    );
  }
}
