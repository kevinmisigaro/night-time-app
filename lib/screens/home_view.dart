import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:night_life/screens/places_view.dart';
import 'package:night_life/widgets/bottonNavigation.dart';

//widgets
import 'package:night_life/widgets/places.dart';
import '../widgets/recommended.dart';
import '../widgets/favorite_spots.dart';
import '../widgets/events.dart';

class HomePage extends StatefulWidget{
//
//  int currentPageIndex;
//
//  HomePage({this.currentPageIndex});

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

  final double _standardHeight = 35;

  @override
  Widget build(BuildContext context) {
    final currentHour = DateFormat.Hm().format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Night Life',
          style: GoogleFonts.roboto(
              color: Colors.white, 
              fontSize: 19, 
              fontWeight: FontWeight.w600
              ),
        ),
      ),
      backgroundColor: Colors.black,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
          ),

          Center(
            child: Text(
              'Ready to go out tonight?',
              style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.w700
                  ),
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

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Your Spots',
                style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.w700),
              ),
              OutlineButton(
                  child: new Text("See More"),
                  textColor: Colors.white,
                  onPressed: () {},
                  borderSide: BorderSide(color: Colors.blueAccent, 
                  width: 1.0, 
                  style: BorderStyle.solid),
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0),)
              )

            ],
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
                'Events',
                style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.w700),
              ),
              OutlineButton(
                  child: new Text("See More"),
                  textColor: Colors.white,
                  onPressed: () {},
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

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Places',
                style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.w700),
              ),
              OutlineButton(
                  child: new Text("See More"),
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => PlacesView()));
                  },
                  borderSide: BorderSide(color: Colors.blueAccent, width: 1.0, style: BorderStyle.solid),
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0),)
              )
            ],
          ),

          Container(
            height: 350,
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: placesList
          ),
        ],
      ),
      bottomNavigationBar: BottomNav(0)
    );
  }
}