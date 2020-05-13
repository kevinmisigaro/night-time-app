import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:night_life/widgets/heros/club_detail.dart';

class Recommended extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      scrollDirection: Axis.horizontal,
      children: List.generate(
        5,
            (index) => GestureDetector(
          child: Hero(
            tag: '$index',
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
                        'Maison',
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
            Navigator.push(context, MaterialPageRoute(
              builder: (_) => RecommendDetail(index)
            ));
          },
        ),
      ),
    );
  }
}
