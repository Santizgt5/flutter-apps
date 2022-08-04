
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trips_app2/Place/model/place.dart';
import 'package:trips_app2/Place/ui/widgets/card_image.dart';
import 'package:trips_app2/User/model/user.dart';
import 'package:trips_app2/User/repository/cloud_firestore_api.dart';

class CloudFirestoreRepository {


    final _cloudFirestoreAPI = CloudFirestoreAPI();

    void updateUserDataFirestore(User user) => _cloudFirestoreAPI.updateUserData(user);
    Future<void> updatePlaceDate(Place place) => _cloudFirestoreAPI.updatePlaceDate(place);
    Stream<QuerySnapshot> placeListStream() => _cloudFirestoreAPI.placeListStream();
    List<CardImage> buildPlaces(List<DocumentSnapshot> placeListSnapshot) => _cloudFirestoreAPI.buildPlaces(placeListSnapshot);


}