
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trips_app2/Place/model/place.dart';
import 'package:trips_app2/Place/ui/widgets/card_image.dart';
import 'package:trips_app2/User/model/user.dart' as userModel;

class CloudFirestoreAPI {

  final String USERS = "users";
  final String PLACES = "places";

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<QuerySnapshot> placeListStream() {
    User? user = _auth.currentUser;
    return _db.collection(PLACES).where('userOwner', isEqualTo: _db.collection(USERS).doc(user?.uid)).snapshots();
  }

  void updateUserData(userModel.User user) async {
    DocumentReference ref = _db.collection(USERS).doc(user.uid);
    return ref.set({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photoURL': user.photoURL,
      'myPlaces': user.myPlaces,
      'myFavoritePlaces': user.myFavoritePlaces,
      'lastSignIn': DateTime.now()
    }, SetOptions(merge: true));
  } 

  Future<void> updatePlaceDate(Place place) async {
    CollectionReference refPlace = _db.collection(PLACES);
    User? user = _auth.currentUser;
    await refPlace.add({
      'name': place.name,
      'description': place.description,
      'likes': place.likes,
      'userOwner': _db.doc("${USERS}/${user?.uid}"),
      'urlImage': place.urlImage
    }).then((DocumentReference dr) {
        dr.get().then((DocumentSnapshot snapshot) {
            snapshot.id; //Id place Referencia Array
            DocumentReference refUsers = _db.collection(USERS).doc(user!.uid);
            refUsers.update({
              'myPlaces': FieldValue.arrayUnion([_db.doc("$PLACES/${snapshot.id}")])
            });
        });
    });
  }

  List<CardImage> buildPlaces(List<DocumentSnapshot> placeListSnapshot) {
    List<CardImage> cardImages = [];
    int count = 0;
    placeListSnapshot.forEach((p) { 
      cardImages.add(CardImage(pathImage: p['urlImage'], iconData: Icons.favorite_border, onPressedFabIcon: () {},
        place: Place(
          name: p['name'],
          description: p['description'],
          likes: p['likes'] 
      ),heightC: 214.0, widthC: 350.0, like: false, first: count == 0 ? true : false,));
      count++;
    });
    return cardImages;
  }

}