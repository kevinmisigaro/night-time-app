import 'package:flutter/material.dart';
import 'package:night_life/models/club.dart';
import 'package:night_life/screens/place_detail_view.dart';
import 'package:night_life/services/database.dart';

class PlacesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: <Widget>[
          
          Container(
            padding: EdgeInsets.only(top: 0.0, bottom: 18.0),
            alignment: Alignment.topLeft,
            child: Text(
                'Places',
                style: TextStyle(
                    fontFamily: 'MonumentExtended',
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w500
                )
            ),
          ),
          
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
                                           data[index]
                                          )));
                            },
                            child: Text(
                              data[index].name,
                              style: TextStyle(
                                fontFamily: 'PierSans',
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

