import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

//widgets
import 'package:night_life/widgets/home_section/places.dart';
import '../widgets/home_section/recommended.dart';
import '../widgets/home_section/favorite_spots.dart';
import '../widgets/home_section/events.dart';
import '../screens/events_view.dart';

class HomePage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>{
  final newDt = DateFormat.MMMEd().format(DateTime.now());

  final morningHour = DateFormat.Hm().parse('06:00');
  final noonHour = DateFormat.Hm().parse('12:00');
  final eveningHour = DateFormat.Hm('en_US').parse('17:00');

  final double _standardHeight = 30;

  @override
  Widget build(BuildContext context) {
    final currentHour = DateFormat.Hm().format(DateTime.now());

    return ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 0),
          ),

          Text(
            '$newDt',
            style: GoogleFonts.roboto(
                color: Colors.grey,
                fontSize: 17,
                fontWeight: FontWeight.w500,
            ),
          ),

          SizedBox(height: 10,),

          Text(
              'Ready to go out tonight?',
              style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w700
                  ),
            ),


          SizedBox(height: _standardHeight,),

          Text(
            'Recommended',
            style: GoogleFonts.roboto(
                color: Colors.white, 
                fontSize: 23, 
                fontWeight: FontWeight.w700),
          ),

          SizedBox(height: 8,),

          Container(
            height: 130.0,
            child: Recommended()
          ),

          SizedBox(height: _standardHeight,),

           Text(
                'Your Favorite Spots',
                style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.w700),
              ),

          Container(
            height: 130.0,
            child: favSpots
          ),

          SizedBox(height: _standardHeight,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Upcoming Events',
                style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.w700),
              ),
              OutlineButton(
                  child: new Text("See More"),
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_)=> EventsView()));
                  },
                  borderSide: BorderSide(color: Colors.blueAccent, width: 1.0, style: BorderStyle.solid),
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0),)
              )
            ],
          ),

          Container(
            height: 130.0,
            child: eventsList
          ),

          SizedBox(height: _standardHeight,),

          Text(
                'Places',
                style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.w700),
              ),

          Container(
            height: 130,
            child: placesList
          ),
        ],
      );

  }
}