import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

//widgets
import 'package:night_life/widgets/places.dart';
import 'widgets/recommended.dart';
import 'widgets/favorite_spots.dart';
import 'widgets/events.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ));

class MyApp extends StatelessWidget {
  final newDt = DateFormat.MMMEd().format(DateTime.now());
  final double _standardHeight = 35;

  @override
  Widget build(BuildContext context) {
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
              'Ready to go out Kevin?',
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
                  onPressed: () {},
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
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem> [
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home', style: TextStyle(color: Colors.white),)),
            BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('Search',  style: TextStyle(color: Colors.white))),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_border), title: Text('Favorites',  style: TextStyle(color: Colors.white))),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline), title: Text('Profile',  style: TextStyle(color: Colors.white))),
          ]),
    );
  }
}

//          Container(
//            height: 350,
//            padding: EdgeInsets.symmetric(horizontal: 10.0),
//            child: GridView.count(
//              scrollDirection: Axis.vertical,
//              crossAxisCount: 2,
//              children: List.generate(4, (index) {
//                return Card(
//                  color: Colors.black,
//                  child: Container(
//                    width: 50.0,
//                    child: Stack(
//                      children: <Widget>[
//                        Image.network(
//                          'https://images.pexels.com/photos/1449795/pexels-photo-1449795.jpeg?cs=srgb&dl=group-of-people-partying-1449795.jpg&fm=jpg',
//                          fit: BoxFit.cover,
//                        ),
//                        Positioned(
//                          top: 120,
//                          left: 10,
//                          child: Text(
//                            'Kidimbwi',
//                            style: GoogleFonts.roboto(
//                                color: Colors.white,
//                                fontSize: 17,
//                                fontWeight: FontWeight.w500),
//                          ),
//                        )
//                      ],
//                    ),
//                  ),
//                );
//              }),
//            ),
//          ),