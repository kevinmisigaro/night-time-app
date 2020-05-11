import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Night Life App',
          style: GoogleFonts.roboto(
              color: Colors.white, fontSize: 19, fontWeight: FontWeight.w600),
        ),
      ),
      backgroundColor: Colors.black,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 7),
          ),

          Center(
            child: Text(
              'Today May 11th',
              style: GoogleFonts.roboto(
                  color: Colors.white, fontSize: 23, fontWeight: FontWeight.w700),
            ),
          ),

          SizedBox(height: 28,),

          Text(
            'Recommended',
            style: GoogleFonts.roboto(
                color: Colors.white, fontSize: 23, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 8,),
          Container(
            height: 130.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                5,
                (index) => Card(
                  color: Colors.black,
                  child: Container(
                    width: 180.0,
                    height: 110.0,
                    child: Stack(
                      children: <Widget>[
                        Image.network(
                          'https://images.pexels.com/photos/1587927/pexels-photo-1587927.jpeg?cs=srgb&dl=group-of-people-1587927.jpg&fm=jpg',
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          top: 80,
                          left: 10,
                          child: Text(
                            'Maison',
                            style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 28,),

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
                  borderSide: BorderSide(color: Colors.blueAccent, width: 1.0, style: BorderStyle.solid),
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0),)
              )

            ],
          ),

          Container(
            height: 130.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                5,
                    (index) => Card(
                  color: Colors.black,
                  child: Container(
                    width: 180.0,
                    height: 110.0,
                    child: Stack(
                      children: <Widget>[
                        Image.network(
                          'https://images.pexels.com/photos/2240763/pexels-photo-2240763.jpeg?cs=srgb&dl=women-taking-photo-2240763.jpg&fm=jpg',
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          top: 80,
                          left: 10,
                          child: Text(
                            'Kidimbwi',
                            style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 28,),

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
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                5,
                    (index) => Card(
                  color: Colors.black,
                  child: Container(
                    width: 180.0,
                    height: 110.0,
                    child: Stack(
                      children: <Widget>[
                        Image.network(
                          'https://images.pexels.com/photos/952422/pexels-photo-952422.jpeg?cs=srgb&dl=silhouette-photo-of-people-in-front-of-stage-952422.jpg&fm=jpg',
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          top: 80,
                          left: 10,
                          child: Text(
                            'Tipsy',
                            style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 28,),

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
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(4, (index) {
                return Card(
                  color: Colors.black,
                  child: Container(
                    width: 50.0,
                    child: Stack(
                      children: <Widget>[
                        Image.network(
                          'https://images.pexels.com/photos/1449795/pexels-photo-1449795.jpeg?cs=srgb&dl=group-of-people-partying-1449795.jpg&fm=jpg',
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          top: 120,
                          left: 10,
                          child: Text(
                            'Kidimbwi',
                            style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
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