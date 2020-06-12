import 'package:flutter/material.dart';
import 'package:night_life/models/user.dart';
import 'package:night_life/screens/place_detail_view.dart';
import 'package:night_life/services/database.dart';
import 'package:provider/provider.dart';

class FavoritesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final id = Provider.of<User>(context).uid;

    // TODO: implement build
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 0.0, bottom: 18.0),
            alignment: Alignment.topLeft,
            child: Text('Favorites',
                style: TextStyle(
                    fontFamily: 'MonumentExtended',
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w500)),
          ),
          Container(
            child: StreamBuilder(
                initialData: <UserClubFavorites>[],
                stream: DatabaseService(uid: id).clubFavorites,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Container(
                        child: Text(
                      'You have no favorites',
                      style: TextStyle(
                        fontFamily: 'PierSans',
                        color: Colors.blueGrey,
                        fontSize: 20,
                      ),
                    ));
                  } else {
                    if (snapshot.data.length == 0) {
                      return Container(
                          child: Text(
                        'You have no favorites',
                        style: TextStyle(
                          fontFamily: 'PierSans',
                          color: Colors.blueGrey,
                          fontSize: 20,
                        ),
                      ));
                    } else {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                          return Container(
                              child: Text(
                            'You have no favorites',
                            style: TextStyle(
                              fontFamily: 'PierSans',
                              color: Colors.blueGrey,
                              fontSize: 20,
                            ),
                          ));
                          break;
                        case ConnectionState.waiting:
                          return Container(
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                          break;
                        case ConnectionState.active:
                          List<UserClubFavorites> data = snapshot.data;

                          return ListView.builder(
                              itemCount: data.length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                width: 1.0,
                                                color: Colors.grey[800]))),
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) => PlaceDetail(
                                                      id: data[index].clubId,
                                                      clubName:
                                                          data[index].name,
                                                      clubLocation:
                                                          data[index].location,
                                                      clubAlcoholPrice:
                                                          data[index]
                                                              .alcoholPrice,
                                                      userLiked:
                                                          data[index].likes,
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
                          break;
                        default:
                          return Container(
                              child: Text(
                            'You have no favorites',
                            style: TextStyle(
                              fontFamily: 'PierSans',
                              color: Colors.blueGrey,
                              fontSize: 20,
                            ),
                          ));
                          break;
                      }
                    }
                  }
                }),
          )
        ],
      ),
    );
  }
}
