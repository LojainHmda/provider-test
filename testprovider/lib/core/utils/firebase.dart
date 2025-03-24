import 'package:cloud_firestore/cloud_firestore.dart'
    show CollectionReference, FirebaseFirestore;
import 'package:testprovider/core/models/event_model.dart';

class FirebaseUtils {
  static List eventsList = [];

  static CollectionReference<EventModel> getEventCollection() {
    return FirebaseFirestore.instance
        .collection(EventModel.collectionName)
        .withConverter<EventModel>(
          fromFirestore: (snapshot, _) =>
              EventModel.fromfireStore(snapshot.data()!),
          toFirestore: (event, _) => event.tofireStore(),
        );
  }

  static Future<void> addEventCollection(EventModel event) {
    var collections = getEventCollection();
    var docRaf = collections.doc();
    event.id = docRaf.id;
    return docRaf.set(event);
  }
}
