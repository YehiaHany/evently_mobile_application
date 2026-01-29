class EventModel {
  static const collectionName = "Events";
  String id;
  final String title;
  final String category;
  final DateTime? date;
  final String time;
  final String description;
  bool isFavourite;

  EventModel({
    this.id = "",
    required this.title,
    required this.category,
    required this.date,
    required this.time,
    required this.description,
    this.isFavourite = false,
  });

  EventModel.fromFirestore(Map<String, dynamic> data) :this(
    id: data["data"] ?? "",
    title: data["title"],
    category: data["category"],
    date: DateTime.fromMillisecondsSinceEpoch(data["date"]),
    time: data["time"],
    description: data["description"],
    isFavourite: data["is_favourite"],
  );

  Map<String, dynamic> toFireStore() {
    return {
      "id": id,
      "title": title,
      "category": category,
      "date": date?.millisecondsSinceEpoch, // int
      "time": time,
      "description": description,
      "is_favourite": isFavourite
    };
  }


}
