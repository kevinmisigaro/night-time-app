import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:night_life/widgets/bottonNavigation.dart';

class PlacesView extends StatefulWidget{

//  int currentPageIndex;
//
//  PlacesView({this.currentPageIndex});


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PlacesViewState();
  }
}

class _PlacesViewState extends State<PlacesView>{

  List<String> _partyPlaces = [
    'Kidimbiwi', 'Samaki Samaki', 'Havoc', 'Maison', 'Tipsy', 'Wingman'
  ];



  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20,),
        child: Column(
          children: <Widget>[

            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Places',
                style: GoogleFonts.roboto(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.white
                ),
              ),
            ),

            SizedBox(height: 20,),

            ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: _partyPlaces.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(_partyPlaces[index], style: GoogleFonts.roboto(color: Colors.yellowAccent, fontSize: 20,),),
                  );
                }
            )

          ],
        ),
      ),
      bottomNavigationBar: BottomNav(1),
    );
  }
}