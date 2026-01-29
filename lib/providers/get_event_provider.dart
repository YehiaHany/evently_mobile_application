import 'package:evently/firebase_utils.dart';
import 'package:flutter/foundation.dart';

import '../model/event_model.dart';
import '../model/tab_bar_model.dart';

class GetEventProvider extends ChangeNotifier {
  List<EventModel> events = [];
  List<EventModel> filterList = [];
  int selectedIndex = 0;

  void getAllEventsFromFireStore() async {
    var querySnapShot = await FirebaseUtils.getEventsCollection().get();
    events =
        querySnapShot.docs.map((doc) {
          return doc.data();
        }).toList();
    filterList = events;
    filterList.sort((event1, event2) {
      return event1.date!.compareTo(event2.date!);
    });
    notifyListeners();
  }

  void getFilterList() async {
    var querySnapShot = await FirebaseUtils.getEventsCollection().get();
    events =
        querySnapShot.docs.map((doc) {
          return doc.data();
        }).toList();
    filterList =
        events.where((event) {
          return event.category == TabBarModel.tabs[selectedIndex];
        }).toList();
    filterList.sort((event1, event2) {
      return event1.date!.compareTo(event2.date!);
    });
    notifyListeners();
  }

  void getFilterList1() async {
    var querySnapShot =
        await FirebaseUtils.getEventsCollection()
            .orderBy("date", descending: false)
            .where("category", isEqualTo: TabBarModel.tabs[selectedIndex])
            .get();
    filterList =
        querySnapShot.docs.map((doc) {
          return doc.data();
        }).toList();
    notifyListeners();
  }

  void changeIndex(int index) {
    selectedIndex = index;
    selectedIndex == 0 ? getAllEventsFromFireStore() : getFilterList();
  }
}
