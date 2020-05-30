import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:night_life/models/club.dart';
import 'package:night_life/services/database.dart';
import 'package:night_life/widgets/heros/place_detail.dart';

class Places extends StatelessWidget{
 @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return StreamBuilder<List<Club>>(
     stream: DatabaseService().clubs,
     builder: (context, snapshot) {
       if (!snapshot.hasData) {
         return Center(
           child: CircularProgressIndicator(),
         );
       } else {

         List<Club> data = snapshot.data;

         return ListView(
           scrollDirection: Axis.horizontal,
           children: List.generate(
             data.take(4).length,
                 (index) => GestureDetector(
               child: Hero(
                 tag: '${data[index].name}place',
                 child: Card(
                   color: Colors.black,
                   child: Container(
                     width: 180.0,
                     height: 110.0,
                     child: Stack(
                       children: <Widget>[
                         Image.asset(
                           'assets/images/party3.jpg',
                           fit: BoxFit.cover,
                         ),
                         Positioned(
                           top: 80,
                           left: 10,
                           child: Text(
                             data[index].name,
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
                         builder: (_) => PlaceDetail(
                             data[index].name, data[index].location, data[index].alcoholPrice
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