import 'package:evently/firebase_utils.dart';
import 'package:flutter/foundation.dart';

import '../model/event_model.dart';
import '../model/tab_bar_model.dart';

class EventProvider extends ChangeNotifier {
  List<EventModel> events = [];
  List<EventModel> filterList = [];
  List<EventModel> favouriteList = [];
  int selectedIndex = 0;

  void getAllEventsFromFireStore(String uId) async {
    var querySnapShot = await FirebaseUtils.getEventsCollection(uId).get();
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

  // void getFilterList(String uId) async {
  //   var querySnapShot = await FirebaseUtils.getEventsCollection(uId).get();
  //   events =
  //       querySnapShot.docs.map((doc) {
  //         return doc.data();
  //       }).toList();
  //   filterList =
  //       events.where((event) {
  //         return event.category == TabBarModel.tabs[selectedIndex];
  //       }).toList();
  //   filterList.sort((event1, event2) {
  //     return event1.date!.compareTo(event2.date!);
  //   });
  //   notifyListeners();
  // }

  void getFavouriteList(String uId) async {
    var querySnapShot =
    await FirebaseUtils.getEventsCollection(uId)
            .where("is_favourite", isEqualTo: true)
            .get();
    favouriteList =
        querySnapShot.docs.map((doc) {
          return doc.data();
        }).toList();
    notifyListeners();
  }

  void getFilterList1(String uId) async {
    var querySnapShot =
    await FirebaseUtils.getEventsCollection(uId)
            .orderBy("date", descending: false)
            .where("category", isEqualTo: TabBarModel.tabs[selectedIndex])
            .get();
    filterList =
        querySnapShot.docs.map((doc) {
          return doc.data();
        }).toList();
    notifyListeners();
  }

  void updateIsFavourite(EventModel event, String uId) {
    FirebaseUtils.getEventsCollection(uId)
        .doc(event.id)
        .update({"is_favourite": !event.isFavourite}).then((value) {
      selectedIndex == 0 ? getAllEventsFromFireStore(uId) : getFilterList1(uId);
      getFavouriteList(uId);
    })
        .timeout(
          Duration(milliseconds: 100),
          onTimeout: () {
            selectedIndex == 0
                ? getAllEventsFromFireStore(uId)
                : getFilterList1(uId);
            getFavouriteList(uId);
          },
        );
  }

  void changeIndex(int index, String uId) {
    selectedIndex = index;
    selectedIndex == 0 ? getAllEventsFromFireStore(uId) : getFilterList1(uId);
  }
}
