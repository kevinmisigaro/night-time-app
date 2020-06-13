import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:night_life/models/club.dart';
import 'package:night_life/models/user.dart';
import 'package:night_life/services/database.dart';
import 'package:provider/provider.dart';

class PlaceDetail extends StatefulWidget {
  final Club club;

  PlaceDetail(this.club);

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

    (widget.club.likes.contains(user.uid)) ? isFav = isFav : isFav = !isFav;

    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          // automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.network(
                widget.club.img,
                width: double.infinity,
              ),
              SizedBox(
                height: 20,
              ),
              Text('${widget.club.name}',
                  style: TextStyle(
                      fontFamily: 'PierSans',
                      color: Colors.white,
                      fontSize: 23)),
              SizedBox(
                height: 20,
              ),
              Text(
                'Location:  ${widget.club.location}',
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
                'Type: ${widget.club.type}',
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
                        text: '${widget.club.alcoholPrice}',
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
                        .handleUserFavorites(widget.club.id);
                  }),
            ],
          ),
        ));
  }
}
