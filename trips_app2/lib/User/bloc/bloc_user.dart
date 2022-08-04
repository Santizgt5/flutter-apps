import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips_app2/Place/model/place.dart';
import 'package:trips_app2/Place/repository/firebase_storage_repository.dart';
import 'package:trips_app2/Place/ui/widgets/card_image.dart';
import 'package:trips_app2/User/model/user.dart' as userModel;
import 'package:trips_app2/User/repository/auth_repository.dart';
import 'package:trips_app2/User/repository/cloud_firestore_repository.dart';

class UserBloc implements Bloc {

  final _auth_repository = AuthRepository();

  //Flujo de datos - Streams
  //Stream - Firebase
  //StreamController
  Stream<User?> streamFirebase = FirebaseAuth.instance.authStateChanges();
  Stream<User?> get authStatus => streamFirebase;
  Future<User?> currentUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    return user;
  }
  Stream<QuerySnapshot> placesListStream() => _cloudFirestoreRepository.placeListStream();
  
  //Casos de uso
  // 1. Sign in a la aplicacion Google

  Future<User?> signIn() => _auth_repository.signInFirebase();
  

  final _cloudFirestoreRepository = CloudFirestoreRepository();
  void updateUserData(userModel.User user) => _cloudFirestoreRepository.updateUserDataFirestore(user);

  Future<void> updatePlaceDate(Place place) => _cloudFirestoreRepository.updatePlaceDate(place);
  final _firebaseStorageRepository = FirebaseStorageRepository();
  Future<UploadTask> uploadFile(String path, File image) => _firebaseStorageRepository.uploadFile(path, image);
  List<CardImage> buildPlaces(List<DocumentSnapshot> placeListSnapshot) => _cloudFirestoreRepository.buildPlaces(placeListSnapshot);

  signOut() { 
    return _auth_repository.signOut();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

}