import 'package:cloud_firestore/cloud_firestore.dart';

getUserData(String id) {
  FirebaseFirestore.instance
      .collection('users')
      .get()
      .then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      if (doc['id'] == id) {}
    });
  });
}
