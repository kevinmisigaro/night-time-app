import 'package:flutter/material.dart';
import 'package:night_life/models/event.dart';
import 'package:night_life/services/database.dart';
import 'package:night_life/widgets/heros/events_detail.dart';

class Events extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return StreamBuilder<List<Event>>(
      stream: DatabaseService().events,
      initialData: <Event>[],
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          List<Event> data = snapshot.data;

          if(snapshot.data.length == 0) {

            return Container(
              padding: EdgeInsets.only(left: 12, top: 30),
              child: Text(
                'There are no new events',
                style: TextStyle(fontFamily: 'PierSans',
                    color: Colors.white,
                    fontSize: 18,
                    ),
              ),
            );


          } else{
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
                            Image.network(data[index].img,
                                fit: BoxFit.cover,
                                color: Color.fromRGBO(255, 255, 255, 0.7),
                                colorBlendMode: BlendMode.modulate),
                            Positioned(
                              top: 80,
                              left: 10,
                              child: Text(
                                data[index].eventName,
                                style: TextStyle(
                                    fontFamily: 'PierSans',
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
                              data[index]
                            )));
                  },
                ),
              ),
            );
          }
        }
      },
    );
  }
}
