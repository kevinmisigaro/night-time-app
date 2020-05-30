import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecommendDetail extends StatelessWidget {
  final String name;
  final String location;
  final int alcoholPrice;

  RecommendDetail(
      this.name, this.location, this.alcoholPrice
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              child: Hero(
                tag: '${name}recommend',
                child: Image.asset(
                  'assets/images/party2.jpg',
                  width: double.infinity,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 20,
            ),

             Text(
                name,
               style: TextStyle(
                   fontFamily: 'PierSans',
                   color: Colors.white,
                   fontWeight: FontWeight.w600,
                   fontSize: 23
               ),
              ),

            SizedBox(
              height: 30,
            ),
            Text(
              'Location: $location',
              style: TextStyle(
                fontFamily: 'PierSans',
                color: Colors.blueGrey,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Entrance:  10,000 TZS',
              style: TextStyle(
                fontFamily: 'PierSans',
                color: Colors.blueGrey,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RichText(
              text: TextSpan(
                  text: 'Alcohol Price:  ',
                  style:TextStyle(
                    fontFamily: 'PierSans',
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                  children: [
                    TextSpan(
                      text: '$alcoholPrice',
                      style: GoogleFonts.roboto(
                        color: Colors.yellowAccent,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    )
                  ]),
            ),
            SizedBox(
              height: 40,
            ),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.spaceAround,
//              children: <Widget>[
//                OutlineButton(
//                    child: new Text(
//                      "Its Lit !!!",
//                      style: TextStyle(fontSize: 18),
//                    ),
//                    textColor: Colors.white,
//                    onPressed: () {},
//                    padding: EdgeInsets.all(10),
//                    borderSide: BorderSide(
//                        color: Colors.blueAccent,
//                        width: 1.0,
//                        style: BorderStyle.solid),
//                    shape: new RoundedRectangleBorder(
//                      borderRadius: new BorderRadius.circular(30.0),
//                    )),
//                OutlineButton(
//                    child: new Text(
//                      "Its a Bummer",
//                      style: TextStyle(fontSize: 18),
//                    ),
//                    textColor: Colors.white,
//                    onPressed: () {},
//                    borderSide: BorderSide(
//                        color: Colors.blueAccent,
//                        width: 1.0,
//                        style: BorderStyle.solid),
//                    shape: new RoundedRectangleBorder(
//                      borderRadius: new BorderRadius.circular(30.0),
//                    ))
//              ],
//            )
          ],
        ),
      ),
    );
  }
}
