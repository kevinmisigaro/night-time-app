import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:night_life/models/club.dart';
import 'package:night_life/screens/place_detail_view.dart';
import 'package:provider/provider.dart';

class PlacesView extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    final clubs = Provider.of<List<Club>>(context);

    // TODO: implement build
    return SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20,),
        child: Column(
          children: <Widget>[

            ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: clubs.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => PlaceDetail(
                          clubName: clubs[index].name,
                          clubLocation: clubs[index].location,
                          clubAlcoholPrice: clubs[index].alcoholPrice,
                        )
                        ));
                      },
                      child: Text(clubs[index].name, style: GoogleFonts.roboto(color: Colors.yellowAccent, fontSize: 20,),),
                    )
                  );
                }
            )

          ],
        ),
      );
  }
}