import 'package:flutter/material.dart';
import '../screens/places_view.dart';
import '../screens/home_view.dart';

class BottomNav extends StatefulWidget{

  int _latestIndex;

  BottomNav(this._latestIndex);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BottomNavState();
  }
}

class BottomNavState extends State<BottomNav>{

  void _onItemTapped(int index) {
    setState(() {
      widget._latestIndex = index;
    });

    switch(index) {
      case 0:
//        Navigator.push(context, MaterialPageRoute(builder: (_) => MyApp()));
      print('null');
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (_) => PlacesView()));
        break;
      case 2:
        return null;
      case 3:
        return null;
        break;

      default:
        print('Invalid entry');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.blueAccent,
      unselectedItemColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem> [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home', style: TextStyle(color: Colors.white),)
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.not_listed_location),
            title: Text('Places',  style: TextStyle(color: Colors.white))
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            activeIcon: Icon(Icons.favorite),
            title: Text('Favorites',  style: TextStyle(color: Colors.white))
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            title: Text('Profile',
                style: TextStyle(color: Colors.white))
        ),
      ],
      currentIndex: widget._latestIndex,
      onTap: _onItemTapped,
    );
  }
}