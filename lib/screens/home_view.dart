import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:night_life/models/user.dart';
import 'package:night_life/services/database.dart';

//widgets
import 'package:night_life/widgets/home_section/places.dart';
import 'package:provider/provider.dart';
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

  final double _standardHeight = 30;

  @override
  Widget build(BuildContext context) {

    final id = Provider.of<User>(context).uid;

    return ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 0),
          ),

          Text(
            '$newDt',
            style: TextStyle(
              fontFamily: 'PierSans',
                color: Colors.grey,
                fontSize: 17,
                fontWeight: FontWeight.w500,
            ),
          ),

          SizedBox(height: 10,),

          StreamBuilder(
              stream: DatabaseService(uid: id).userProfile,
              builder: (context, snapshot) {
                if(!snapshot.hasData) {
                  return Container();
                } else{
                  var document = snapshot.data['user_name'];

                  return Text(
                    'Going out ${document[0].toUpperCase()}${document.substring(1)}?',
                    style: TextStyle(
                      fontFamily: 'PierSans',
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600
                    ),
                  );
                }
              }
          ),

          SizedBox(height: _standardHeight,),

          Text(
            'Tonight\'s recommendations',
            style: TextStyle(
              fontFamily: 'PierSans',
                color: Colors.grey[600],
                fontSize: 21,
                fontWeight: FontWeight.w700),
          ),

          SizedBox(height: 8,),

          Container(
            height: 130.0,
            child: Recommended()
          ),

          SizedBox(height: _standardHeight,),

//           Text(
//                'Your Favorite Spots',
//                style: GoogleFonts.roboto(
//                    color: Colors.white,
//                    fontSize: 23,
//                    fontWeight: FontWeight.w700),
//              ),
//
//          Container(
//            height: 130.0,
//            child: Favorites()
//          ),
//
//          SizedBox(height: _standardHeight,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Upcoming Events',
                style: TextStyle(
                  fontFamily: 'PierSans',
                    color: Colors.grey[600],
                    fontSize: 21,
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
            child: Events()
          ),

          SizedBox(height: _standardHeight,),

          Text(
                'Places',
            style: TextStyle(
                fontFamily: 'PierSans',
                color: Colors.grey[600],
                fontSize: 21,
                fontWeight: FontWeight.w700),
              ),

          Container(
            height: 130,
            child: Places()
          ),
        ],
      );

  }
}