import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:night_life/models/user.dart';
import 'package:night_life/services/database.dart';
import 'package:provider/provider.dart';

class PlaceDetail extends StatefulWidget {
  final String id;
  final String clubName;
  final String clubLocation;
  final int clubAlcoholPrice;
  final List userLiked;
  final String type;

  PlaceDetail(
      {
        this.id,
      this.clubName,
      this.clubLocation,
      this.clubAlcoholPrice,
      this.userLiked,
        this.type
      });

  @override
  State<StatefulWidget> createState() {

    return PlaceDetailState();
  }
}

class PlaceDetailState extends State<PlaceDetail> {
  bool isFav = true;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    (widget.userLiked.contains(user.uid)) ? isFav = isFav : isFav = !isFav;

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
              Text('${widget.clubName}',
                  style: TextStyle(
                      fontFamily: 'PierSans',
                      color: Colors.white,
                      fontSize: 23)),
              SizedBox(
                height: 20,
              ),
              Text(
                'Location:  ${widget.clubLocation}',
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
                'Type: ${widget.type}',
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
                        text: '${widget.clubAlcoholPrice}',
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
                  icon: Icon(isFav ? Icons.favorite : Icons.favorite_border),
                  onPressed: () {
                    setState(() {
                      isFav = !isFav;
                    });
                    DatabaseService(uid: user.uid)
                        .handleUserFavorites(widget.id);
                  }),
            ],
          ),
        ));
  }
}
