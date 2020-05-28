import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:night_life/models/event.dart';
import 'package:night_life/services/database.dart';
import 'package:night_life/widgets/heros/events_detail.dart';

class Events extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StreamBuilder<List<Event>>(
      stream: DatabaseService().events,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {

          List<Event> data = snapshot.data;

          return ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              data.length,
                  (index) => GestureDetector(
                child: Hero(
                  tag: '${data[index].eventName}event',
                  child: Card(
                    color: Colors.black,
                    child: Container(
                      width: 180.0,
                      height: 110.0,
                      child: Stack(
                        children: <Widget>[
                          Image.asset(
                            'assets/images/party1.jpg',
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            top: 80,
                            left: 10,
                            child: Text(
                              data[index].eventName,
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
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => EventsDetail(
                            eventName: data[index].eventName,
                            entrance: data[index].entranceFee,
                            alcoholPrice: data[index].alcoholPrice,
                             date: data[index].date,
                          )));
                },
              ),
            ),
          );
        }
      },
    );
  }
}