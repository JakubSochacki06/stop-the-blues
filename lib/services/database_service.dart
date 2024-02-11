import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> setUserDataFromGoogle(User user) async {
    print('witam');
    var doc = await _db.collection('users_data').doc(user.email).get();
    print('aha??????');
    if (doc.exists) return;
    await _db.collection('users_data').doc(user.email).set({
      'displayName': user.displayName,
      'email': user.email,
      'photoURL': user.photoURL,
    });
  }

  Future<void> setUserDataFromEmail(User user) async{
    var doc = await _db.collection('users_data').doc(user.email).get();
    if (doc.exists) return;
    print('test');
    List<String> parts = user.email!.split("@");
    String displayName = parts[0];
    print('aha');
    await _db.collection('users_data').doc(user.email).set({
      'displayName': displayName,
      'email': user.email,
      'photoURL': 'https://img.freepik.com/premium-vector/account-icon-user-icon-vector-graphics_292645-552.jpg',
    });
  }

  Future<dynamic> getDataFromDatabase(
      String collection, String documentID, String field) async {
    await for (var snapshot in _db.collection(collection).snapshots()) {
      for (var message in snapshot.docs) {
        if (message.id == documentID) {
          return message.data()[field];
        }
      }
    }
  }

  Future<void> updateDataToDatabase(String email, String field, dynamic value) async{
    await _db.collection('users_data').doc(email).update({
      field:value,
    });
  }

}