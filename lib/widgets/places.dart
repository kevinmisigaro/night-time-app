import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget placesList = GridView.count(
              crossAxisCount: 2,
              children: List.generate(4, (index) {
                return Card(
                  color: Colors.black,
                  child: Container(
                    width: 50.0,
                    child: Stack(
                      children: <Widget>[
                        Image.network(
                          'https://images.pexels.com/photos/1449795/pexels-photo-1449795.jpeg?cs=srgb&dl=group-of-people-partying-1449795.jpg&fm=jpg',
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          top: 120,
                          left: 10,
                          child: Text(
                            'Kidimbwi',
                            style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
            );