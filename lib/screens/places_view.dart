import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:night_life/models/club.dart';
import 'package:night_life/screens/place_detail_view.dart';
import 'package:night_life/services/database.dart';
import 'package:provider/provider.dart';

class PlacesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final clubs = Provider.of<List<Club>>(context);

    // TODO: implement build
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: <Widget>[
          StreamBuilder(
            stream: DatabaseService().clubs,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                List<Club> data = snapshot.data;

                return ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(border: Border(
                          bottom: BorderSide(width: 1.0, color: Colors.grey[800])
                        )),
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => PlaceDetail(
                                            id: data[index].id,
                                            clubName: data[index].name,
                                            clubLocation: clubs[index].location,
                                            clubAlcoholPrice:
                                                clubs[index].alcoholPrice,
                                            userLiked: clubs[index].likes,
                                          )));
                            },
                            child: Text(
                              clubs[index].name,
                              style: GoogleFonts.roboto(
                                color: Colors.blueGrey,
                                fontSize: 20,
                              ),
                            ),
                          ));
                    });
              }
            },
          )
        ],
      ),
    );
  }
}

