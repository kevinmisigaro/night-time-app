import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:night_life/models/club.dart';

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

  //get clubs stream
  Stream<List<Club>> get clubs {
    return clubCollection.snapshots().map(_clubListFromSnapshot);
  }

  //get events stream
  Stream<QuerySnapshot> get events {
    return eventCollection.snapshots();
  }


}
