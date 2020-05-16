import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:night_life/models/club.dart';
import 'package:night_life/models/event.dart';

class DatabaseService {

  //club collection reference
  final CollectionReference clubCollection = Firestore.instance.collection('clubs');

  //event collection reference
  final CollectionReference eventCollection = Firestore.instance.collection('events');

  //club list from snapshot
  List<Club> _clubListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc) => Club(
      name: doc.data['name'] ?? '',
      type: doc.data['type'] ?? '',
      location: doc.data['location'] ?? '',
      alcoholPrice: doc.data['alcohol_price'] ?? 0
    )).toList();
  }

  //event list from snapshot
  List<Event> _eventListFromSnapShot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc) => Event(
      eventName: doc.data['name'] ?? '',
      theme: doc.data['theme'] ?? '',
      entranceFee: doc.data['entrance_fee'] ?? '',
      date: doc.data['date'] ?? '',
      alcoholPrice: doc.data['alcohol_price'] ?? 0
    )).toList();
  }

  //get clubs stream
  Stream<List<Club>> get clubs {
    return clubCollection.snapshots().map(_clubListFromSnapshot);
  }

  //get events stream
  Stream<List<Event>> get events {
    return eventCollection.snapshots().map(_eventListFromSnapShot);
  }


}
