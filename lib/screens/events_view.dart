import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:night_life/models/event.dart';
import 'package:night_life/screens/event_detail_view.dart';
import 'package:night_life/services/database.dart';
import 'package:provider/provider.dart';

class EventsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final events = Provider.of<List<Event>>(context);

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
                                              )));
                                },
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        events[index].eventName,
                                        style: GoogleFonts.roboto(
                                          color: Colors.yellowAccent,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        events[index].date,
                                        style: GoogleFonts.roboto(
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
