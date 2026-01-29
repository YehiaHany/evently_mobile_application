import 'package:cloud_firestore/cloud_firestore.dart';

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

  static Future<void> addEventToFireStore(EventModel event) {
    CollectionReference<EventModel> collectionReference = getEventsCollection();
    DocumentReference<EventModel> doc = collectionReference.doc();
    event.id = doc.id;
    return doc.set(event);
  }
}
