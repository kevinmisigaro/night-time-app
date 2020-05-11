import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget recommendedList = ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                5,
                (index) => Card(
                  color: Colors.black,
                  child: Container(
                    width: 180.0,
                    height: 110.0,
                    child: Stack(
                      children: <Widget>[
                        Image.network(
                          'https://images.pexels.com/photos/1587927/pexels-photo-1587927.jpeg?cs=srgb&dl=group-of-people-1587927.jpg&fm=jpg',
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
            );
