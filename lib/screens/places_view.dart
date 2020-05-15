import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:night_life/screens/place_detail_view.dart';

class PlacesView extends StatelessWidget{

  final List<String> _partyPlaces = [
    'Kidimbiwi', 'Samaki Samaki', 'Havoc', 'Maison', 'Tipsy', 'Wingman','Juliana', 'Buckets', 'Level 8', 'George & Dragon', 'Golden Tulip','Elements'
  ];

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20,),
        child: Column(
          children: <Widget>[

//            Align(
//              alignment: Alignment.topLeft,
//              child: Text(
//                'Places',
//                style: GoogleFonts.roboto(
//                    fontSize: 30,
//                    fontWeight: FontWeight.w600,
//                    color: Colors.white
//                ),
//              ),
//            ),
//
//            SizedBox(height: 20,),

            ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: _partyPlaces.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => PlaceDetail()));
                      },
                      child: Text(_partyPlaces[index], style: GoogleFonts.roboto(color: Colors.yellowAccent, fontSize: 20,),),
                    )
                  );
                }
            )

          ],
        ),
      );
  }
}