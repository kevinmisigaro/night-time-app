import 'package:flutter/material.dart';
import 'package:night_life/screens/favorites_view.dart';
import 'package:night_life/screens/home_view.dart';
import 'package:night_life/screens/places_view.dart';
import 'package:night_life/screens/profile_view.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomePage(),
    PlacesView(),
    FavoritesView(),
    ProfileView()
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(
                'Home',
                style: TextStyle(color: Colors.white),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.not_listed_location),
              title: Text('Places', style: TextStyle(color: Colors.white))),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              activeIcon: Icon(Icons.favorite),
              title: Text('Favorites', style: TextStyle(color: Colors.white))),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              title: Text('Profile', style: TextStyle(color: Colors.white))),
        ],
      ),
    );
  }
}
