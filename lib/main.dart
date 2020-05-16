import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:night_life/models/event.dart';
import 'package:night_life/models/user.dart';
import 'package:night_life/screens/favorites_view.dart';
import 'package:night_life/screens/home_view.dart';
import 'package:night_life/screens/places_view.dart';
import 'package:night_life/screens/profile_view.dart';
import 'package:night_life/services/authentication_service.dart';
import 'package:night_life/services/database.dart';
import 'package:night_life/wrapper.dart';
import 'package:provider/provider.dart';
import './models/club.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiProvider(
      providers: [
        StreamProvider<User>.value(value: AuthenticationService().user),
        StreamProvider<List<Club>>.value(value: DatabaseService().clubs),
        StreamProvider<List<Event>>.value(value: DatabaseService().events),
      ],
      child: MaterialApp(
        home: Wrapper(),
      ),
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

  Widget appBarText(String text) {
    return Text(
      '$text',
      style:
          GoogleFonts.roboto(color: Colors.white, fontWeight: FontWeight.w600),
    );
  }

  Widget appBarTitle(int index) {
    switch (index) {
      case 0:
        return null;
        break;
      case 1:
        return appBarText('Places');
        break;
      case 2:
        return appBarText('Favorites');
        break;
      case 3:
        return appBarText('Your Profile');
        break;
      default:
        return null;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: appBarTitle(_currentIndex),
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
