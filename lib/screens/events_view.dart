import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:night_life/screens/event_detail_view.dart';

class EventsView extends StatelessWidget {
  final List<String> _partyFavorites = [
    'Mi Casa Su Casa',
    'Str8 Up Vibes Kidimbwi',
    'No Tie After 5'
  ];

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
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Upcoming Events',
                style: GoogleFonts.roboto(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: _partyFavorites.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => EventDetail()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:[
                          Text(
                            _partyFavorites[index],
                            style: GoogleFonts.roboto(
                              color: Colors.yellowAccent,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            '19th May',
                                style: GoogleFonts.roboto(
                                  color: Colors.grey,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                          )
                        ]
                      )
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}


// RichText(
//                         text: TextSpan(
//                             text: _partyFavorites[index],
//                             style: GoogleFonts.roboto(
//                               color: Colors.yellowAccent,
//                               fontSize: 20,
//                             ),
//                             children: [
//                               TextSpan(text: '         '),
//                               TextSpan(
//                                 text: '19th May',
//                                 style: GoogleFonts.roboto(
//                                   color: Colors.grey,
//                                   fontSize: 17,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               )
//                             ]),
//                       ),