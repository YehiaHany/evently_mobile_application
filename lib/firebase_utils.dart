import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/model/my_user.dart';

import 'model/event_model.dart';

class FirebaseUtils {
  static CollectionReference<EventModel> getEventsCollection() {
    return FirebaseFirestore.instance
        .collection(EventModel.collectionName)
        .withConverter<EventModel>(
          fromFirestore:
              (snapshot, _) => EventModel.fromFirestore(snapshot.data()!),
          toFirestore: (event, options) => event.toFireStore(),
        );
  }

  static CollectionReference<MyUser> getUserCollection() {
    return FirebaseFirestore.instance
        .collection(MyUser.collectionName)
        .withConverter<MyUser>(
          fromFirestore:
              (snapshot, _) => MyUser.fromFireStore(snapshot.data()!),
          toFirestore: (user, options) => user.toFireStore(),
        );
  }

  static Future<void> addEventToFireStore(EventModel event) {
    CollectionReference<EventModel> collectionReference = getEventsCollection();
    DocumentReference<EventModel> doc = collectionReference.doc();
    event.id = doc.id;
    return doc.set(event);
  }

  static Future<void> addUserToFireStore(MyUser user) {
    return getUserCollection().doc(user.id).set(user);
  }

  static Future<MyUser?> getUserFromFireStore(String uId) async {
    var querySnapShot = await getUserCollection().doc(uId).get();
    return querySnapShot.data();
  }
}
