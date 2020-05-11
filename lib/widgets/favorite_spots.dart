import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget favSpots = ListView(
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
                        Image.asset(
                          'assets/images/party2.jpg',
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          top: 80,
                          left: 10,
                          child: Text(
                            'Kidimbwi',
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