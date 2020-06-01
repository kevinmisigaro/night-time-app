import 'package:flutter/material.dart';
import 'package:night_life/models/event.dart';
import 'package:night_life/screens/event_detail_view.dart';
import 'package:night_life/services/database.dart';

class EventsView extends StatelessWidget {
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

            Container(
              padding: EdgeInsets.only(top: 0.0, bottom: 15.0),
              alignment: Alignment.topLeft,
              child: Text(
                  'Upcoming Events',
                  style: TextStyle(
                      fontFamily: 'MonumentExtended',
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w500
                  )
              ),
            ),

            SizedBox(
              height: 20,
            ),
            StreamBuilder<List<Event>>(
                stream: DatabaseService().events,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    List<Event> events = snapshot.data;

                    return ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        itemCount: events.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1.0, color: Colors.grey[800]))),
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => EventDetail(
                                                eventName:
                                                    events[index].eventName,
                                                theme: events[index].theme,
                                                entrance:
                                                    events[index].entranceFee,
                                                alcoholPrice:
                                                    events[index].alcoholPrice,
                                                xFactor: events[index].xFactor,
                                                location:
                                                    events[index].location,
                                              )));
                                },
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        events[index].eventName,
                                        style: TextStyle(
                                          fontFamily: 'PierSans',
                                          color: Colors.blueGrey,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        events[index].date,
                                        style: TextStyle(
                                          fontFamily: 'PierSans',
                                          color: Colors.grey,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ])),
                          );
                        });
                  }
                })
          ],
        ),
      ),
    );
  }
}
